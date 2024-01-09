// text_rect_widget.dart -- text rect demo widget
// by allen brunson  december 4 2023

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  _TextRectPainter class                                                ***/
/*                                                                            */
/******************************************************************************/

class _TextRectPainter extends CustomPainter
{
    // final instance variables

    final double lineHeight;

    // constructor

    _TextRectPainter({required this.lineHeight});

    // public instance methods

    @override void paint(Canvas canvas, Size size) {
        this._drawRect(canvas, size);
        this._drawLines(canvas, size);
    }

    @override bool shouldRepaint(_TextRectPainter data) {
        return true;
    }

    // private instance methods

    void _drawLines(Canvas canvas, Size size) {
        final data = paintSquareStroke(Colors.red, strokeWidth:1.0);
        final rect = rectFromSize(size);
        for (int indx = 0; indx < 60; indx++) {
            final line = this._line(rect, indx);
            if (rectContainsLine(rect, line) == false) break;
            canvas.drawLine(line.offset1, line.offset2, data);
        }
    }

    void _drawRect(Canvas canvas, Size size) {
        final data = paintSquareStroke(Colors.purple, strokeWidth:1.0);
        canvas.drawRect(rectFromSize(size), data);
    }

    Line _line(Rect rect, int index) {
        const edge = 4.0;
        final high = ((index + 1) * this.lineHeight) - 1.0;
        final off1 = Offset(rect.left + edge, rect.top + high);
        final off2 = Offset(rect.right - edge, rect.top + high);
        return Line(off1, off2);
    }
}


/******************************************************************************/
/*                                                                            */
/***  TextRectWidget class                                                  ***/
/*                                                                            */
/******************************************************************************/

class TextRectWidget extends StatelessWidget
{
    // final instance variables

    final TextSizeData textSizeData;

    // constructor

    const TextRectWidget({required this.textSizeData, super.key});

    // public instance methods

    @override Widget build(BuildContext context) {
        return this._body();
    }

    // private instance methods

    Widget _body() {
        final size = this.textSizeData.size;
        return SizedBox.fromSize(child:this._painter(), size:size);
    }

    Widget _painter() {
        final data = this._textRectPainter();
        final view = CustomPaint(painter:data, size:this.textSizeData.size);
        return RepaintBoundary(child:ClipRect(child:view));
    }

    _TextRectPainter _textRectPainter() {
        return _TextRectPainter(lineHeight:this.textSizeData.lineHeight);
    }
}


/******************************************************************************/
/*                                                                            */
/***  TextRectWidget                                                        ***/
/*                                                                            */
/******************************************************************************

overview
--------

this widget functions as an overlay that visually depicts the computed size of
a Text object.

most importantly, we draw a one-pixel-wide rect around the edges, based on the
computed size of the Text object. we also draw a one-pixel colored line at the
bottom of every line of the text, based on the computed line height.

*/
