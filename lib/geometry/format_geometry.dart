// format_geometry.dart -- geometry formatting
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  geometry element formatting functions                                 ***/
/*                                                                            */
/******************************************************************************/

String emptyGeometryElement() {
    return "<none>";
}

String formatGeometry(double? value, [int intLen = 1, int fractionLen = 2]) {
    if (value == null) return emptyGeometryElement();
    final text = sanitizeDouble(value).toStringAsFixed(fractionLen);
    final plen = max(fractionLen + intLen + 1, 1);
    return text.padLeft(plen, "0");
}
