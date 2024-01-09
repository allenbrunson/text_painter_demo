// paint_creators.dart -- paint creator functions
// by allen brunson  april 8 2019

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  paint creator functions                                               ***/
/*                                                                            */
/******************************************************************************/

Paint paintFill(Color color) {
    final data = Paint();
    data.color = color;
    data.style = PaintingStyle.fill;
    return data;
}

Paint paintRoundStroke(Color color, {double strokeWidth = 5.0}) {
    final data = Paint();
    data.color = color;
    data.strokeCap = StrokeCap.round;
    data.strokeWidth = strokeWidth;
    data.style = PaintingStyle.stroke;
    return data;
}

Paint paintSquareStroke(Color color, {double strokeWidth = 2.0}) {
    final data = Paint();
    data.color = color;
    data.strokeCap = StrokeCap.square;
    data.strokeWidth = strokeWidth;
    data.style = PaintingStyle.stroke;
    return data;
}
