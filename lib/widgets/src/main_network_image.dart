import 'package:flutter/material.dart';

import '../../core.dart';

class MainNetworkImage extends StatelessWidget {
  const MainNetworkImage({super.key, this.image, this.fit});
  final String? image;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.network(
          alignment: Alignment.center,
          locator<Htreq>().base.baseUrl + (image ?? ""),
          fit: fit,
          errorBuilder: (context, error, stackTrace) => SizedBox(
                width: constraints.maxHeight,
                child: Icon(
                  Icons.image,
                  size: constraints.maxHeight * .5,
                ),
              )),
    );
  }
}
