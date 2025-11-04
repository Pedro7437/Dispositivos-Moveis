import 'package:flutter/material.dart';
import 'calculadora_controller.dart';
import 'calculadora_button.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final controller = CalculadoraController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: Text(
                controller.display,
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CalcButton(label: "AC", color: Colors.grey, onPressed: controller.clear),
                CalcButton(
                  label: "+/-",
                  color: Colors.grey,
                  onPressed: () => controller.changeSignal(),
                ),
                Expanded(
                  // Backspace
                  child: SizedBox(
                    height: 80,
                    child: FloatingActionButton(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      onPressed: () => controller.deteleDigit(),
                      child: const Icon(Icons.backspace),
                    ),
                  ),
                ),
                CalcButton(
                  label: "/",
                  color: Colors.orange,
                  textColor: Colors.white,
                  shape: const CircleBorder(),
                  onPressed: () => controller.setOperation("/"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (var n in ["7", "8", "9"])
                  CalcButton(label: n, onPressed: () => controller.addDigit(n)),
                CalcButton(
                  label: "x",
                  color: Colors.orange,
                  onPressed: () => controller.setOperation("x"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (var n in ["4", "5", "6"])
                  CalcButton(label: n, onPressed: () => controller.addDigit(n)),
                CalcButton(
                  label: "-",
                  color: Colors.orange,
                  onPressed: () => controller.setOperation("-"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (var n in ["1", "2", "3"])
                  CalcButton(label: n, onPressed: () => controller.addDigit(n)),
                CalcButton(
                  label: "+",
                  color: Colors.orange,
                  onPressed: () => controller.setOperation("+"),
                ),
              ],
            ),
          ),

          // Linha 5
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.only(right: 8),
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xFF414141),
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      onPressed: () => controller.addZero(),
                      child: const Text("0", style: TextStyle(fontSize: 25)),
                    ),
                  ),
                ),
                CalcButton(label: ".", onPressed: controller.addDecimal),
                CalcButton(label: "=", color: Colors.orange, onPressed: controller.calculate),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
