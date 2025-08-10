// home_widget.dart -- text_painter_demo home widget
// by allen brunson  january 3 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  HomeWidget class                                                      ***/
/*                                                                            */
/******************************************************************************/

class HomeWidget extends StatefulWidget
{
    // constructor

    const HomeWidget({super.key});

    // public instance methods

    @override State<HomeWidget> createState() {
        return _HomeWidgetState();
    }
}

class _HomeWidgetState extends State<HomeWidget>
{
    // constructor

    _HomeWidgetState();

    // public instance methods

    @override Widget build(BuildContext context) {
        return this._scaffold(this._body());
    }

    @override void dispose() {
        this._scrollController?.dispose();
        this._scrollController = null;
        super.dispose();
    }

    @override void initState() {
        super.initState();
        this._scrollController = ScrollController();
    }

    bool ready() {
        return this.mounted;
    }

    void reload() {
        if (this.ready()) this.setState((){});
    }

    void reloadButtonProc() {
        fireThemeChangedMessage();
        this.reload();
    }

    // private widget creator methods

    List<Widget> _actions() {
        final list = <Widget>[];
        list.add(this._reloadButton());
        return list;
    }

    AppBar _appBar() {
        return AppBar(actions:this._actions(),
         backgroundColor:Theme.of(this.context).colorScheme.inversePrimary,
         centerTitle:true,
         title:titleText(appTitle(), TextAlign.center));
    }

    Widget _body() {
        return SafeArea(child:this._scroll(this._row()));
    }

    Column _column() {
        return Column(children:this._columnChildren(),
         crossAxisAlignment:CrossAxisAlignment.start,
         mainAxisAlignment:MainAxisAlignment.start);
    }

    List<Widget> _columnChildren() {
        final edge = heightBox(20.0);
        final list = <Widget>[];
        list.add(edge);
        list.add(this._wrap(const MaterialThreeWidget()));
        list.add(const DividerWidget());
        list.add(this._wrap(const ScreenTextScaleWidget()));
        list.add(const DividerWidget());
        list.addAll(textSizeWidgetList(this.context));
        list.add(edge);
        return list;
    }

    Widget _reloadButton() {
        const icon = Icon(Icons.refresh);
        return IconButton(icon:icon, onPressed:this.reloadButtonProc);
    }

    Row _row() {
        return Row(children:this._rowChildren(),
         crossAxisAlignment:CrossAxisAlignment.start,
         mainAxisAlignment:MainAxisAlignment.start);
    }

    List<Widget> _rowChildren() {
        final list = <Widget>[];
        list.add(const Spacer(flex:1));
        list.add(Flexible(child:this._column(), flex:10));
        list.add(const Spacer(flex:1));
        return list;
    }

    Scaffold _scaffold(Widget child) {
        return Scaffold(appBar:this._appBar(), body:child);
    }

    Widget _scroll(Widget child) {
        return SingleChildScrollView(child:child,
         controller:this._scrollController);
    }

    Widget _wrap(Widget child) {
        return minimumHeightBox(child, 56.0);
    }

    // private instance variables

    ScrollController? _scrollController;
}


/******************************************************************************/
/*                                                                            */
/***  HomeWidget class                                                      ***/
/*                                                                            */
/******************************************************************************

overview
--------

takes up the entire screen, and houses all the content for this demo app.

*/
