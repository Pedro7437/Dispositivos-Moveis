import 'package:flutter/material.dart';

class CalculadoraController extends ChangeNotifier {
  String display = "";
  double num1 = 0;
  double num2 = 0;
  String operation = "";

  void addDigit(String digit) {
    if (display == "0") {
      display = digit;
    } else {
      display += digit;
    }
    notifyListeners();
  }

  void clear() {
    display = "";
    num1 = 0;
    num2 = 0;
    operation = "";
    notifyListeners();
  }

  void changeSignal() {
    if (display.isNotEmpty) {
      double value = double.tryParse(display) ?? 0;
      value = value * -1;

      if (value % 1 == 0) {
        display = value.toInt().toString();
      } else {
        display = value.toString();
      }

      notifyListeners();
    }
  }

  void setOperation(String op) {
    if (display.isNotEmpty) {
      num1 = double.parse(display);
      operation = op;
      display = "";
      notifyListeners();
    }
  }

  void addDecimal() {
    if (!display.contains(".")) {
      display += ".";
      notifyListeners();
    }
  }

  void addZero() {
    if (display == "" || display != "0") {
      display += "0";
      notifyListeners();
    }
  }

  void calculate() {
    if (display.isEmpty || operation.isEmpty) return;

    num2 = double.parse(display);
    double result = 0;

    switch (operation) {
      case "+":
        result = num1 + num2;
        break;

      case "-":
        result = num1 - num2;
        break;

      case "x":
        result = num1 * num2;
        break;

      case "/":
        if (num2 == 0) {
          display = "Erro";
          notifyListeners();
          return;
        } else {
          result = num1 / num2;
        }
        break;
    }

    if (result % 1 == 0) {
      display = result.toInt().toString();
    } else {
      display = result.toString();
    }

    operation = "";
    notifyListeners();
  }

  void deteleDigit() {
    if (display.isNotEmpty) {
      display = display.substring(0, display.length - 1);
      notifyListeners();
    }
  }
}
