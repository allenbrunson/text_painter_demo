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
    return color.a <= 0.0;
}

// new color with an updated alpha value

Color colorWithAlpha(Color color, int alpha) {
    return color.withAlpha(alpha);
}


/******************************************************************************/
/*                                                                            */
/***  color functions                                                       ***/
/*                                                                            */
/******************************************************************************

overview
--------

functions for dealing with color objects

*/
