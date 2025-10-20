// size.dart -- Size functions
// by allen brunson  january 5 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  Size functions                                                        ***/
/*                                                                            */
/******************************************************************************/

bool isSize(dynamic size) {
    return (size is Size);
}

Size sanitizeSize(dynamic size) {
    if (size is Size) return size;
    return Size.zero;
}

Size sizeCeil(Size size) {
    return Size(doubleCeil(size.width), doubleCeil(size.height));
}

String sizeString(Size? size) {
    if (size == null) return emptyGeometryElement();
    return "w: ${formatGeometry(size.width)} h: ${formatGeometry(size.height)}";
}

Size sizeSubtractSize(Size orig, Size sub) {
    return Size(orig.width - sub.width, orig.height - sub.height);
}

bool sizeValid(Size? size) {
    if (size == null) return false;
    return _sideValid(size.width) && _sideValid(size.height);
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

bool _sideValid(double side) {
    return (side >= 1.0) && (side <= 60000.0);
}
