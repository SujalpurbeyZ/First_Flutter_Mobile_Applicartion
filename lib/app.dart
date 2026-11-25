import 'package:material_ui/material_ui.dart';

/// Shared colors and widgets help all calculator pages look and feel alike.
class AppColors {
  static const Color background = Color.fromARGB(255, 101, 155, 88);
  static const Color backgroundTop = Color.fromARGB(255, 53, 121, 211);
  static const Color button = Color.fromRGBO(23, 200, 203, 1);
  static const Color accent = Color.fromARGB(255, 241, 235, 233);
  static const Color text = Color.fromARGB(255, 7, 92, 144);
  static const Color appBar = Color.fromARGB(255, 131, 50, 237);
}

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(53, 121, 211, 1), AppColors.background],
        ),
      ),
      child: child,
    );
  }
}

/// Shows a short tip or formula inside a soft, rounded panel.
class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xCCF6F0FA),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: AppColors.text),
      ),
    );
  }
}

/// Displays a calculator answer in a consistent, easy-to-read style.
class ResultPanel extends StatelessWidget {
  const ResultPanel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xCCF6F0FA),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
      ),
    );
  }
}

String formatNumber(double value) {
  if (value == value.roundToDouble()) return value.toStringAsFixed(0);
  return value.toStringAsFixed(2);
}