// text_width_basis.dart -- TextWidthBasis identity functions
// by allen brunson  december 24 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextWidthBasis identity functions                                     ***/
/*                                                                            */
/******************************************************************************/

TextWidthBasis emptyTextWidthBasis() {
    return TextWidthBasis.parent;
}

bool isTextWidthBasis(dynamic textWidthBasis) {
    return (textWidthBasis is TextWidthBasis);
}

TextWidthBasis sanitizeTextWidthBasis(dynamic textWidthBasis) {
    if (isTextWidthBasis(textWidthBasis)) return textWidthBasis;
    return emptyTextWidthBasis();
}
