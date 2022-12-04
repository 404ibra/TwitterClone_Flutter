import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twclone/utils/customColors.dart';
import 'package:twclone/utils/textStyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String _githubProfilePhoto =
      "https://avatars.githubusercontent.com/u/116425964?s=400&u=e75c35c0bfa936760ba6bab2969cc0fd2d76317e&v=4";

  String _randomImageUrl = "https://picsum.photos/200/300";
  String _dummyTweet =
      "Just walked by a guy with 10 different phones and 10 different headphones";
  int _pageIndex = 0;
  ScrollController? scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController!.addListener(() {
      print(scrollController!.offset);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(),
      floatingActionButton: addButton(),
      body: expandedListView(),
      bottomNavigationBar: Container(
        child: bottomNavigationBar(),
      ),
    );
  }

  ListView expandedListView() {
    return ListView.builder(
      itemCount: 10,
      controller: scrollController,
      itemBuilder: (context, index) {
        return _listViewCard();
      },
    );
  }

  Widget _listViewCard() => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_randomImageUrl),
          ),
          title: Wrap(
              direction: Axis.horizontal,
              runSpacing: 5, //bu kod ile sizedbox'a gerek kalmadı gibi
              children: [
                twitterName("404ibra"),
                customHorizontalSizedBox(6),
                twitterUserName("404ibra"),
                homePageTweets(),
                customVerticalSizedox(14),
                _placeHolderField(),
                customVerticalSizedox(110),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    labelIconButton(labelIcon(
                        "7",
                        FontAwesomeIcons.comment,
                        CustomColors.commentIconColor,
                        CustomTextStyles.commentNumberTextStyle)),
                    labelIconButton(labelIcon(
                        "1",
                        FontAwesomeIcons.retweet,
                        CustomColors.retweetIconColor,
                        CustomTextStyles.retweetNumberText)),
                    labelIconButton(labelIcon(
                        "3",
                        Icons.favorite,
                        CustomColors.favIconColor,
                        CustomTextStyles.favNumberText)),
                    labelIconButton(labelIcon(
                        "1",
                        FontAwesomeIcons.shareFromSquare,
                        CustomColors.shareIconColor,
                        CustomTextStyles.commentNumberTextStyle)),
                  ],
                )
              ]),
        ),
      );

  Wrap labelIcon(String commentNumber, IconData iconName, Color iconColor,
      TextStyle iconLabelTextStyle) {
    return Wrap(children: [
      Icon(
        iconName,
        size: 14.8,
        color: iconColor,
      ),
      customHorizontalSizedBox(5),
      Text(
        commentNumber,
        style: iconLabelTextStyle,
      )
    ]);
  }

  Widget labelIconButton(Widget child) => InkWell(
        child: child,
        onTap: () {},
      );

  Widget _placeHolderField() => Container(
        height: 100,
        child: Placeholder(),
      );

  SizedBox customVerticalSizedox(double height) => SizedBox(
        height: height,
      );

  SizedBox customHorizontalSizedBox(double width) {
    return SizedBox(
      width: width,
    );
  }

  Text homePageTweets() {
    return Text(
      _dummyTweet,
      style: CustomTextStyles.tweets,
    );
  }

  Text twitterUserName(String twitterUserName) => Text(
        twitterUserName,
        style: CustomTextStyles.tweetOwnUserName,
      );

  Text twitterName(String userName) {
    return Text(
      userName,
      style: CustomTextStyles.tweetOwnName,
    );
  }

//paddingler eklenecek
  AppBar homePageAppBar() {
    return AppBar(
      leading: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
        CircleAvatar(
          backgroundImage: NetworkImage(_githubProfilePhoto),
          minRadius: 16,
        ),
      ]),
      title: Icon(
        FontAwesomeIcons.twitter,
        color: CustomColors.twitterBlue,
      ),
      centerTitle: true,
      actions: [
        Icon(
          FontAwesomeIcons.stroopwafel,
          color: CustomColors.twitterBlue,
        )
      ],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: CustomColors.tabbarSelectedItemColor,
        unselectedItemColor: CustomColors.tabbarDeactiviteButtonColor,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          _barItem(Icons.home, "Home"),
          _barItem(Icons.search_rounded, "Search"),
          _barItem(Icons.notification_add, "Nofications"),
          _barItem(Icons.mail, "Messages"),
        ]);
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
