import 'dart:math';
import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tisbi_isu/screens/calendar.dart';
import 'package:flutter_tisbi_isu/screens/current_training_plan_screen/current_training_plan_screen.dart';
import 'package:flutter_tisbi_isu/screens/raiting_screen/rating_main_screen.dart';
import 'package:flutter_tisbi_isu/screens/user_profile.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // dark text for status bar
      statusBarColor: Colors.transparent));
  return runApp(MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent),
      home: BottomNavBar()));
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<String> pageName = [
    "Расписание занятий ",
    "Рейтинг обучения",
    "Текущий план обучения",
    "Электронный пропуск"
  ];

  List<Widget> _screensCanSelected = <Widget>[
    CalendarScreen(),
    LoadingMainScreen(),
    CurrentTrainingPlanScreen(),
    //  LoadingListPage(),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ru_RU', null);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          title: Text(pageName[_page]),
        ),
      ),
      body: Stack(children: [
        SafeArea(
            child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _screensCanSelected.elementAt(_page),
            Positioned(
              bottom: 0,
              child: Container(
                //  clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      spreadRadius: 1,
                      blurRadius: 30,
                      offset: Offset(0, -10), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: BackdropFilter(
                    //  blendMode: BlendMode.plus,
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 5),
                    child: Container(
                      //   clipBehavior: Clip.hardEdge,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 300),

                      //  color: Colors.blueAccent.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: CurvedNavigationBar(
                  key: _bottomNavigationKey,
                  index: 0,
                  height: 60.0,
                  items: <Widget>[
                    Icon(
                      Icons.calendar_month,
                      size: 30,
                      color: Colors.blue,
                    ),
                    /*  Icon(Icons.qr_code, size: 30),*/
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 30,
                      color: Colors.blue,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 30,
                      color: Colors.blue,
                    ),
                    // Icon(Icons.newspaper, size: 30),
                    Icon(
                      Icons.perm_contact_cal,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ],
                  color: Colors.white,
                  buttonBackgroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  animationCurve: Curves.linear,
                  animationDuration: Duration(milliseconds: 600),
                  onTap: (index) {
                    setState(() {
                      _page = index;
                    });
                  },
                  letIndexChange: (index) => true,
                ))),
      ]),
      /* bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.qr_code, size: 30),
          Icon(Icons.emoji_events_outlined, size: 30),
          Icon(Icons.calendar_month, size: 30),
          Icon(Icons.newspaper, size: 30),
          Icon(Icons.perm_contact_cal, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),*/
    );
  }
}

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter({required this.circleWidth, required this.blurSigma});

  double circleWidth;
  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = Colors.lightBlue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
