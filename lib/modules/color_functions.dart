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
    return colorAlpha(color) <= 0;
}

// color to a displayable hexadecimal string

String colorString(Color? color) {
    if (color == null) return emptyGeometryElement();
    final text = colorValue(color).toRadixString(16).padLeft(8, "0");
    return "0x${text.toUpperCase()}";
}

// new color with an updated alpha value

Color colorWithAlpha(Color color, int alpha) {
    return colorInt(colorRed(color), colorGreen(color),
     colorBlue(color), alpha);
}


/******************************************************************************/
/*                                                                            */
/***  replacements for deprecated color functions                           ***/
/*                                                                            */
/******************************************************************************/

int colorAlpha(Color color) {
    return _floatToInt8(color.a);
}

int colorBlue(Color color) {
    return _floatToInt8(color.b);
}

int colorGreen(Color color) {
    return _floatToInt8(color.g);
}

int colorRed(Color color) {
    return _floatToInt8(color.r);
}

int colorValue(Color color) {
    return _floatToInt8(color.a) << 24 |
     _floatToInt8(color.r) << 16 |
     _floatToInt8(color.g) << 8 |
     _floatToInt8(color.b) << 0;
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
}


/******************************************************************************/
/*                                                                            */
/***  color functions                                                       ***/
/*                                                                            */
/******************************************************************************

overview
--------

functions for dealing with color objects


maintenance notes
-----------------

in flutter version 3.27, released december 2024, the flutter maintainers decided
to remove all the common-sense integer accessor functions. so i wrote my own
replacements. nice try, guys.

*/
