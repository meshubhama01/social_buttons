import 'package:flutter/material.dart';
import 'package:social_buttons/src/enums.dart';


class SocialButtonItem {
  final String labelText;
  final socialItems socialItem;
  final Color itemColor;
  final double itemSize;
  final String url;

  SocialButtonItem(
      {this.labelText,
      @required this.socialItem,
      @required this.url,
      this.itemColor,
      this.itemSize});
}
