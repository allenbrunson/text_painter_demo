// text_creator.dart -- text object creators
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  text creator functions                                                ***/
/*                                                                            */
/******************************************************************************/

Text plainText(String string, [TextAlign textAlign = TextAlign.left]) {
    return Text(string, style:textStylePlain(17.0), textAlign:textAlign);
}

Text titleText(String string, [TextAlign textAlign = TextAlign.left]) {
    return Text(string, style:textStyleBold(18.0), textAlign:textAlign);
}
