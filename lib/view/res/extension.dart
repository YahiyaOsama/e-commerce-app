import 'package:flutter/material.dart';

extension Padding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );

  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

extension Margin on num {
  SizedBox get mh => SizedBox(
        height: toDouble(),
      );

  SizedBox get mw => SizedBox(
        width: toDouble(),
      );
}
