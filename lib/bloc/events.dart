abstract class Event {
  const Event();
}

class Sum extends Event {
  final int a;
  final int b;

  const Sum(this.a, this.b);
}

class Sub extends Event {
  final int a;
  final int b;

  const Sub(this.a, this.b);
}