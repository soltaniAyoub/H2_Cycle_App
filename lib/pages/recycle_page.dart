import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RecyclePage extends StatelessWidget {
  const RecyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recycle Now"),
      automaticallyImplyLeading: true, // <-- bouton retour auto
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text("Scan this QR on the machine", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            QrImageView(data: "h2cycle://session/USER-12345", size: 270),
            const SizedBox(height: 8),
            Text("Active session • Machine #TN-001", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 100),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Lottie.asset(
                "assets/animations/Energy_robot.json",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
