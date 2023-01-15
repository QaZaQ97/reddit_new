import 'package:flutter/material.dart';

class FullInfoPage extends StatelessWidget {
  final String title;
  final String fullText;
  final int ups;
  const FullInfoPage({
    super.key,
    required this.title,
    required this.fullText,
    required this.ups,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(fullText, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            ups == 0
                ? const Text(
                    'no pluses',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'amount of pluses is',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 20),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        child: Text(ups.toString()),
                      )
                    ],
                  ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
