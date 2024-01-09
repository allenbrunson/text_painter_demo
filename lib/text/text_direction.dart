// text_direction.dart -- TextDirection identity functions
// by allen brunson  december 24 2023

import "package:text_painter_demo/text_painter_demo.dart";

TextDirection emptyTextDirection() {
    return TextDirection.ltr;
}

bool isTextDirection(dynamic textDirection) {
    return (textDirection is TextDirection);
}

TextDirection sanitizeTextDirection(dynamic textDirection) {
    if (isTextDirection(textDirection)) return textDirection;
    return emptyTextDirection();
}
