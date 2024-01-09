// divider_widget.dart -- simple divider line widget
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  DividerWidget class                                                   ***/
/*                                                                            */
/******************************************************************************/

class DividerWidget extends StatelessWidget
{
    // constructor

    const DividerWidget({super.key});

    // public instance methods

    @override Widget build(BuildContext context) {
        return backgroundColorWidget(this._body(), Colors.black);
    }

    // private widget creators

    Widget _body() {
        return SizedBox.fromSize(size:const Size.fromHeight(1.0));
    }
}


/******************************************************************************/
/*                                                                            */
/***  Divider class                                                         ***/
/*                                                                            */
/******************************************************************************

simple horizontal divider line.

*/
