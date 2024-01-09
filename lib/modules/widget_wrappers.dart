// widget_wrappers.dart -- widget wrapper functions
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  widget wrapper functions                                              ***/
/*                                                                            */
/******************************************************************************/

// add a background color to 'child'

Widget backgroundColorWidget(Widget child, Color? backgroundColor) {
    if (backgroundColor == null) return child;
    return ColoredBox(child:child, color:backgroundColor);
}

// border widget with the given padding

Widget borderWidgetInsets(Widget child, EdgeInsets edgeInsets) {
    return Padding(child:child, padding:edgeInsets);
}

// add padding pixels to the left and right of 'child'

Widget borderWidgetWidth(Widget child, double side) {
    return borderWidgetInsets(child, EdgeInsets.fromLTRB(side, 0.0, side, 0.0));
}

// widget that is 'height' pixels tall and one pixel wide

Widget heightBox(double height) {
    return SizedBox.fromSize(size:Size(1.0, height));
}

// force 'child' to be at least minHeight pixels tall

Widget minimumHeightBox(Widget? child, double minHeight) {
    final data = BoxConstraints(minHeight:minHeight);
    return ConstrainedBox(child:child, constraints:data);
}

// put "child" on top of "widget", both are centered

Widget stackCentered(Widget widget, Widget child) {
    final list = [Center(child:widget), Positioned(child:Center(child:child))];
    return Stack(children:list);
}

// widget that is 'width' pixels wide and one pixel tall

Widget widthBox(double width) {
    return SizedBox.fromSize(size:Size(width, 1.0));
}
