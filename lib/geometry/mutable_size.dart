// mutable_size.dart -- MutableSize object
// by allen brunson  november 22 2018

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  MutableSize class                                                     ***/
/*                                                                            */
/******************************************************************************/

class MutableSize
{
    // instance variables

    double width;
    double height;

    // constructor

    MutableSize(this.width, this.height);

    // static constructors

    static MutableSize fromSize(Size size) {
        return MutableSize(size.width, size.height);
    }

    static MutableSize get zero {
        return fromSize(Size.zero);
    }

    // instance methods

    void addHeight(double height) {
        this.height += height;
    }

    void addInsets(EdgeInsets edge) {
        this.height += edgeInsetsHeight(edge);
        this.width += edgeInsetsWidth(edge);
    }

    void addSize(Size size) {
        this.height += size.height;
        this.width += size.width;
    }

    void addWidth(double width) {
        this.width += width;
    }

    void removeInsets(EdgeInsets edge) {
        this.height -= edgeInsetsHeight(edge);
        this.width -= edgeInsetsWidth(edge);
    }

    Size size() {
        return Size(this.width, this.height);
    }
}


/******************************************************************************/
/*                                                                            */
/***  MutableSize helper functions                                          ***/
/*                                                                            */
/******************************************************************************/

MutableSize mutableSize(Size size) {
    return MutableSize.fromSize(size);
}


/******************************************************************************/
/*                                                                            */
/***  MutableSize class                                                     ***/
/*                                                                            */
/******************************************************************************

overview
--------

when you need to do complicated math to determine the final size of something,
the fact that Size is immutable is a giant pain in the ass. hello, MutableSize.

*/
