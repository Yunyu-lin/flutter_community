import 'package:event_bus/event_bus.dart';

class EventBusUtils{
  static final EventBus _instance= EventBus();
  static EventBus get instance=>_instance;
}

class Login{}

class LogSuccessEvent{}