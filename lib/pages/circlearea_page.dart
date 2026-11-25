import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../app.dart';

class CircleArea extends StatefulWidget {
  const CircleArea({super.key});

  @override
  State<CircleArea> createState() => _CircleAreaState();
}

class _CircleAreaState extends State<CircleArea> {
  final TextEditingController radiusController = TextEditingController();

  String result = '';

  void calculateArea() {
    final double? radius = double.tryParse(radiusController.text);

    if (radius == null) {
      setState(() => result = 'Please enter a number for the radius.');
      return;
    }

    if (radius < 0) {
      setState(() => result = 'Radius cannot be a negative number.');
      return;
    }

    // Circle area formula: π × radius × radius.
    final double area = math.pi * radius * radius;
    setState(() => result = 'Circle area: ${formatNumber(area)}');
  }

  @override
  void dispose() {
    radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Area of a circle')),
      body: AppBackground(
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
         
              
                const SizedBox(height: 18),
                TextField(
                  controller: radiusController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 19, 178, 59)),
                  decoration: const InputDecoration(
                    labelText: 'Radius',
                    hintText: 'Enter the distance from center to edge',
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: calculateArea,
                    child: const Text('Calculate area'),
                  ),
                ),
                const SizedBox(height: 18),
                ResultPanel(text: result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}