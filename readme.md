# TextPainter Demo
by allen brunson • january 2024

I wrote this demo app to illustrate an issue I discovered while using Flutter. To wit: before the advent of material three styling, Text and TextPainter objects produced equivalent results. After material three, they do not.

The heart of this app is one relatively simple function, in this source file:

  `lib/text/text_painter.dart`
  
that has this signature:

  `TextPainter textPainterFromText(BuildContext context, Text text)`  

As you might guess, this function creates a `TextPainter` object from the properties it finds in the `Text` object that is passed in as a parameter. (It needs the `BuildContext` to extract some information from the widget tree that will contain the `Text` object.)

By default, if a `Text` object does not have its own `TextScaler`, then it makes itself larger or smaller depending on the current screen text scale, as set by the user in the iOS or Android settings. So for that reason, if `textPainterFromText()` discovers that the `Text` object it is given does not have its own `TextScaler`, then it uses the one that is currently in effect for the device.

The reason I wrote this function is so that I can determine exactly how big a `Text` object will be, once it is added to a widget tree. It worked perfectly for that task for many years. I wrote a whole lot of code under the assumption that it would continue to work in the same way that it always has.

Then came Flutter version 3.16.0, material three became the default, and it stopped working. If your Flutter app installs a `ThemeData` object that has `useMaterial3` set to true, which is now the default, then calculating the size of `Text` objects, using the `TextPainter` creation function I wrote, no longer works. The size values it returns are way off.

All the code I wrote in this demo app is to demonstrate this change in behavior, between the older material two style and the newer material three style.

In case you don’t want to bother running it, here is what the demo app looks like, when you start it up:

![material two style](material2.png)

The demo app creates three sample `Text` objects, uses `textPainterFromText()` to create matching `TextPainter` objects, and then reports the results. The final rendered size of the `Text` object is reported as “actual,” and the size reported by the TextPainter object is shown as “computed.” Note that the reported sizes are absolutely dead-on, down to the hundredth of a pixel.

Extra credit: if you use the Android or iOS settings app to change the text scale, that should be reported onscreen, after pressing the refresh button. The sizes of the `Text` objects will change, but the sizes reported by `TextPainter` are still dead-on, down to the sub-pixel.

Now, on to the problem. If you press the demo app’s check box, it switches into material three mode, and performs its `TextPainter` calculations again. Now it looks like this:

![material three style](material3.png)

At this point, you can see that a `TextPainter` created from a `Text` no longer reports the same sizes that the `Text` object itself has.

I submitted this issue as a bug: [TextPainter behavior no longer matches Text behavior, when useMaterial3 is true](https://github.com/flutter/flutter/issues/141172).

Thankfully, I got the attention of the Flutter maintainers! One of them helpfully suggested that this issue is due to the fact that `Text` objects added to a widget tree are subject to being modified by the current `DefaultTextStyle` that is in scope for the widget tree it is added to, but `TextPainter` is never added to a widget tree, so it is not. Makes sense.

That person suggested that the fix would be to get the `DefaultTextStyle` that is in scope for the widget tree that the `Text` object is added to, then merge the `DefaultTextStyle` object’s `TextStyle` with the one that is found in the `Text` object itself.

Okay, I tried that. (That is why `textPainterFromText()` needs a `BuildContext` as an input parameter: it must retrieve the `DefaultTextStyle` that is in scope.) Alas, I could not make it work. I tried it both ways: merge the `Text` object’s `TextStyle` with the one from the `DefaultTextStyle`, and vice versa. Either way produces wrong values.

That got me thinking in the right direction, though. As I suspected, the problem is that `Text` and `TextPainter` are now using different sets of defaults. So I decided to tackle the problem in a different way. What if every `TextStyle` I create has all of its important parameters specified, so that the defaults don’t matter anymore? I was able to make this work, thankfully.

Specifically, the values that must always exist in every `TextStyle` to make this issue go away are `height` and `letterSpacing`. If those values do not exist, you should set them to 1.14 and 0.0, respectively. Other values will also work, if you prefer something different.

I added code to apply either of these fixes to the demo app, but they are turned off by default. To enable them, have a look at this source file:

  `lib/modules/fixes.dart`
  
It could be that I incorrectly implemented the `DefaultTextStyle` fix. If you know what I did wrong, I would be happy to implement your changes. Send me a pull request.

Even though I know how to work around this issue, I am still going to call it a bug. Before material three, `Text` and `TextPainter` were equivalent. After, they are not. This is a serious violation of the principle of least surprise. If you look through the bugs filed against Flutter, you can see that I am not the only person who has been bitten by this.
