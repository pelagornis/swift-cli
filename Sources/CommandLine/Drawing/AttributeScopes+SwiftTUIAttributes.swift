import Foundation

@available(macOS 12, *)
extension AttributeScopes {
    public struct UIAttributes: AttributeScope, Sendable {
        public let backgroundColor = BackgroundColorAttribute()
        public let foregroundColor = ForegroundColorAttribute()
        public let bold = BoldAttribute()
        public let italic = ItalicAttribute()
        public let strikethrough = StrikethroughAttribute()
        public let underline = UnderlineAttribute()
        public let inverted = InvertedAttribute()
    }
}

@available(macOS 12, *)
extension AttributeScopes.UIAttributes {
    public struct BackgroundColorAttribute: AttributedStringKey, Sendable {
        public typealias Value = Color
        public static let name = "BackgroundColor"
    }

    public struct ForegroundColorAttribute: AttributedStringKey, Sendable {
        public typealias Value = Color
        public static let name = "ForegroundColor"
    }

    public struct BoldAttribute: AttributedStringKey, Sendable {
        public typealias Value = Bool
        public static let name = "Bold"
    }

    public struct ItalicAttribute: AttributedStringKey, Sendable {
        public typealias Value = Bool
        public static let name = "Italic"
    }

    public struct StrikethroughAttribute: AttributedStringKey, Sendable {
        public typealias Value = Bool
        public static let name = "Strikethrough"
    }

    public struct UnderlineAttribute: AttributedStringKey, Sendable {
        public typealias Value = Bool
        public static let name = "Underline"
    }

    public struct InvertedAttribute: AttributedStringKey, Sendable {
        public typealias Value = Bool
        public static let name = "Inverted"
    }
}

@available(macOS 12, *)
public extension AttributeDynamicLookup {
  subscript<T: AttributedStringKey>(dynamicMember keyPath: KeyPath<AttributeScopes.UIAttributes, T>) -> T {
    self[T.self]
  }
}
