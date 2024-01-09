// edge_insets.dart -- EdgeInsets functions
// by allen brunson  october 27 2020

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  EdgeInsets functions                                                  ***/
/*                                                                            */
/******************************************************************************/

EdgeInsets edgeInsetsFromSidesAndBottom(double side, double bottom) {
    return EdgeInsets.fromLTRB(side, side, side, bottom);
}

EdgeInsets edgeInsetsFromWidthHeight(double width, double height) {
    return EdgeInsets.symmetric(horizontal:width, vertical:height);
}

double edgeInsetsHeight(EdgeInsets edge) {
    return edge.top + edge.bottom;
}

String edgeInsetsString(EdgeInsets? edge) {
    if (edge == null) return emptyGeometryElement();
    return "left: ${formatGeometry(edge.left)} "
     "top: ${formatGeometry(edge.top)} "
     "right: ${formatGeometry(edge.right)} "
     "bottom: ${formatGeometry(edge.bottom)}";
}

double edgeInsetsWidth(EdgeInsets edge) {
    return edge.left + edge.right;
}

bool isEdgeInsets(dynamic edgeInsets) {
    return (edgeInsets is EdgeInsets);
}

EdgeInsets sanitizeEdgeInsets(dynamic edgeInsets) {
    if (isEdgeInsets(edgeInsets)) return edgeInsets;
    return EdgeInsets.zero;
}
