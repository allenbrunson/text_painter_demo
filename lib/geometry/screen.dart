// screen.dart -- screen functions
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  public screen functions                                               ***/
/*                                                                            */
/******************************************************************************/

// user-selected screen text scale, from device settings

double screenTextScale() {
    return textScalerScaleFactor(screenMediaQueryData().textScaler);
}

// MediaQueryData for the screen

MediaQueryData screenMediaQueryData() {
    final plat = WidgetsBinding.instance.platformDispatcher;
    final view = plat.views.first;
    return MediaQueryData.fromView(view);
}
