import 'package:flutter/material.dart';

class SealWidget extends StatelessWidget {
  const SealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/seal.png',
            ),
          ],
        ),
      ),
    );
  }
}
