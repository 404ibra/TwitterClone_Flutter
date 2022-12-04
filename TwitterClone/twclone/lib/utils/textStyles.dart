import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'customColors.dart';

class CustomTextStyles {
  static const tweetOwnName = TextStyle(
      color: CustomColors.blackText, fontSize: 16, fontWeight: FontWeight.w700);

  static const tweets = TextStyle(color: CustomColors.blackText, fontSize: 16);

  static const tweetOwnUserName =
      TextStyle(color: CustomColors.usernameDarkenColor, fontSize: 16);

  static const commentNumberTextStyle =
      TextStyle(color: CustomColors.commentIconColor, fontSize: 12.8);

  static const retweetNumberText =
      TextStyle(color: CustomColors.retweetIconColor, fontSize: 12.8);

  static const favNumberText =
      TextStyle(color: CustomColors.favIconColor, fontSize: 12.8);
}
