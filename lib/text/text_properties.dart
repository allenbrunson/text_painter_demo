// text_properties.dart -- text widget property functions
// by allen brunson  march 1 2019

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  text widget property functions                                        ***/
/*                                                                            */
/******************************************************************************/

String stringFromText(Text text) {
    if (text.textSpan == null) {
        return sanitizeString(text.data);
    }
    else {
        final buff = text.textSpan?.toPlainText(includePlaceholders:false);
        return sanitizeString(buff);
    }
}

TextStyle textStyleFromText(Text text) {
    if (text.textSpan == null) {
        return sanitizeTextStyle(text.style);
    }
    else {
        return sanitizeTextStyle(text.textSpan?.style);
    }
}
