import Foundation

public enum EscapeSequence {
    public static let clearScreen = "\u{1b}[2J"

    public static let enableAlternateBuffer = "\u{1b}[?1049h"
    public static let disableAlternateBuffer = "\u{1b}[?1049l"

    public static let showCursor = "\u{1b}[?25h"
    public static let hideCursor = "\u{1b}[?25l"

    public static func moveTo(_ position: Position) -> String {
        "\u{1b}[\(position.line + 1);\(position.column + 1)H"
    }

    public static func setForegroundColor(_ color: ANSIColor) -> String {
        "\u{1b}[\(color.foregroundCode)m"
    }

    public static func setBackgroundColor(_ color: ANSIColor) -> String {
        "\u{1b}[\(color.backgroundCode)m"
    }

    public static func setForegroundColor(red: Int, green: Int, blue: Int) -> String {
        "\u{1b}[38;2;\(red);\(green);\(blue)m"
    }

    public static func setBackgroundColor(red: Int, green: Int, blue: Int) -> String {
        "\u{1b}[48;2;\(red);\(green);\(blue)m"
    }

    public static func setForegroundColor(xterm: Int) -> String {
        "\u{1b}[38;5;\(xterm)m"
    }

    public static func setBackgroundColor(xterm: Int) -> String {
        "\u{1b}[48;5;\(xterm)m"
    }

    public static let enableBold = "\u{1b}[1m"
    public static let disableBold = "\u{1b}[22m"
    public static let enableItalic = "\u{1b}[3m"
    public static let disableItalic = "\u{1b}[23m"
    public static let enableUnderline = "\u{1b}[4m"
    public static let disableUnderline = "\u{1b}[24m"
    public static let enableStrikethrough = "\u{1b}[9m"
    public static let disableStrikethrough = "\u{1b}[29m"
    public static let enableInverted = "\u{1b}[7m"
    public static let disableInverted = "\u{1b}[27m"
}
