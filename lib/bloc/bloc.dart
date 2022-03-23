import 'dart:async';

import '../service.dart';
import 'events.dart';
import 'state.dart';

class Bloc {
  final _eventStreamCtrl = StreamController<Event>();
  StreamSink<Event> get sink => _eventStreamCtrl.sink;
  Stream<Event> get _stream => _eventStreamCtrl.stream;

  final _stateStreamCtrl = StreamController<CalcState>();  
  StreamSink<CalcState> get _sink => _stateStreamCtrl.sink;
  Stream<CalcState> get stream => _stateStreamCtrl.stream;


  Bloc() {
    _stream.listen((ev) async { 
      if (ev is Sum) {
        _sink.add(const LoadingState());
        final result = await Service().summ(ev.a, ev.b);
        _sink.add(LoadedState(result));
      } else if (ev is Sub) {
        _sink.add(const LoadingState());
        final result = await Service().sub(ev.a, ev.b);
        _sink.add(LoadedState(result));
      }
    });
  }
}