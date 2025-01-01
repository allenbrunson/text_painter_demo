// num.dart -- num identity functions
// by allen brunson  september 22 2020

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  num identity functions                                                ***/
/*                                                                            */
/******************************************************************************/

// force 'mid' to the range 'min' to 'max'

num clamp(num? min, num? mid, num? max) {
    return sanitizeNum(mid).clamp(sanitizeNum(min), sanitizeNum(max));
}

bool isNum(dynamic value) {
    return (value is num);
}

double numToDouble(num? value) {
    if (value == null) return 0.0;
    return value.toDouble();
}

int numToInt(num? value) {
    if (value == null) return 0;
    return value.toInt();
}

num parseNum(String? value) {
    return sanitizeNum(num.tryParse(sanitizeString(value)));
}

num sanitizeNum(dynamic value) {
    return sanitizeToNum(value, 0);
}

num sanitizeToNum(dynamic value, num replacementValue) {
    if (isNum(value)) return value;
    return replacementValue;
}
