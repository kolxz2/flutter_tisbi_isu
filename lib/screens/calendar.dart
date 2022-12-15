import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/utils.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Widget> _listItems = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    // added
    _loadItems();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    //   _loadItems();

    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
      _unloadItems();
      _loadItems();
    }
  }

  void _loadItems() {
    var future = Future(() {});
    for (var i = 0; i < _selectedEvents.value.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 300), () {
          Card itemCard = Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  leading: Text(_selectedEvents.value[i].clock),
                  title: Text(_selectedEvents.value[i].description),
                  trailing: _selectedEvents.value[i].isButton
                      ? ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.video_call_sharp,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          label: Text('zoom'),
                        )
                      : null,
                  //       subtitle: Text(),
                ),
              ]));
          _listItems.add(itemCard);
          _listKey.currentState?.insertItem(_listItems.length - 1);
        });
      });
    }
  }

  // child: Text(_selectedEvents.value[i].description, textDirection: Text(_selectedEvents.value[i].description,
  void _unloadItems() {
    var future = Future(() {});
    for (var i = _listItems.length - 1; i >= 0; i--) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 300), () async {
          final deletedItem = _listItems.removeAt(i);
          _listKey.currentState?.removeItem(i,
              (BuildContext context, Animation<double> animation) {
            return SlideTransition(
              position: CurvedAnimation(
                curve: Curves.easeOut,
                parent: animation,
              ).drive((Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ))),
              child: deletedItem,
            );
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          locale: 'ru_RU',
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            formatButtonTextStyle: TextStyle(color: Colors.white),
            formatButtonVisible: false,
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
          eventLoader: _getEventsForDay,
          daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.white),
              weekdayStyle: TextStyle(color: Colors.white)),
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarBuilders: CalendarBuilders(),
          calendarStyle: CalendarStyle(
            rangeEndTextStyle: TextStyle(color: Colors.white),
            rangeStartTextStyle: TextStyle(color: Colors.white),
            todayTextStyle: TextStyle(color: Colors.white),
            withinRangeTextStyle: TextStyle(color: Colors.white),
            weekNumberTextStyle: TextStyle(color: Colors.white),
            outsideTextStyle: TextStyle(color: Colors.white),
            defaultTextStyle: TextStyle(color: Colors.white),
            holidayTextStyle: TextStyle(color: Colors.white),
            weekendTextStyle: TextStyle(color: Colors.white),
            selectedTextStyle: TextStyle(color: Colors.white),
            disabledTextStyle: TextStyle(color: Colors.white),

            rangeHighlightColor: Colors.white,
            // Use `CalendarStyle` to customize the UI
            outsideDaysVisible: false,
          ),
          onDaySelected: _onDaySelected,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: AnimatedList(
                  key: _listKey,
                  padding: EdgeInsets.only(top: 10),
                  initialItemCount: _listItems.length,
                  itemBuilder: (context, index, animation) {
                    return SlideTransition(
                        position: CurvedAnimation(
                          curve: Curves.easeOut,
                          parent: animation,
                        ).drive((Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset(0, 0),
                        ))),
                        child: _listItems[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
