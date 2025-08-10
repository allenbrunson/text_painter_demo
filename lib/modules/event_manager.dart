// event_manager.dart -- event bus
// by allen brunson  february 28 2019

import "package:event_bus/event_bus.dart";
import "package:text_painter_demo/text_painter_demo.dart";


/******************************************************************************/
/*                                                                            */
/***  module defines                                                        ***/
/*                                                                            */
/******************************************************************************/

typedef ListenProc<T> = void Function(T eventObject);


/******************************************************************************/
/*                                                                            */
/***  EventManager class                                                    ***/
/*                                                                            */
/******************************************************************************/

class EventManager
{
    // public class methods

    static void fire(Object event) {
        _eventBus.fire(event);
    }

    static StreamSubscription<T> listen<T>(ListenProc<T> proc) {
        return _eventBus.on<T>().listen(proc);
    }

    static StreamSubscription<T> subscribe<T>(VoidCallback callback) {
        return listen((T object){callback();});
    }

    // private class variables

    static final EventBus _eventBus = EventBus();
}


/******************************************************************************/
/*                                                                            */
/***  EventManager support functions                                        ***/
/*                                                                            */
/******************************************************************************/

StreamSubscription<T>? cancelSubscription<T>(StreamSubscription<T>? tsub) {
    unawaited(tsub?.cancel());
    return null;
}

StreamSubscription<T> listen<T>(ListenProc<T> proc) {
    return EventManager.listen<T>(proc);
}

StreamSubscription<T> subscribe<T>(VoidCallback callback) {
    return EventManager.subscribe<T>(callback);
}


/******************************************************************************/
/*                                                                            */
/***  EventManager class                                                    ***/
/*                                                                            */
/******************************************************************************

overview
--------

manages the event bus, an implementation of the subscribe/publish model.

  https://pub.dev/packages/event_bus


how to use the event manager
----------------------------

  1) to subscribe to a particular event, call EventManager.subscribe<T>(),
     where T is the event type you want to listen for. if you will need to
     cancel this subscription later, hold on to the StreamSubscription<T> you
     get back.

  2) if you need a copy of the object sent as part of the event, then you want
     to call listen() instead of subscribe(). it otherwise works the same way.

  3) to cancel a subscription, call the cancel() method on your saved
     StreamSubscription<T>, then get rid of it.

  4) to fire an event, call EventManager.fire() with an instance of the object
     that represents the event to be fired. this can be an instance of a class
     that has no member variables and no methods, so it's easy to define new
     event types.

*/
