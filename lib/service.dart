class Service {
  Future<int> summ(int a, int b) async {
    await Future.delayed(const Duration(seconds: 1));
    return a + b; 
  }

  Future<int> sub(int a, int b) async {
    await Future.delayed(const Duration(seconds: 1));
    return a - b; 
  }
}