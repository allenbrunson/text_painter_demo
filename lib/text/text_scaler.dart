// text_scaler.dart -- TextScaler functions
// by allen brunson  january 4 2024

import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  TextScaler functions                                                  ***/
/*                                                                            */
/******************************************************************************/

TextScaler emptyTextScaler() {
    return TextScaler.noScaling;
}

bool isTextScaler(dynamic textScaler) {
    return (textScaler is TextScaler);
}

TextScaler sanitizeTextScaler(dynamic textScaler) {
    if (isTextScaler(textScaler)) return textScaler;
    return emptyTextScaler();
}

double textScalerScale(TextScaler? textScaler, double fontSize) {
    return sanitizeTextScaler(textScaler).scale(fontSize);
}

double textScalerScaleFactor(TextScaler? textScaler) {
    return textScalerScale(textScaler, 1.0);
}
