// text_size_widget.dart -- text size demo widget
// by allen brunson  november 21 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextSizeWidget class                                                  ***/
/*                                                                            */
/******************************************************************************/

class TextSizeWidget extends StatefulWidget
{
    // final instance variables

    final Text text;
    final TextSizeData textSizeData;

    // constructor

    const TextSizeWidget({required this.text,
     required this.textSizeData, super.key});

    // public instance methods

    @override State<TextSizeWidget> createState() {
        return _TextSizeWidgetState();
    }

    Size innerSize() {
        final size = MutableSize.fromSize(this.textSizeData.size);
        size.addSize(const Size(40.0, 85.0));
        return sizeCeil(size.size());
    }
}

class _TextSizeWidgetState extends State<TextSizeWidget>
{
    // instance variables

    GlobalKey? globalKey = null;
    Size? textSizeFinal = null;
    StreamSubscription<ThemeChanged>? tsub = null;

    // constructor

    _TextSizeWidgetState();

    // public instance methods

    @override Widget build(BuildContext context) {
        if (this.ready() == false) return const Center();
        runAfterFrame(this._afterBuild);
        return this._body();
    }

    @override void dispose() {
        this.globalKey = null;
        this.tsub = cancelSubscription(this.tsub);
        super.dispose();
    }

    @override void initState() {
        super.initState();
        this.globalKey = GlobalKey();
        this.tsub = subscribe<ThemeChanged>(this.themeChanged);
    }

    bool ready() {
        return this.mounted;
    }

    void reload() {
        if (this.ready()) this.setState((){});
    }

    void themeChanged() {
        runAfterDelay(1.0, this.themeChangedProc);
    }

    void themeChangedProc() {
        this.textSizeFinal = null;
        this.reload();
    }

    // private state methods

    void _afterBuild() {
        if (this.ready() == false) return;
        if (sizeValid(this.textSizeFinal)) return;
        this.textSizeFinal = globalKeySize(this.globalKey);
        this.reload();
    }

    String _contents() {
        final buff = StringBuffer();
        buff.writeln(textStyleString(this.widget.text.style));
        buff.writeln("actual: ${sizeString(this.textSizeFinal)}");
        buff.writeln("computed: ${sizeString(this.widget.textSizeData.size)}");
        buff.writeln("diff: ${sizeString(this._diff())}");
        return trimString(buff.toString());
    }

    Size _diff() {
        final size = sanitizeSize(this.textSizeFinal);
        return sizeSubtractSize(this.widget.textSizeData.size, size);
    }

    // private widget creators

    Widget _body() {
        const edge = EdgeInsets.all(16.0);
        return borderWidgetInsets(this._bodyInner(), edge);
    }

    Widget _bodyInner() {
        return Center(child:this._size(this._outer(this._column())));
    }

    Column _column() {
        return Column(children:this._columnChildren());
    }

    List<Widget> _columnChildren() {
        final high = heightBox(6.0);
        final list = <Widget>[];
        list.add(high);
        list.add(this._child1());
        list.add(high);
        list.add(this._child2());
        list.add(high);
        return list;
    }

    Widget _child1() {
        final chd1 = this._textRect();
        final chd2 = this._textColor(this._textWidget());
        return stackCentered(chd1, chd2);
    }

    Widget _child2() {
        final text = Text(this._contents(), textAlign:TextAlign.center);
        final fbox = FittedBox(child:text);
        final bord = borderWidgetWidth(fbox, 6.0);
        return Expanded(child:bord);
    }

    Widget _outer(Widget child) {
        final colr = colorWithAlpha(Colors.blue, 100);
        return backgroundColorWidget(child, colr);
    }

    Widget _size(Widget child) {
        return SizedBox.fromSize(child:child, size:this.widget.innerSize());
    }

    Widget _textWidget() {
        final buff = stringFromText(this.widget.text);
        final styl = this.widget.text.style;
        return _text(buff, sanitizeTextStyle(styl), key:this.globalKey);
    }

    Widget _textColor(Widget child) {
        final colr = colorWithAlpha(Colors.grey, 150);
        return backgroundColorWidget(child, colr);
    }

    Widget _textRect() {
        return TextRectWidget(textSizeData:this.widget.textSizeData);
    }
}


/******************************************************************************/
/*                                                                            */
/***  TextSizeWidget helper functions                                       ***/
/*                                                                            */
/******************************************************************************/

TextSizeWidget textSizeWidget(BuildContext context, String string,
 TextStyle textStyle)
{
    final text = _text(string, textStyle);
    final data = textSizeData(context, text);
    return TextSizeWidget(text:text, textSizeData:data);
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

Text _text(String string, TextStyle textStyle, {Key? key}) {
    final span = TextSpan(text:string, style:textStyle);
    return Text.rich(span, key:key, style:textStyle, textAlign:TextAlign.center);
}


/******************************************************************************/
/*                                                                            */
/***  TextSizeWidget                                                        ***/
/*                                                                            */
/******************************************************************************

overview
--------

this widget is for testing the textSizeData() function, which should give you
the size that is needed to render a Text object. alas, the material3 style has
broken that function, so i need this thing.


maintenance notes
-----------------

for some reason, when we change the theme style from material2 to material3, it
takes a really long time to settle down. hence, the very long delay between the
catching the event and updating this widget's state. without that delay, this
widget's reported contents will always be stale, if the user has ever switched
the style.

this widget is only for demonstration purposes, so i am not going to worry about
it too much.

*/
