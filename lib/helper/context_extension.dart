import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get heightC => MediaQuery.of(this).size.height;

  double get widthC => MediaQuery.of(this).size.height;
}
