// color_functions.dart -- color functions
// by allen brunson  december 21 2018

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  color functions                                                       ***/
/*                                                                            */
/******************************************************************************/

// this color's brightness value

double colorBrightness(Color color) {
    return HSLColor.fromColor(color).lightness;
}

// create a color from r/g/b/a values

Color colorInt(int r, int g, int b, [int a = 255]) {
    return Color.fromARGB(a, r, g, b);
}

// true if this color is transparent

bool colorIsTransparent(Color color) {
    return color.alpha <= 0;
}

// color to a displayable hexadecimal string

String colorString(Color? color) {
    if (color == null) return emptyGeometryElement();
    final text = color.value.toRadixString(16).padLeft(8, "0");
    return "0x${text.toUpperCase()}";
}

// new color with an updated alpha value

Color colorWithAlpha(Color color, int alpha) {
    return colorInt(color.red, color.green, color.blue, alpha);
}

bool isColor(dynamic color) {
    return (color is Color);
}

Color sanitizeColor(dynamic color) {
    if (isColor(color)) return color;
    return Colors.transparent;
}
