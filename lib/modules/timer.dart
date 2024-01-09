// timer.dart -- timing-related functions
// by allen brunson  december 12 2018

import "package:flutter/scheduler.dart";
import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  delay times                                                           ***/
/*                                                                            */
/******************************************************************************/

// animation transition between one view and another

double animationDelay() {
    return 0.25; // just a guess. 0.2 is probably closer to reality
}

// how long to animate a user selection

double selectionDelay() {
    return 0.5;
}


/******************************************************************************/
/*                                                                            */
/***  duration objects                                                      ***/
/*                                                                            */
/******************************************************************************/

Duration durationAnimate() {
    return durationSeconds(animationDelay());
}

Duration durationSeconds(double seconds) {
    return Duration(milliseconds:doubleToInt(seconds * 1000.0));
}


/******************************************************************************/
/*                                                                            */
/***  run later functions                                                   ***/
/*                                                                            */
/******************************************************************************/

// execute 'callback' after transition animation delay

void runAfterAnimationDelay(VoidCallback callback) {
    runAfterDelay(animationDelay(), callback);
}

// execute 'callback' after 'seconds' delay

void runAfterDelay(double seconds, VoidCallback callback) {
    Timer(durationSeconds(seconds), callback);
}

// frameCallback is called exactly once

void runAfterFrame(VoidCallback frameCallback) {
    final proc = (Duration timeStamp) {frameCallback();};
    SchedulerBinding.instance.addPostFrameCallback(proc);
}

// execute 'callback' after selection delay

void runAfterSelectionDelay(VoidCallback callback) {
    runAfterDelay(selectionDelay(), callback);
}


/******************************************************************************/
/*                                                                            */
/***  periodic timer functions                                              ***/
/*                                                                            */
/******************************************************************************/

Timer? cancelPeriodicTimer(Timer? timer) {
    timer?.cancel();
    return null;
}

Timer? periodicTimer(double duration, VoidCallback timerProc) {
    if (duration <= 0.0) return null;
    return Timer.periodic(durationSeconds(duration), (_){timerProc();});
}
