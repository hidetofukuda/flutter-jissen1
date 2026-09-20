import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class ImageEditScreen extends StatefulWidget {
  const ImageEditScreen({super.key, required this.imageBitmap});

  final Uint8List imageBitmap;
  @override
  State<ImageEditScreen> createState() => _ImageEditScreenState();
}

class _ImageEditScreenState extends State<ImageEditScreen> {

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
            Image.memory(widget.imageBitmap),

            IconButton(
              onPressed: () {  // 画像を編集するボタン
                // 例: 画像を左に回転させる
              },
              icon: const Icon(Icons.rotate_left),
            ),
            IconButton(
              onPressed: () {  // 画像を編集するボタン
                //
            },
              icon: const Icon(Icons.flip),
            ),
          ],
        ),
      ),
    );
  }
}