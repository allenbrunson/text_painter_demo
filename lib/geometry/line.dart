// line.dart -- line object
// by allen brunson  april 9 2019

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  Line class                                                            ***/
/*                                                                            */
/******************************************************************************/

@immutable class Line
{
    // final instance variables

    final Offset offset1;
    final Offset offset2;

    // construction

    const Line(this.offset1, this.offset2);

    static Line get zero {
        return const Line(Offset.zero, Offset.zero);
    }

    // static class methods

    static bool compareEquals(Line l1, Line l2) {
        return (l1.offset1 == l2.offset1) && (l1.offset2 == l2.offset2);
    }

    // instance methods

    @override bool operator==(Object other) {
        if (identical(this, other)) return true;
        if (isLine(other) == false) return false;
        return compareEquals(this, sanitizeLine(other));
    }

    @override int get hashCode {
        return Object.hash(this.offset1, this.offset2);
    }
}


/******************************************************************************/
/*                                                                            */
/***  Line helper functions                                                 ***/
/*                                                                            */
/******************************************************************************/

bool isLine(dynamic line) {
    return (line is Line);
}

Line sanitizeLine(dynamic line) {
    if (isLine(line)) return line;
    return Line.zero;
}


/******************************************************************************/
/*                                                                            */
/***  Line class                                                            ***/
/*                                                                            */
/******************************************************************************

overview
--------

erm, it's a line. duh

*/
