// int.dart -- int identity functions
// by allen brunson  january 4 2024


/******************************************************************************/
/*                                                                            */
/***  int identity functions                                                ***/
/*                                                                            */
/******************************************************************************/

bool isInt(dynamic value) {
    return (value is int);
}

int sanitizeInt(dynamic value) {
    if (isInt(value)) return value;
    return 0;
}
