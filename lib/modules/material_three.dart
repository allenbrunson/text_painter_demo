// material_three.dart -- state module
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  module defines                                                        ***/
/*                                                                            */
/******************************************************************************/

@immutable class ThemeChanged {}


/******************************************************************************/
/*                                                                            */
/***  material three state functions                                        ***/
/*                                                                            */
/******************************************************************************/

void fireThemeChangedMessage() {
    EventManager.fire(ThemeChanged());
}

bool materialThree() {
    return _materialThree;
}

void setMaterialThree(bool state) {
    _materialThree = state;
    fireThemeChangedMessage();
}


/******************************************************************************/
/*                                                                            */
/***  private module variables                                              ***/
/*                                                                            */
/******************************************************************************/

bool _materialThree = false;
