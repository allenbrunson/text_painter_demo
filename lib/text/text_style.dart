// text_style.dart -- text style functions
// by allen brunson  december 9 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextStyle identity functions                                          ***/
/*                                                                            */
/******************************************************************************/

TextStyle emptyTextStyle() {
    return const TextStyle();
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
    return TextStyle(color:color, fontWeight:FontWeight.bold, fontSize:fontSize);
}

TextStyle textStyleItalic(double fontSize, [Color? color]) {
    return TextStyle(color:color, fontStyle:FontStyle.italic, fontSize:fontSize);
}

TextStyle textStylePlain(double fontSize, [Color? color]) {
    return TextStyle(color:color, fontStyle:FontStyle.normal, fontSize:fontSize);
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
