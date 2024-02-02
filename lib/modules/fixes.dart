// fixes.dart -- attempted fixes
// by allen brunson  february 2 2024


/******************************************************************************/
/*                                                                            */
/***  attempted fixes                                                       ***/
/*                                                                            */
/******************************************************************************/

// if this function returns true, then we attempt to fix the issue demonstrated
// by this app by merging the Text object's TextStyle with the one that is found
// to be in scope via DefaultTextStyle. personally, i cannot make this work.

bool debugMergeStyles() {
    return false;
}

// if this function returns true, then we attempt to fix the issue by forcing
// every TextStyle created in this app to have enough properties filled in so
// that the diverging defaults are overridden. i am able to get this to work.

bool debugOverrideDefaults() {
    return false;
}
