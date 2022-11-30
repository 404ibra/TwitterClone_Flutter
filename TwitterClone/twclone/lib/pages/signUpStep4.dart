import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:twclone/utils/customColors.dart';

class SignUpStep4 extends StatefulWidget {
  const SignUpStep4({super.key});

  @override
  State<SignUpStep4> createState() => _SignUpStep4State();
}

class _SignUpStep4State extends State<SignUpStep4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText("We sent you a code"),
              verifyInfo(),
              _customSizedBox(60),
              customSignupTextField("Verification code"),
              againCode(),
              _customSizedBox(330),
              customSignupElevatedButton("Next"),
            ],
          ),
        ));
  }


  //verification info
  Padding verifyInfo() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text.rich(TextSpan(children: [

                      
              TextSpan(text: "Enter it below to verify",
              style:textStyleInfoVerifyMail() ),
              TextSpan(text: "\nibra.aktas@gmail.com",
              style: textStyleInfoVerifyMail())
            ])),
          );
  }


//text style verify mail 
    TextStyle textStyleInfoVerifyMail() {
    return TextStyle(
                      color: CustomColors.privacyTextColor,
                      fontSize: 14,
                      );
  }

//text didnt rexeive code
  Padding againCode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextButton(
          onPressed: () {},
          child: Text(
            "Didn't receive email?",
            style:
                TextStyle(color: CustomColors.importantWordColor, fontSize: 14),
          )),
    );
  }


//verification code text field
  Center customSignupTextField(String fieldText) {
    return Center(
      child: Container(
        height: 53,
        width: 352,
        child: TextField(
          decoration: InputDecoration(
              focusedBorder: customTextFieldBorder(),
              enabledBorder: customTextFieldBorder(),
              hintText: fieldText,
              hintStyle: TextStyle(
                  color: CustomColors.privacyTextColor, fontSize: 15)),
        ),
      ),
    );
  }

  OutlineInputBorder customTextFieldBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: CustomColors.privacyTextColor,
        ),
        borderRadius: BorderRadius.circular(2));
  }

//title Text for create account// 
  Padding titleText(String titleText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 68,
        width: 354,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19),
          child: Text(
            titleText,
            style: TextStyle(
                color: CustomColors.appleIconColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        title: Text(
          "Step 4/5",
          style: TextStyle(
              color: CustomColors.blackText,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        shadowColor: CustomColors.twitterWhite,
        backgroundColor: CustomColors.twitterWhite,
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/signUp");
          },
          icon: Icon(Icons.arrow_back_rounded),
          iconSize: 19,
          color: CustomColors.appleIconColor,
        ));
  }



//next button
    Center customSignupElevatedButton(String signUpElevatedButtonText) {
    return Center(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 49,
          width: 354,
          child: ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, "/signUp");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.blackElevatedButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.5))),
              child: Text(
                signUpElevatedButtonText,
                style: TextStyle(color: CustomColors.twitterWhite, fontSize: 16),
              )),
        ),
      ),
    );
  }

  SizedBox _customSizedBox(double height) => SizedBox(
        height: height,
      );

  Padding _customPadding() =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 30));
}
