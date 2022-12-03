import 'package:flutter/material.dart';
import 'package:twclone/utils/customColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addButton(),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
            selectedItemColor: CustomColors.tabbarSelectedItemColor,
            unselectedItemColor: CustomColors.tabbarDeactiviteButtonColor,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              _barItem(Icons.home, "Home"),
              _barItem(Icons.search_rounded, "Search"),
              _barItem(Icons.notification_add, "Nofications"),
              _barItem(Icons.mail, "Messages"),
            ]),
      ),
    );
  }

  BottomNavigationBarItem _barItem(IconData iconData, String labelText) =>
      BottomNavigationBarItem(
          icon: Icon(
            iconData,
          ),
          label: labelText);

  Container addButton() {
    return Container(
      height: 56,
      width: 56,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: CustomColors.twitterBlue,
        ),
      ),
    );
  }
}
