import 'dart:collection';
import 'dart:math';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String clock;
  final bool isButton;
  final String description;

  Event(
      {required this.clock, required this.description, required this.isButton});

  @override
  String toString() => clock;
}

const List<String> classesTime = [
  "8:00 - 9:20",
  "9:30 - 10:50",
  "11:00 - 12:20",
  "12:50 - 14:10",
  "14:20 - 15:40"
];

const List<List> lessons = [
  [
    false,
    "Иностранный язык в профессиональной сфере \n Яхина Диляра Инсановна Практика \n Муштари 210ауд. "
  ],
  [true, "Физика \n Смоленцева Лариса Владиславовна \n zoom "],
  [false, "Физика \n Смоленцева Лариса Владиславовна \n Новое здание 325ауд. "],
  [
    false,
    "Методы оптимизации \n Заботин Владислав Иванович \n Лекция Новое здание 336ауд."
  ],
  [
    true,
    "Теория и практика эффективных коммуникаций \n Шайхутдинова Флюра Нургаяновна \n Практика (чет)Муштари 321ауд. "
  ]
];

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(100, (index) => index),
    key: (item) =>
        DateTime.utc(kFirstDay.year, kFirstDay.month, item).weekday ==
                    DateTime.saturday ||
                DateTime.utc(kFirstDay.year, kFirstDay.month, item).weekday ==
                    DateTime.sunday
            ? DateTime.now()
            : DateTime.utc(kFirstDay.year, kFirstDay.month, item),
    value: (item) => List.generate(item % 2 + 1, (index) {
          int position = Random().nextInt(lessons.length - 1);
          return Event(
              clock: classesTime[position],
              description: lessons[position][1].toString(),
              isButton: lessons[position][0]);
        }));

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
