# Swift CLI

![Official](https://badge.pelagornis.com/official.svg)
![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)
![Swift](https://img.shields.io/badge/Swift-6.1-orange.svg)
[![License](https://img.shields.io/github/license/pelagornis/swift-cli)](https://github.com/pelagornis/swift-cli/blob/main/LICENSE)

A SwiftUI-inspired framework for building interactive command-line applications in Swift. This framework provides a declarative, reactive approach to creating terminal-based user interfaces with familiar SwiftUI concepts.

## Features

- **SwiftUI-like Syntax**: Use familiar `@State`, `@Environment`, and view modifiers
- **Interactive Controls**: Buttons, text fields, and other interactive elements
- **Layout System**: VStack, HStack, and other layout containers
- **Styling**: Colors, padding, borders, and text formatting
- **Event Handling**: Keyboard input and focus management
- **Cross-platform**: Works on macOS and Linux

## Requirements

- Swift 6.1+
- macOS 12.0+ or Linux

## Installation

Add this package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/pelagornis/swift-cli.git", from: "0.1.0")
]
```

## Quick Start

```swift
import CommandLine

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 1) {
            Text("Counter: \(count)")
                .foregroundColor(.green)
                .bold()

            HStack {
                Button("Increment") {
                    count += 1
                }

                Button("Decrement") {
                    count -= 1
                }
            }
        }
        .padding()
        .border()
    }
}

Application(rootView: ContentView()).start()
```

## Core Concepts

### Views

Views are the building blocks of your UI. The framework provides several view types:

#### Text

```swift
Text("Hello, World!")
    .foregroundColor(.blue)
    .bold()
    .italic()
```

#### Buttons

```swift
Button("Click me") {
    print("Button pressed!")
}

// With custom label
Button(action: { /* action */ }) {
    HStack {
        Text("Custom")
        Text("Button")
    }
}
```

#### Text Fields

```swift
TextField { input in
    print("User entered: \(input)")
}
```

### Layout

#### VStack (Vertical Stack)

```swift
VStack(spacing: 1) {
    Text("First item")
    Text("Second item")
    Text("Third item")
}
```

#### HStack (Horizontal Stack)

```swift
HStack {
    Text("Left")
    Spacer()
    Text("Right")
}
```

### State Management

#### @State

```swift
struct MyView: View {
    @State private var isVisible = false
    @State private var counter = 0

    var body: some View {
        VStack {
            if isVisible {
                Text("Counter: \(counter)")
            }
            Button("Toggle") {
                isVisible.toggle()
                counter += 1
            }
        }
    }
}
```

#### @Environment

```swift
struct MyView: View {
    @Environment(\.foregroundColor) private var textColor

    var body: some View {
        Text("This text uses the environment color")
            .foregroundColor(textColor)
    }
}
```

### Modifiers

Apply modifiers to customize the appearance and behavior of views:

```swift
Text("Styled Text")
    .foregroundColor(.red)
    .bold()
    .italic()
    .underline()
    .padding(2)
    .border()
    .background(.blue)
```

#### Available Modifiers

- **Text Formatting**: `.bold()`, `.italic()`, `.underline()`, `.strikethrough()`
- **Colors**: `.foregroundColor()`, `.background()`
- **Layout**: `.padding()`, `.border()`, `.fixedFrame()`, `.flexibleFrame()`
- **Environment**: `.setEnvironment()`

### Application Lifecycle

```swift
import CommandLine

@MainActor
class MyApp {
    static func main() {
        Application(rootView: ContentView()).start()
    }
}
```

## Advanced Features

### Custom Controls

Create custom interactive controls by conforming to the `Control` protocol:

```swift
struct CustomControl: View, PrimitiveView {
    var body: some View {
        // Your custom implementation
    }

    func buildNode(_ node: Node) {
        // Setup your control
    }
}
```

### Event Handling

Handle keyboard events and focus management:

```swift
Button("Interactive") {
    // Action when button is pressed
} hover: {
    // Action when button is hovered
}
```

### Styling

Use colors and styling to create rich interfaces:

```swift
VStack {
    Text("Success")
        .foregroundColor(.green)
    Text("Warning")
        .foregroundColor(.yellow)
    Text("Error")
        .foregroundColor(.red)
}
.padding()
.border()
.background(.blue)
```

## Examples

### Simple Counter

```swift
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 1) {
            Text("Count: \(count)")
                .bold()

            HStack {
                Button("-") { count -= 1 }
                Button("+") { count += 1 }
            }
        }
        .padding()
        .border()
    }
}
```

### Form Input

```swift
struct FormView: View {
    @State private var name = ""
    @State private var email = ""

    var body: some View {
        VStack(spacing: 1) {
            Text("Registration Form")
                .bold()
                .foregroundColor(.blue)

            HStack {
                Text("Name:")
                TextField { name = $0 }
            }

            HStack {
                Text("Email:")
                TextField { email = $0 }
            }

            Button("Submit") {
                print("Name: \(name), Email: \(email)")
            }
        }
        .padding()
        .border()
    }
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

**swift-cli** is under MIT license. See the [LICENSE](LICENSE) file for more info.
