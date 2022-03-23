abstract class CalcState {
  const CalcState();
}

class LoadingState extends CalcState {
  const LoadingState();
}

class LoadedState extends CalcState {
  final int result;

  const LoadedState(this.result);
}

class NotLoadedState extends CalcState {
  final String message;

  const NotLoadedState(this.message);
}