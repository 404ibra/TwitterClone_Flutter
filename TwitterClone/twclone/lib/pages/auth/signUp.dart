import 'package:flutter/material.dart';
import 'package:twclone/utils/customColors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText("Create account"),
            customSignupTextField("Name"),
            _customSizedBox(26),
            customSignupTextField("Phone"),
            useAnotherInfo(),
            birthText(),
            SizedBox(),
            _customSizedBox(250),
            customSignupElevatedButton("Next"),
          ],
        ));
  }

  Padding birthText() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Birth date",
                  style: textStyleBirthDate()),
                      
              TextSpan(text: "\n\nThis will not be displayed publicly. Even if this",
              style:textStyleBirthDateDescription() ),
              TextSpan(text: "\naccount is for a business, pet or anything else, you must verify your own age.",
              style: textStyleBirthDateDescription())
            ])),
          );
  }

  TextStyle textStyleBirthDate() {
    return TextStyle(
                      color: CustomColors.blackText,
                      fontSize: 14,
                      fontWeight: FontWeight.bold);
  }

    TextStyle textStyleBirthDateDescription() {
    return TextStyle(
                      color: CustomColors.privacyTextColor,
                      fontSize: 14,
                      );
  }

  Padding useAnotherInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 295.0),
      child: TextButton(
          onPressed: () {},
          child: Text(
            "Use e-mail",
            style:
                TextStyle(color: CustomColors.importantWordColor, fontSize: 14),
          )),
    );
  }

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

//title Text for create account
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
          "Step 1/5",
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
            Navigator.pushNamed(context, "/welcomePage");
          },
          icon: Icon(Icons.close),
          iconSize: 19,
          color: CustomColors.appleIconColor,
        ));
  }


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
