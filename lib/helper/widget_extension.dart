import 'package:flutter/material.dart';

extension widgets on Widget {
  Widget get centerwidget {
    return Center(
      child: this,
    );
  }

  Widget cornerRadius(BorderRadiusGeometry radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(16)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}
