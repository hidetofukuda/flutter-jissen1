import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

import 'package:image/image.dart' as image_lib;

class ImageEditScreen extends StatefulWidget {
  const ImageEditScreen({super.key, required this._imageBitmap});

  final Uint8List _imageBitmap;

  @override
  State<ImageEditScreen> createState() => _ImageEditScreenState();
  
}
class _ImageEditScreenState extends State<ImageEditScreen> {

 late Uint8List _imageBitmap;

 @override
 void initState(){
  super.initState();
  _imageBitmap = widget._imageBitmap;
 }

 void _rotateImage(){
  // 
  final image = image_lib.decodeImage(_imageBitmap);
  if(image == null) return;
  final rotatedImage = image_lib.copyRotate(image, angle:90);

  setState(() {
    _imageBitmap = Uint8List.fromList(image_lib.encodePng(rotatedImage));
  });
 }

 void _flipImage(){
  final image = image_lib.decodeImage(_imageBitmap);
  if(image == null) return;
  final flippedImage = image_lib.flipHorizontal(image);

  setState(() {
    _imageBitmap = Uint8List.fromList(image_lib.encodePng(flippedImage));
  });
 
 }

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
            Image.memory(_imageBitmap, gaplessPlayback: true),

            IconButton(
              onPressed: () => _rotateImage(),
              icon: const Icon(Icons.rotate_left),
            ),
            IconButton(
              onPressed: () => _flipImage(),
              icon: const Icon(Icons.flip),
            ),
          ],
        ),
      ),
    );
  }
}