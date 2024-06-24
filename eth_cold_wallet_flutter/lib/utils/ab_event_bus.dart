import 'dart:async';

class ABEventBus {
  // 使用多订阅流的形式，这种流可以有多个监听器监听（
  final _streamController = StreamController.broadcast();

  // 定义一个单例
  static final ABEventBus _instance = ABEventBus._internal();
  ABEventBus._internal();

  factory ABEventBus() {
    return _instance;
  }


  // 发布事件
  static void fire(event) {
    _instance._streamController.add(event);
  }

  // 订阅事件
  static StreamSubscription on<T>(void Function(T) onData) {
    return _instance._streamController.stream.where((event) => event is T).listen((e) {
      onData(e);
    });
  }
}


class ABEvent {
  final String id;
  final String name;
  final dynamic data;

  const ABEvent({this.id = "", this.name = "", this.data});
}


/*
//订阅：
late StreamSubscription _subscription;
_subscription = ABEventBus.on<ABEvent>((event) {
  print('订阅事件: ${event.data}');
});

// 取消订阅：
_subscription.cancel();

// 发布：
ABEventBus.fire(ABEvent(id: "1", name: "test", data: "data"));
* */
