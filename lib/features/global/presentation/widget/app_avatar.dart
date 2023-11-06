import 'package:flutter/material.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.size = 22,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: const AssetImage(
        AppAssets.avatar,
      ),
    );
  }
}
