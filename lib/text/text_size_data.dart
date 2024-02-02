// text_size_data.dart -- text size data
// by allen brunson  december 14 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextSizeData class                                                    ***/
/*                                                                            */
/******************************************************************************/

@immutable class TextSizeData
{
    // final instance variables

    final Size size;
    final double lineHeight;
    final bool overflow;

    // construction

    const TextSizeData(this.size, this.lineHeight, this.overflow);

    static TextSizeData empty() {
        return const TextSizeData(Size.zero, 0.0, false);
    }

    static TextSizeData fromTextPainter(TextPainter textPainter) {
        final line = textPainter.preferredLineHeight;
        final over = textPainter.didExceedMaxLines;
        final size = textPainter.size;
        return TextSizeData(size, line, over);
    }

    // public instance methods

    double height(int lineCount) {
        return this.lineHeight * lineCount.toDouble();
    }

    bool lineHeightValid() {
        return _heightValid(this.lineHeight);
    }

    bool sizeValid() {
        return _heightValid(this.size.height) && _widthValid(this.size.width);
    }

    bool valid() {
        return this.lineHeightValid() && this.sizeValid();
    }
}


/******************************************************************************/
/*                                                                            */
/***  TextSizeData public helper functions                                  ***/
/*                                                                            */
/******************************************************************************/

TextSizeData emptyTextSizeData() {
    return TextSizeData.empty();
}

bool isTextSizeData(dynamic textSizeData) {
    return (textSizeData is TextSizeData);
}

TextSizeData sanitizeTextSizeData(dynamic textSizeData) {
    if (isTextSizeData(textSizeData)) return textSizeData;
    return emptyTextSizeData();
}

TextSizeData textSizeData(BuildContext context, Text text,
 {double minWidth = 0.0, double maxWidth = double.infinity})
{
    final pntr = textPainterFromText(context, text);
    pntr.layout(maxWidth:maxWidth, minWidth:minWidth);
    final data = TextSizeData.fromTextPainter(pntr);
    pntr.dispose();
    return data;
}



/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

bool _heightValid(double height) {
    return height >= 4.0;
}

bool _widthValid(double width) {
    return width >= 0.0;
}


/******************************************************************************/
/*                                                                            */
/***  TextSizeData class                                                    ***/
/*                                                                            */
/******************************************************************************

overview
--------

sizing-related data taken from a TextPainter object.

*/
