import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('写真加工アプリ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('こんにちわ!/n今日は${DateTime.now()}です。'),
            const Text(
              'スタート画面',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // ボタンが押されたときの処理
              },
              child: const Text('スタート'),
            ),
          ],
        ),
      ),
    );
  }
}