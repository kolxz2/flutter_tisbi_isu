import 'package:flutter/material.dart';

class PageWithAnimatedList extends StatefulWidget {
  @override
  _PageWithAnimatedListState createState() => _PageWithAnimatedListState();
}

class _PageWithAnimatedListState extends State<PageWithAnimatedList> {
  var _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  List<Widget> fetchedList = [
    RatingItem(
        name: 'Шерстнева Полина Сергеевна',
        ball: "87",
        position: Icon(Icons.emoji_events_outlined)),
    RatingItem(
        name: 'Сучёв Николай Евгеньевич',
        ball: "86",
        position: Icon(Icons.emoji_events_outlined)),
    RatingItem(
        name: 'Мейнцер Евгений Николаевич',
        ball: "85",
        position: Icon(Icons.emoji_events_outlined)),
    RatingItem(
        name: 'Багавиев Булат Талгатович', ball: "82", position: Text('4')),
    RatingItem(
        name: 'Мухаметрахимов Раиль Ринатович',
        ball: "80",
        position: Text('5')),
    RatingItem(
        name: 'Конюхов Матвей Александрович', ball: "79", position: Text('6')),
    RatingItem(
        name: 'Сахаров Амир Алексеевич', ball: "78", position: Text('7')),
    RatingItem(
        name: 'Галимова Айсина Халиловна', ball: "75", position: Text('8')),
    RatingItem(name: 'Платов Илья Игоревич', ball: "68", position: Text('9')),
    RatingItem(
        name: 'Корабельникова Валерия Андреевна',
        ball: "61",
        position: Text('10')),
    RatingItem(
        name: 'Таренко Александр Дмитриевич', ball: "50", position: Text('11')),
    RatingItem(
        name: 'Салиева Дания Данисовна', ball: "49", position: Text('12')),
    RatingItem(
        name: 'Ишалин Равиль Ильясович', ball: "42", position: Text('13')),
    RatingItem(
        name: 'Ишалин Равиль Ильясович', ball: "40", position: Text('14')),
    RatingItem(
        name: 'Исхаков Даниил Валерьевич', ball: "37", position: Text('15')),
    RatingItem(
        name: 'Ужакин Марк Владимирович', ball: "36", position: Text('16')),
  ];

  void _loadItems() {
    // fetching data from web api, db...
    const fetchedList = [
      RatingItem(
          name: 'Шерстнева Полина Сергеевна',
          ball: "87",
          position: Icon(Icons.emoji_events_outlined)),
      RatingItem(
          name: 'Сучёв Николай Евгеньевич',
          ball: "86",
          position: Icon(Icons.emoji_events_outlined)),
      RatingItem(
          name: 'Мейнцер Евгений Николаевич',
          ball: "85",
          position: Icon(Icons.emoji_events_outlined)),
      RatingItem(
          name: 'Багавиев Булат Талгатович', ball: "82", position: Text('4')),
      RatingItem(
          name: 'Мухаметрахимов Раиль Ринатович',
          ball: "80",
          position: Text('5')),
      RatingItem(
          name: 'Конюхов Матвей Александрович',
          ball: "79",
          position: Text('6')),
      RatingItem(
          name: 'Сахаров Амир Алексеевич', ball: "78", position: Text('7')),
      RatingItem(
          name: 'Галимова Айсина Халиловна', ball: "75", position: Text('8')),
      RatingItem(name: 'Платов Илья Игоревич', ball: "68", position: Text('9')),
      RatingItem(
          name: 'Корабельникова Валерия Андреевна',
          ball: "61",
          position: Text('10')),
      RatingItem(
          name: 'Таренко Александр Дмитриевич',
          ball: "50",
          position: Text('11')),
      RatingItem(
          name: 'Салиева Дания Данисовна', ball: "49", position: Text('12')),
      RatingItem(
          name: 'Ишалин Равиль Ильясович', ball: "42", position: Text('13')),
      RatingItem(
          name: 'Ишалин Равиль Ильясович', ball: "40", position: Text('14')),
      RatingItem(
          name: 'Исхаков Даниил Валерьевич', ball: "37", position: Text('15')),
      RatingItem(
          name: 'Ужакин Марк Владимирович', ball: "36", position: Text('16')),
      SizedBox(
        height: 100,
      )
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _listItems.add(fetchedList[i]);
          _listKey.currentState?.insertItem(_listItems.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      //    padding: EdgeInsets.only(top: 10),
      initialItemCount: _listItems.length,
      itemBuilder: (context, index, animation) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SlideTransition(
            position: CurvedAnimation(
              curve: Curves.ease,
              parent: animation,
            ).drive((Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ))),
            child: _listItems[index],
          ),
        );
      },
    );
  }
}

class RatingItem extends StatelessWidget {
  final String ball;
  final String name;
  final Widget position;
  const RatingItem({
    Key? key,
    required this.position,
    required this.name,
    required this.ball,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(20),
      child: ListTile(
        leading: position,
        title: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            //COLOR DEL TEXTO TITULO
            color: Colors.black,
          ),
        ),
        trailing: Text(ball),
      ),
    );
  }
}
