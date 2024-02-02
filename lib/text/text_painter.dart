// text_painter.dart -- text painter creator
// by allen brunson  november 25 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextPainter creator                                                   ***/
/*                                                                            */
/******************************************************************************/

// you must call TextPainter.dispose() when finished with this

TextPainter textPainterFromText(BuildContext context, Text text) {
    return TextPainter(ellipsis:null,
     locale:text.locale,
     maxLines:text.maxLines,
     strutStyle:text.strutStyle,
     text:_text(context, text),
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

InlineSpan _text(BuildContext context, Text text) {
    return TextSpan(text:stringFromText(text), style:_textStyle(context, text));
}

TextScaler _textScaler(TextScaler? textScaler) {
    if (isTextScaler(textScaler)) {
        return sanitizeTextScaler(textScaler);
    }
    else {
        return screenMediaQueryData().textScaler;
    }
}

TextStyle _textStyle(BuildContext context, Text text) {
    if (debugMergeStyles()) {
        return _textStyleMerge(context, text);
    }
    else {
        return _textStylePlain(context, text);
    }
}

TextStyle _textStyleMerge(BuildContext context, Text text) {
    final data = DefaultTextStyle.of(context);
    return data.style.merge(textStyleFromText(text));
}

TextStyle _textStylePlain(BuildContext context, Text text) {
    return textStyleFromText(text);
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
