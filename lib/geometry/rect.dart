// rect.dart -- Rect functions
// by allen brunson  january 5 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  Rect functions                                                        ***/
/*                                                                            */
/******************************************************************************/

bool rectContainsLine(Rect rect, Line line) {
    return rect.contains(line.offset1) && rect.contains(line.offset2);
}

Rect rectFromParts(Offset offset, Size size) {
    return Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);
}

Rect rectFromSize(Size size) {
    return rectFromParts(Offset.zero, size);
}
