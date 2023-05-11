void functionOne() {
  print("Started F01");
   try {
      functionTwo();
    } catch (exception, stackTrace) {
      print(exception);
      print(stackTrace); // rastreamento da pilha do erro
      rethrow; // propaga o erro capturado para a chamada mais abaixo na pilha
    } finally {
      print("Chegou no finally");
    }
  print("Finished F01");
}

void functionTwo() {
  print("Started F02");
  for (int i = 0; i < 5; i++) {
    print(i);
    double amount = double.parse("Not a number");
  }
  print("Finished F02");
}

void main(List<String> args) {
  print("Started main");
  try {
    functionOne();
  } catch (e) {
    print("Tratando erro da FunctionOne na main");
  }
  print("Finished main");
}