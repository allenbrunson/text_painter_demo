// app_widget.dart -- text_painter_demo app widget
// by allen brunson  january 3 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  AppWidget class                                                       ***/
/*                                                                            */
/******************************************************************************/

class AppWidget extends StatefulWidget
{
    // constructor

    const AppWidget({super.key});

    // public instance methods

    @override State<AppWidget> createState() {
        return _AppWidgetState();
    }
}

class _AppWidgetState extends State<AppWidget>
{
    // instance variables

    StreamSubscription<ThemeChanged>? tsub = null;

    // constructor

    _AppWidgetState();

    // public instance methods

    @override Widget build(BuildContext context) {
        return MaterialApp(debugShowCheckedModeBanner:false,
         home:const HomeWidget(), theme:this._themeData(),
         title:appTitle());
    }

    @override void dispose() {
        this.tsub = cancelSubscription(this.tsub);
        super.dispose();
    }

    @override void initState() {
        super.initState();
        this.tsub = subscribe<ThemeChanged>(this.reload);
    }

    bool ready() {
        return this.mounted;
    }

    void reload() {
        if (this.ready()) this.setState((){});
    }

    // private instance methods

    ThemeData _themeData() {
        final data = ColorScheme.fromSeed(seedColor:Colors.cyan);
        return ThemeData(colorScheme:data, useMaterial3:materialThree());
    }
}


/******************************************************************************/
/*                                                                            */
/***  AppWidget helper functions                                            ***/
/*                                                                            */
/******************************************************************************/

String appTitle() {
    return "TextPainter Demo";
}


/******************************************************************************/
/*                                                                            */
/***  AppWidget class                                                       ***/
/*                                                                            */
/******************************************************************************

overview
--------

this is the root widget for this demo app.

*/
