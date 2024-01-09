// material_three_widget.dart -- material three selection widget
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  MaterialThreeWidget class                                             ***/
/*                                                                            */
/******************************************************************************/

class MaterialThreeWidget extends StatefulWidget
{
    // constructor

    const MaterialThreeWidget({super.key});

    // public instance methods

    @override State<MaterialThreeWidget> createState() {
        return _MaterialThreeWidgetState();
    }
}

class _MaterialThreeWidgetState extends State<MaterialThreeWidget>
{
    // constructor

    _MaterialThreeWidgetState();

    // public instance methods

    @override Widget build(BuildContext context) {
        return this._body();
    }

    bool ready() {
        return this.mounted;
    }

    // private state methods

    void _checkBoxChanged(bool? state) {
        if (state == null) return;
        if (this.ready() == false) return;
        this.setState((){setMaterialThree(state);});
    }

    // private widget creator methods

    Widget _body() {
        return Row(children:this._rowChildren());
    }

    Widget _checkBox() {
        return Checkbox(onChanged:this._checkBoxChanged,
         tristate:false, value:materialThree());
    }

    List<Widget> _rowChildren() {
        final list = <Widget>[];
        list.add(titleText("Material Three"));
        list.add(const Spacer());
        list.add(this._checkBox());
        return list;
    }
}


/******************************************************************************/
/*                                                                            */
/***  MaterialThreeWidget class                                             ***/
/*                                                                            */
/******************************************************************************

overview
--------

this widget allows the user to toggle material three state on or off, for
demonstration purposes.

*/
