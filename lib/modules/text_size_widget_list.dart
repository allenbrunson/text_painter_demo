// text_size_widget_list.dart -- text size examples
// by allen brunson  january 6 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextSizeWidget list                                                   ***/
/*                                                                            */
/******************************************************************************/

List<Widget> textSizeWidgetList() {
    final list = <Widget>[];
    const edge = DividerWidget();
    for (final item in _textSizeWidgetList()) {
        list.add(item);
        list.add(edge);
    }
    return list;
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

String _fontTestLine() {
    return "AaYyMmFfGgJjWw";
}

TextSizeWidget _item(int lineCount, TextStyle textStyle) {
    return textSizeWidget(_text(lineCount), textStyle);
}

String _text(int lineCount) {
    final buff = StringBuffer();
    for (int ival = 0; ival < lineCount; ival++) {
        buff.writeln(_fontTestLine());
    }
    return trimString(buff.toString());
}

List<TextSizeWidget> _textSizeWidgetList() {
    final list = <TextSizeWidget>[];
    list.add(_item(1, textStylePlain(24.0)));
    list.add(_item(2, textStyleBold(23.0)));
    list.add(_item(3, textStyleItalic(20.0)));
    return list;
}


/******************************************************************************/
/*                                                                            */
/***  TextSizeWidget list                                                   ***/
/*                                                                            */
/******************************************************************************

overview
--------

this module creates a list of TextSizeWidget objects, along with dividers, than
demonstrate the TextPainter issue i believe is broken.

*/
