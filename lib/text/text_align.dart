// text_align.dart -- TextAlign identity functions
// by allen brunson  december 24 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextAlign functions                                                   ***/
/*                                                                            */
/******************************************************************************/

TextAlign emptyTextAlign() {
    return TextAlign.left;
}

bool isTextAlign(dynamic textAlign) {
    return (textAlign is TextAlign);
}

TextAlign sanitizeTextAlign(dynamic textAlign) {
    if (isTextAlign(textAlign)) return textAlign;
    return emptyTextAlign();
}
