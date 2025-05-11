import 'package:flutter/material.dart';

class AddiitionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const AddiitionalInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Color.fromARGB(255, 117, 135, 145)),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
