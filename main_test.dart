void functionOne() {
  print("Started F01");
  functionTwo();
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
  functionOne();
  print("Finished main");
}