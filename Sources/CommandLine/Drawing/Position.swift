import Foundation

public struct Position: Equatable {
    var column: Extended
    var line: Extended

    public static var zero: Position { Position(column: 0, line: 0) }
}

extension Position: CustomStringConvertible {
    public var description: String { "(\(column), \(line))" }
}

extension Position: AdditiveArithmetic {
    public static func +(lhs: Self, rhs: Self) -> Self {
        Position(column: lhs.column + rhs.column, line: lhs.line + rhs.line)
    }

    public static func - (lhs: Position, rhs: Position) -> Position {
        Position(column: lhs.column - rhs.column, line: lhs.line - rhs.line)
    }
}
