// text_painter.dart -- text painter creator
// by allen brunson  november 25 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextPainter creator                                                   ***/
/*                                                                            */
/******************************************************************************/

// you must call TextPainter.dispose() when finished with this

TextPainter textPainterFromText(Text text) {
    return TextPainter(ellipsis:null,
     locale:text.locale,
     maxLines:text.maxLines,
     strutStyle:text.strutStyle,
     text:_text(text),
     textAlign:sanitizeTextAlign(text.textAlign),
     textDirection:sanitizeTextDirection(text.textDirection),
     textHeightBehavior:text.textHeightBehavior,
     textScaler:_textScaler(text.textScaler),
     textWidthBasis:sanitizeTextWidthBasis(text.textWidthBasis));
}


/******************************************************************************/
/*                                                                            */
/***  TextPainter parameter functions                                       ***/
/*                                                                            */
/******************************************************************************/

InlineSpan _text(Text text) {
    return TextSpan(text:stringFromText(text), style:textStyleFromText(text));
}

TextScaler _textScaler(TextScaler? textScaler) {
    if (isTextScaler(textScaler)) {
        return sanitizeTextScaler(textScaler);
    }
    else {
        return screenMediaQueryData().textScaler;
    }
}


/******************************************************************************/
/*                                                                            */
/***  text painter creator                                                  ***/
/*                                                                            */
/******************************************************************************

overview
--------

creates a TextPainter from a Text object. the properties of the returned object
must match the Text object exactly so that we can accurately predict the size of
the Text object when it is added to a widget tree.

*/
