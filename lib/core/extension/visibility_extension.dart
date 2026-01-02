import 'package:flutter/widgets.dart';

extension VisibilityExtension on Widget {
  Widget visibility(bool isVisible, {Widget replacement = const SizedBox.shrink()}) {
    return isVisible ? this : replacement;
  }
}