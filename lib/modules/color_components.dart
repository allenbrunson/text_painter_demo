// color_components.dart -- color components extension
// by allen brunson  december 31 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  ColorComponents extension                                             ***/
/*                                                                            */
/******************************************************************************/

extension ColorComponents on Color
{
    int get intAlpha {
        return doubleToInt8(this.a);
    }

    int get intBlue {
        return doubleToInt8(this.b);
    }

    int get intGreen {
        return doubleToInt8(this.g);
    }

    int get intRed {
        return doubleToInt8(this.r);
    }

    int get intValue {
        return this.intAlpha << 24 |
         this.intRed << 16 |
         this.intGreen << 8 |
         this.intBlue << 0;
    }
}


/******************************************************************************/
/*                                                                            */
/***  ColorComponents extension                                             ***/
/*                                                                            */
/******************************************************************************

overview
--------

in flutter version 3.27, released december 2024, the flutter maintainers made a
major change to the Color class so that it can support a wider range of colors
and color spaces. part of that change was deprecating the int getters. i don't
like that part of the change. i plan to use the int getters indefinitely. so
here's my extension that restores them.

  https://docs.flutter.dev/release/breaking-changes/wide-gamut-framework

*/
