import 'package:flutter/material.dart';
import 'package:flutter_tisbi_isu/screens/raiting_screen/rating.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListPage extends StatefulWidget {
  @override
  _LoadingListPageState createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  bool _enabled = true;

  List<Widget> fetchedList = [
    RatingItem(
        name: 'Шерстнева Полина Сергеевна',
        ball: "87",
        position: Icon(Icons.emoji_events_outlined)),
    SizedBox(height: 10),
    RatingItem(
        name: 'Сучёв Николай Евгеньевич',
        ball: "86",
        position: Icon(Icons.emoji_events_outlined)),
    SizedBox(height: 10),
    RatingItem(
        name: 'Мейнцер Евгений Николаевич',
        ball: "85",
        position: Icon(Icons.emoji_events_outlined)),
    SizedBox(height: 10),
    RatingItem(
        name: 'Багавиев Булат Талгатович', ball: "82", position: Text('4')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Мухаметрахимов Раиль Ринатович',
        ball: "80",
        position: Text('5')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Конюхов Матвей Александрович', ball: "79", position: Text('6')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Сахаров Амир Алексеевич', ball: "78", position: Text('7')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Галимова Айсина Халиловна', ball: "75", position: Text('8')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Пла'
            'тов Илья Игоревич',
        ball: "68",
        position: Text('9')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Корабельникова Валерия Андреевна',
        ball: "61",
        position: Text('10')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Таренко Александр Дмитриевич', ball: "50", position: Text('11')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Салиева Дания Данисовна', ball: "49", position: Text('12')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Ишалин Равиль Ильясович', ball: "42", position: Text('13')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Ишалин Равиль Ильясович', ball: "40", position: Text('14')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Исхаков Даниил Валерьевич', ball: "37", position: Text('15')),
    SizedBox(height: 10),
    RatingItem(
        name: 'Ужакин Марк Владимирович', ball: "36", position: Text('16')),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[100]!,
              enabled: _enabled,
              child: ListView(
                children: fetchedList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
