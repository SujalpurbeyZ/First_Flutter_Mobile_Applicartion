import 'package:material_ui/material_ui.dart';

import '../app.dart';
import 'arithmetic_page.dart';
import 'circlearea_page.dart';
import 'simpleinterest_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  void _openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => page),
    );
  }

  Widget _calculatorButton({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 88,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 17),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Second App')),
      body: AppBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
            
             
              const SizedBox(height: 28),
              _calculatorButton(
                icon: Icons.calculate_outlined,
                title: 'Arithmetic',
                description: 'Add, subtract, multiply, or divide',
                onPressed: () => _openPage(context, const ArithemeticPage()),
              ),
              const SizedBox(height: 16),
              _calculatorButton(
                icon: Icons.percent,
                title: 'Simple interest',
                description: 'Calculate interest from amount, rate, and time',
                onPressed: () => _openPage(context, const SimpleInterest()),
              ),
              const SizedBox(height: 16),
              _calculatorButton(
                icon: Icons.circle_outlined,
                title: 'Area of a circle',
                description: 'Find the area using the circle’s radius',
                onPressed: () => _openPage(context, const CircleArea()),
              ),
              const SizedBox(height: 24),
         
            ],
          ),
        ),
      ),
    );
  }
}