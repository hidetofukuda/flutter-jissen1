import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as image_lib;

class ImageSelectScreen extends StatefulWidget {
  const ImageSelectScreen({super.key});

  @override
  State<ImageSelectScreen> createState() => _ImageSelectScreenState();
}

class _ImageSelectScreenState extends State<ImageSelectScreen> {

final ImagePicker _picker = ImagePicker();

Uint8List? _imageBitmap;

Future<void> _selectImage() async {

  //画像を選択する
  final XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

  //ファイルオブジェクトから画像を取得する
  final imageBitmap = await imageFile?.readAsBytes();
  assert(imageBitmap != null);
  if(imageBitmap == null) return;

  final image = image_lib.decodeImage(imageBitmap);
  assert(image != null);
  if (image == null) return;

  //　画像データをデコード
  final image_lib.Image resizedImage;
  if(image.width > image.height){
    //横長の画像なら横幅を500pxにリサイズ
    resizedImage = image_lib.copyResize(image, width: 500);
  }else{
    resizedImage = image_lib.copyResize(image, height: 500);
  }

  setState(() {
    _imageBitmap = image_lib.encodePng(resizedImage);
  });

}

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final imageBitmap = _imageBitmap;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n.startScreenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(imageBitmap != null)Image.memory(imageBitmap),
            ElevatedButton(
              onPressed: () =>  _selectImage(),
              child: Text(l10n.imageSelect),
            ),
            if(imageBitmap != null)
              ElevatedButton(  // 画像を編集するボタン
                onPressed: () {                },
                child: Text(l10n.imageEdit),
              ),
            
          ],
        ),
      ),
    );
  }
}