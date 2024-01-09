// double.dart -- double identity functions
// by allen brunson  january 4 2024


/******************************************************************************/
/*                                                                            */
/***  double identity functions                                             ***/
/*                                                                            */
/******************************************************************************/

// absolute value

double doubleAbs(double? value) {
    return sanitizeDouble(value).abs();
}

// round up to nearest whole number

double doubleCeil(double? value) {
    return sanitizeDouble(value).ceilToDouble();
}

// round down to nearest whole number

double doubleFloor(double? value) {
    return sanitizeDouble(value).floorToDouble();
}

// round up or down to nearest whole value

double doubleRound(double? value) {
    return sanitizeDouble(value).roundToDouble();
}

// convert a double to an int

int doubleToInt(double? value) {
    return sanitizeDouble(value).toInt();
}

// return the integer part of a double, minus fractional part

int doubleToIntPart(double? value) {
    return sanitizeDouble(value).truncate();
}

// true if this is a double

bool isDouble(dynamic value) {
    return (value is double);
}

// sanitize a double value

double sanitizeDouble(dynamic value) {
    if (isDouble(value)) return value;
    return 0.0;
}
