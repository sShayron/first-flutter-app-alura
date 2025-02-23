import 'dart:io';

void main() {
  print("Insira o primeiro numero:");
  double numeroUm = 0;
  double numeroDois = 0;
  String operacao = "";
  String? entrada = stdin.readLineSync();
  List<String> operacoes = ["+", "-", "*", "/"];

  if (entrada != null) {
    if (entrada != "") {
      numeroUm = double.parse(entrada);
    }
  }

  void getOperacao() {
    print("Insira o tipo de operacao com os numeros(${operacoes.toString()}):");
    entrada = stdin.readLineSync();

    if (entrada != null) {
      if (operacoes.contains(entrada)) {
        operacao = entrada!;
      } else {
        print("Operacao invalida");
        getOperacao();
      }
    }
  }

  getOperacao();

  print("Insira o segundo numero:");

  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numeroDois = double.parse(entrada!);
    }
  }

  print("O resultado da operacao e:");
  calculate(numeroUm, numeroDois, operacao);
}

void calculate(double numeroUm, double numeroDois, String operacao) {
  switch (operacao) {
    case "+":
      soma(numeroUm, numeroDois);
      break;
    case "-":
      subtracao(numeroUm, numeroDois);
      break;
    case "*":
      multiplicacao(numeroUm, numeroDois);
      break;
    case "/":
      divisao(numeroUm, numeroDois);
      break;
  }
}

void soma(double numeroUm, double numeroDois) {
  print(numeroUm + numeroDois);
}

void subtracao(double numeroUm, double numeroDois) {
  print(numeroUm - numeroDois);
}

void divisao(double numeroUm, double numeroDois) {
  print(numeroUm / numeroDois);
}

void multiplicacao(double numeroUm, double numeroDois) {
  print(numeroUm * numeroDois);
}

void numberDouble(double number) {
  print("O dobro de $number e ${number * 2}");
}
