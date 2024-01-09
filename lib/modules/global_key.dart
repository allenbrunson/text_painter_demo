// global_key.dart -- GlobalKey utility functions
// by allen brunson  december 9 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  GlobalKey utility functions                                           ***/
/*                                                                            */
/******************************************************************************/

Offset? globalKeyGlobalToLocal(GlobalKey? globalKey, Offset global) {
    try {
        final data = globalKey!.currentContext!.findRenderObject();
        final RenderBox rbox = (data as RenderBox);
        return rbox.globalToLocal(global);
    }
    catch (e) {
        return null;
    }
}

Size? globalKeySize(GlobalKey? globalKey) {
    try {
        return globalKey!.currentContext!.size;
    }
    catch (e) {
        return null;
    }
}
