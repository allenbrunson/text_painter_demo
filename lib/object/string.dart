// string.dart -- string identity functions
// by allen brunson  january 4 2024


/******************************************************************************/
/*                                                                            */
/***  string identity functions                                             ***/
/*                                                                            */
/******************************************************************************/

bool isString(dynamic string) {
    return (string is String);
}

String sanitizeString(dynamic string) {
    if (string is String) return string;
    return "";
}

String trimString(dynamic string) {
    return sanitizeString(string).trim();
}
