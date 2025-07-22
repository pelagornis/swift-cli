import Foundation

public extension View {
    @MainActor
    func onAppear(_ action: @escaping @Sendable () -> Void) -> some View {
        return OnAppear(content: self, action: action)
    }
}

private struct OnAppear<Content: View>: View, PrimitiveView, @preconcurrency ModifierView {
    let content: Content
    let action: @Sendable () -> Void

    static var size: Int? { Content.size }

    func buildNode(_ node: Node) {
        node.addNode(at: 0, Node(view: content.view))
    }

    func updateNode(_ node: Node) {
        node.view = self
        node.children[0].update(using: content.view)
    }

    func passControl(_ control: Control, node: Node) -> Control {
        if let onAppearControl = control.parent { return onAppearControl }
        let onAppearControl = OnAppearControl(action: action)
        onAppearControl.addSubview(control, at: 0)
        return onAppearControl
    }

    private final class OnAppearControl: Control {
        private let action: @Sendable () -> Void
        private var _didAppear = false
        private let lock = NSLock()

        init(action: @escaping @Sendable () -> Void) {
            self.action = action
            super.init()
        }

        override func size(proposedSize: Size) -> Size {
            children[0].size(proposedSize: proposedSize)
        }

        override func layout(size: Size) {
            super.layout(size: size)
            children[0].layout(size: size)

            lock.lock()
            let alreadyAppeared = _didAppear
            if !alreadyAppeared {
                _didAppear = true
            }
            lock.unlock()

            if !alreadyAppeared {
                let actionCopy = action
                Task { @MainActor in
                    actionCopy()
                }
            }
        }
    }
}
