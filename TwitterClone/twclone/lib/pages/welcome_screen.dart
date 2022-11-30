import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twclone/utils/customColors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String twitterIcon = "assets/images/twitter_icon_blue.png";
    return Scaffold(
      body: appBody(height, twitterIcon));
  }

  Padding appBody(double height, String twitterIcon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        customSizedBox2x(),
        twitterIconController(height, twitterIcon),
        customSizedBox3x(),
        textTitle(),
        customSizedBox3x(),
        customTextButton("Continue with Google", FontAwesomeIcons.google,
            CustomColors.googleIconColor),
        betweenButtons(8),
        customTextButton("Continue with Apple", FontAwesomeIcons.apple,
            CustomColors.appleIconColor),
        customDivider("Or"),
        betweenButtons(15),
        customElevatedButton(),
        betweenButtons(4),
        privacyText(),
        customSizedBox(),
        loginButton()
      ]),
    );
  }

//controller top twitter icon  heigh and icon...
  Container twitterIconController(double height, String twitterIcon) {
    return Container(
        height: height * 0.08,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(twitterIcon)),
        ));
  }

  Row loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "Have an account already?",
              style:
                  TextStyle(color: CustomColors.privacyTextColor, fontSize: 15))
        ])),
        TextButton(
            onPressed: () {},
            child: Text(
              "Log in",
              style: TextStyle(
                  color: CustomColors.importantWordColor, fontSize: 15),
            ))
      ],
    );
  }

//privacy text can edit...
  Padding privacyText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: "By signing up, you agree to the",
              style: TextStyle(
                  color: CustomColors.privacyTextColor, fontSize: 13)),
          TextSpan(
              text: " Terms of Service",
              style: TextStyle(
                  color: CustomColors.importantWordColor, fontSize: 13)),
          TextSpan(
              text: " and",
              style: TextStyle(
                  color: CustomColors.privacyTextColor, fontSize: 13)),
          TextSpan(
              text: "\nPrivacy Policy",
              style: TextStyle(
                  color: CustomColors.importantWordColor, fontSize: 13)),
          TextSpan(
              text: ", including",
              style: TextStyle(
                  color: CustomColors.privacyTextColor, fontSize: 13)),
          TextSpan(
              text: " Cookie Use",
              style: TextStyle(
                  color: CustomColors.importantWordColor, fontSize: 13)),
          TextSpan(
              text: ".",
              style: TextStyle(
                  color: CustomColors.privacyTextColor, fontSize: 13)),
        ])),
      ),
    );
  }

//Custom Divider include text between "Or"...
  Padding customDivider(String dividerText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 120,
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            dividerText,
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 120,
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

//textTile has headtext...
  Padding textTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "See what's \nhappening in the \nworld right now.",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }

//Custom TextButton "{Icon} Continue with XXX"
  Center customTextButton(String buttonText, IconData icon, Color color) {
    return Center(
      child: SizedBox(
          height: 40,
          width: 300,
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(icon, size: 15, color: color),
            label: Text(
              buttonText,
              style: TextStyle(color: CustomColors.twitterBlue, fontSize: 15),
            ),
            style: TextButton.styleFrom(
                side: BorderSide(width: 0.75),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          )),
    );
  }

//Custom Elevated Button "Create account"
  Center customElevatedButton() {
    return Center(
      child: SizedBox(
        height: 40,
        width: 300,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signUp");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.twitterBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              "Create account",
              style: TextStyle(color: CustomColors.twitterWhite, fontSize: 15),
            )),
      ),
    );
  }

//SizedBox  normal 2x 3x and can set..
  SizedBox customSizedBox() => SizedBox(
        height: 30,
      );

  SizedBox customSizedBox2x() => SizedBox(
        height: 60,
      );

  SizedBox customSizedBox3x() => SizedBox(
        height: 90,
      );

  SizedBox betweenButtons(double height) => SizedBox(
        height: height,
      );
}


// By signing up, you agree to the Terms of Service and \nPrivacy Policy, including Cookie Use.