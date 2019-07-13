class CounterState {
  final int count;
  CounterState({this.count = 0});
  factory CounterState.initial() => CounterState(count: 0);
}
