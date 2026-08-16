import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n.startScreenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.helloWorldOn(DateTime.now()), style: TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // ボタンが押されたときの処理
              },
              child: Text(l10n.pushButton),
            ),
          ],
        ),
      ),
    );
  }
}