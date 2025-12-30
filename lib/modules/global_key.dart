// global_key.dart -- GlobalKey utility functions
// by allen brunson  december 9 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  GlobalKey utility functions                                           ***/
/*                                                                            */
/******************************************************************************/

BuildContext? globalKeyCurrentContext(GlobalKey? globalKey) {
    try {
        return globalKey?.currentContext;
    }
    catch (e) {
        return null;
    }
}

Offset? globalKeyLocalOffset(GlobalKey? globalKey, Offset global) {
    try {
        final data = globalKeyCurrentContext(globalKey)?.findRenderObject();
        if (data == null) return null;
        final rbox = objectOfType<RenderBox>(data);
        if (rbox == null) return null;
        return rbox.globalToLocal(global);
    }
    catch (e) {
        return null;
    }
}

Size? globalKeySize(GlobalKey? globalKey) {
    try {
        return globalKeyCurrentContext(globalKey)?.size;
    }
    catch (e) {
        return null;
    }
}
