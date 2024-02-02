// text_style.dart -- text style functions
// by allen brunson  december 9 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextStyle identity functions                                          ***/
/*                                                                            */
/******************************************************************************/

TextStyle emptyTextStyle() {
    return _override(const TextStyle());
}

bool isTextStyle(dynamic textStyle) {
    return (textStyle is TextStyle);
}

TextStyle sanitizeTextStyle(dynamic textStyle) {
    if (isTextStyle(textStyle)) return textStyle;
    return emptyTextStyle();
}


/******************************************************************************/
/*                                                                            */
/***  TextStyle creators                                                    ***/
/*                                                                            */
/******************************************************************************/

TextStyle textStyleBold(double fontSize, [Color? color]) {
    final data = TextStyle(color:color, fontWeight:FontWeight.bold, fontSize:fontSize);
    return _override(data);
}

TextStyle textStyleItalic(double fontSize, [Color? color]) {
    final data = TextStyle(color:color, fontStyle:FontStyle.italic, fontSize:fontSize);
    return _override(data);
}

TextStyle textStylePlain(double fontSize, [Color? color]) {
    final data = TextStyle(color:color, fontStyle:FontStyle.normal, fontSize:fontSize);
    return _override(data);
}


/******************************************************************************/
/*                                                                            */
/***  TextStyle utility functions                                           ***/
/*                                                                            */
/******************************************************************************/

String textStyleString(TextStyle? original) {
    final data = sanitizeTextStyle(original);
    final size = formatGeometry(data.fontSize);
    final styl = _titleStyle(data);
    final wght = _titleWeight(data);
    return "size: ${size} style: ${styl} weight: ${wght}";
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

TextStyle _override(TextStyle textStyle) {
    if (debugOverrideDefaults() == false) return textStyle;
    return textStyle.copyWith(height:_styleHeight(textStyle),
     letterSpacing:_styleLetterSpacing(textStyle));
}

double _styleHeight(TextStyle textStyle) {
    if (isDouble(textStyle.height)) {
        return sanitizeDouble(textStyle.height);
    }
    else {
        return 1.0;
    }
}

double _styleLetterSpacing(TextStyle textStyle) {
    if (isDouble(textStyle.letterSpacing)) {
        return sanitizeDouble(textStyle.letterSpacing);
    }
    else {
        return 0.0;
    }
}

String _titleStyle(TextStyle textStyle) {
    switch (textStyle.fontStyle) {
        case FontStyle.italic:
        return "italic";
        case FontStyle.normal:
        case null:
        return "normal";
    }
}

String _titleWeight(TextStyle textStyle) {
    if (textStyle.fontWeight is FontWeight) {
        final ival = sanitizeInt(textStyle.fontWeight?.value);
        if (ival >= 600) return "bold";
    }
    return "plain";
}
