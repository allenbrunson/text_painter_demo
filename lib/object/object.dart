// object.dart -- object identity functions
// by allen brunson  february 26 2019


/******************************************************************************/
/*                                                                            */
/***  object identity functions                                             ***/
/*                                                                            */
/******************************************************************************/

bool isObject(dynamic value) {
    return objectIsNotNull(value);
}

bool objectIsNotNull(dynamic value) {
    return objectIsNull(value) == false;
}

bool objectIsNull(dynamic value) {
    return value == null;
}

bool objectIsType(dynamic object, List<dynamic> objectList) {
    for (final example in objectList) {
        if (object.runtimeType == example.runtimeType) return true;
    }
    return false;
}

T? objectOfType<T>(dynamic object) {
    if (object is T) return object;
    return null;
}

Object? sanitizeObject(dynamic value) {
    if (value is Object) return value;
    return null;
}
