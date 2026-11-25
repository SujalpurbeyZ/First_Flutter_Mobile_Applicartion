import 'package:material_ui/material_ui.dart';

import '../app.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  String result = '';

  void calculateInterest() {
    final double? principal = double.tryParse(principalController.text);
    final double? rate = double.tryParse(rateController.text);
    final double? time = double.tryParse(timeController.text);

    if (principal == null || rate == null || time == null) {
      setState(() => result = 'Please enter a number in each box.');
      return;
    }

    if (principal < 0 || rate < 0 || time < 0) {
      setState(() => result = 'Please use zero or a positive number.');
      return;
    }

    // Simple interest formula: principal × rate × time ÷ 100.
    final double interest = (principal * rate * time) / 100;
    setState(() => result = 'Simple interest: ${formatNumber(interest)}');
  }

  @override
  void dispose() {
    principalController.dispose();
    rateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  Widget _numberField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: const TextStyle(fontSize: 20, color: AppColors.text),
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple interest')),
      body: AppBackground(
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                
                const SizedBox(height: 18),
                _numberField(
                  controller: principalController,
                  label: 'Principal amount',
                  hint: 'The starting amount of money',
                ),
                const SizedBox(height: 16),
                _numberField(
                  controller: rateController,
                  label: 'Interest rate (%)',
                  hint: 'Rate per year, for example 5',
                ),
            
                _numberField(
                  controller: timeController,
                  label: 'Time (years)',
                  hint: 'How many years',
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: calculateInterest,
                    child: const Text('Calculate interest'),
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