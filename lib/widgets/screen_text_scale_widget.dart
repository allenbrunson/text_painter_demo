// screen_text_scale_widget.dart -- displays screen text scale
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  ScreenTextScaleWidget class                                           ***/
/*                                                                            */
/******************************************************************************/

class ScreenTextScaleWidget extends StatefulWidget
{
    // constructor

    const ScreenTextScaleWidget({super.key});

    // public instance methods

    @override State<ScreenTextScaleWidget> createState() {
        return _ScreenTextScaleWidgetState();
    }
}

class _ScreenTextScaleWidgetState extends State<ScreenTextScaleWidget>
{
    // instance variables

    StreamSubscription<ThemeChanged>? tsub = null;

    // constructor

    _ScreenTextScaleWidgetState();

    // public instance methods

    @override Widget build(BuildContext context) {
        return this._body();
    }

    @override void dispose() {
        this.tsub = cancelSubscription(this.tsub);
        super.dispose();
    }

    @override void initState() {
        super.initState();
        this.tsub = subscribe<ThemeChanged>(this.themeChanged);
    }

    bool ready() {
        return this.mounted;
    }

    void reload() {
        if (this.ready()) this.setState((){});
    }

    void themeChanged() {
        runAfterDelay(0.2, this.reload);
    }

    // private widget creator methods

    Widget _body() {
        return Row(children:this._rowChildren());
    }

    List<Widget> _rowChildren() {
        final list = <Widget>[];
        list.add(titleText("Screen Text Scale"));
        list.add(const Spacer());
        list.add(plainText(formatGeometry(screenTextScale()), TextAlign.right));
        return list;
    }
}


/******************************************************************************/
/*                                                                            */
/***  ScreenTextScale widget                                                ***/
/*                                                                            */
/******************************************************************************

overview
--------

displays the current screen text scale. this can be set by the user in the
settings for ios and android devices.

*/
