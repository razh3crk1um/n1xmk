{dna, ...}: let
  c = dna.colors;
  f = dna.font;
in ''
  // Theme.qml (Singleton)
  pragma Singleton

  import QtQuick
  import Quickshell

  Singleton {
      readonly property color colorBlack: "${c.black}"
      readonly property color colorRed: "${c.red}"
      readonly property color colorGreen: "${c.green}"
      readonly property color colorYellow: "${c.yellow}"
      readonly property color colorBlue: "${c.blue}"
      readonly property color colorMagenta: "${c.magenta}"
      readonly property color colorCyan: "${c.cyan}"
      readonly property color colorWhite: "${c.white}"
      readonly property color colorBrightBlack: "${c.bright_black}"
      readonly property color colorBrightRed: "${c.bright_red}"
      readonly property color colorBrightGreen: "${c.bright_green}"
      readonly property color colorBrightYellow: "${c.bright_yellow}"
      readonly property color colorBrightBlue: "${c.bright_blue}"
      readonly property color colorBrightMagenta: "${c.bright_magenta}"
      readonly property color colorBrightCyan: "${c.bright_cyan}"
      readonly property color colorBrightWhite: "${c.bright_white}"

      readonly property color colorPanel: "#212324"
      readonly property color colorButton: "#22222a"
      readonly property color colorButtonHover: "#323232"
      readonly property color colorWorkspaceFocused: "#292929"

      readonly property string fontFree: "${f.glyphs.free}"
      readonly property string fontSolid: "${f.glyphs.solid}"
      readonly property string fontBrands: "${f.glyphs.brands}"
      readonly property string fontNerd: "${f.nerd}"
      readonly property int fontSize: ${toString f.size_md}
      readonly property int fontSizeSm: ${toString f.size}

      readonly property int topbarHeight: 24
      readonly property int horizontalPadding: 10
      readonly property int cornerWidth: 12
      readonly property int cornerHeight: 24
  }

''
