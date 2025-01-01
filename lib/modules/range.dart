// range.dart -- range functions
// by allen brunson  december 30 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  range functions                                                       ***/
/*                                                                            */
/******************************************************************************/

// input 0 to 255, output 0.0 to 1.0

double int8ToDouble(int value) {
    return clamp(0, value, 255).toDouble() / 255.0;
}

// input 0.0 to 1.0, output 0 to 255

int doubleToInt8(double value) {
    return (clamp(0.0, value, 1.0).toDouble() * 255.0).round() & 0xFF;
}
