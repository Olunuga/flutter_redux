import 'package:flutter_redux_app/Redux/AppRdx.dart';
import 'package:flutter_redux_app/Redux/CounterRdx/CounterActions.dart';
import 'package:flutter_redux_app/Redux/CounterRdx/CounterState.dart';
import 'package:redux/redux.dart';

Reducer<CounterState> counterReducer = combineReducers<CounterState>([
  new TypedReducer<CounterState, AddCounterAction>(addCountReducers),
]);

//Individual reducers;
CounterState addCountReducers(CounterState counter, AddCounterAction action) {
  CounterState counterState = new CounterState(count: counter.count + 1);
  return counterState;
}
