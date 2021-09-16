import 'package:flutter/material.dart';

Widget imageLoader(String urlString, {double? width, double? height, BoxFit? fit}) {
  try {
    Widget image = Image.network(
      urlString,
      width: width,
      height: height,
      fit: fit,
      cacheHeight: height?.toInt(),
      filterQuality: FilterQuality.high,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(8),
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
    return image;
  } catch(exception) {
    print(exception.toString());
    return SizedBox();
  }
}