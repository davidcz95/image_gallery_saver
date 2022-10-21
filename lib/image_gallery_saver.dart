import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class ImageGallerySaver {
  static const MethodChannel _channel =
      const MethodChannel('image_gallery_saver');

  /// Saves the file and returns file's path.
  /// Returns Map: {"isSuccess":true, "filePath":String?}
  static FutureOr<dynamic> saveFile(Uint8List imageBytes,
      {int quality = 80,
      required String name,
      bool isReturnImagePathOfIOS = false}) async {
    final result =
        await _channel.invokeMethod('saveImageToGallery', <String, dynamic>{
      'imageBytes': imageBytes,
      'quality': quality,
      'name': name,
      'isReturnImagePathOfIOS': isReturnImagePathOfIOS
    });
    return result;
  }
}
