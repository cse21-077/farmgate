import 'package:farm_gate/pages/list/leader.dart';
import 'package:farm_gate/pages/manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:farm_gate/pages/chat_page.dart';
import 'package:farm_gate/pages/home_page.dart';
import 'package:farm_gate/pages/profile_page.dart';
import 'package:farm_gate/pages/saved_page.dart';
import 'package:farm_gate/theme/colors.dart';
import 'dart:math' as math;
import 'package:farm_gate/data/item.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingButton(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ChatPage(),
        Center(
          child: Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 190,
                  height: 190,
                  alignment: Alignment.center,
                  child: Text("Management",
                      style: TextStyle(
                          color: Colors.greenAccent[200],
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(100.0),
                      border: Border.all(
                          color: Color(0xff7E89FC),
                          style: BorderStyle.solid,
                          width: 25),
                      color: Colors.transparent),
                ),
              ]),
              flex: 1),
        ),
        SavedPage(),
        ProfilePage(),
        LeaderB(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 1)),
        ],
        borderRadius: BorderRadius.circular(20),
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 0;
                    });
                  },
                  child: Icon(
                    Feather.home,
                    size: 25,
                    color: activeTab == 0 ? primary : black,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 1;
                    });
                  },
                  child: Icon(
                    MaterialIcons.chat_bubble_outline,
                    size: 25,
                    color: activeTab == 1 ? primary : black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 3;
                    });
                  },
                  child: Icon(
                    Feather.cloud_lightning,
                    size: 25,
                    color: activeTab == 3 ? primary : black,
                  ),
                ),
                SizedBox(
                  width: 39,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 4;
                    });
                  },
                  child: Icon(
                    MaterialIcons.account_circle,
                    size: 28,
                    color: activeTab == 4 ? primary : black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 19,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LeaderB()));
                  },
                  child: Icon(
                    Feather.list,
                    size: 25,
                    color: activeTab == 5 ? primary : black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getFloatingButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => management()));
      },
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 1)),
          ], color: black, borderRadius: BorderRadius.circular(19)),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Center(
                child: Icon(
              Ionicons.md_book,
              color: white,
              size: 26,
            )),
          ),
        ),
      ),
    );
  }
}
