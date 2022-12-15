import 'package:flutter/material.dart';
import 'package:fluttericon/fontelico_icons.dart';

class CurrentTrainingPlan extends StatefulWidget {
  const CurrentTrainingPlan({Key? key}) : super(key: key);

  @override
  State<CurrentTrainingPlan> createState() => _CurrentTrainingPlanState();
}

class _CurrentTrainingPlanState extends State<CurrentTrainingPlan> {
  List<Map> plan = [
    {
      "done": true,
      "title": "Иностранный язык в профессиональной сфере ",
      "modul": [
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: false,
          name: "Зачет \nОценка -",
        ),
      ]
    },
    {
      "done": true,
      "title": "Методы оптимизации",
      "modul": [
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
      ]
    },
    {
      "done": true,
      "title": "Теория и практика эффективных коммуникаций ",
      "modul": [
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: false,
          name: "Зачет \nОценка -",
        ),
      ]
    },
    {
      "done": true,
      "title": "Теория систем и системный анализ",
      "modul": [
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: false,
          name: "Зачет \nОценка -",
        ),
      ]
    },
    {
      "done": true,
      "title": "Управление данными ",
      "modul": [
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: true,
          name: "Экзамен  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
      ]
    },
    {
      "done": true,
      "title": "Физика",
      "modul": [
        RatingItem(
          isDone: true,
          name:
              "Контрольная работа Порядок прохождения 1 Оценка 5 Состояние Прошел Дата сдачи 28.11.2022",
        ),
        RatingItem(
          isDone: true,
          name: "Контрольная работа  \nОценка 5 \nДата сдачи 28.11.2022",
        ),
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 100),
          itemCount: plan.length,
          itemBuilder: (_, index) {
            final item = plan[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              /*   color: Colors.white,*/
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                    iconColor: Colors.blueAccent,
                    collapsedIconColor: Colors.blueAccent,

                    //   expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    title: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.black),
                    ),
                    children: item['modul']),
              ),
            );
          }),
    );
  }
}

class RatingItem extends StatelessWidget {
  // final String ball;
  final String name;
  final bool isDone;
  const RatingItem({
    Key? key,
    required this.isDone,
    required this.name,
    //  required this.ball,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      child: ListTile(
        leading: isDone
            ? Icon(
                Icons.done,
                color: Colors.green,
              )
            : Icon(
                Fontelico.spin5,
                color: Colors.orange,
              ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            //COLOR DEL TEXTO TITULO
            color: Colors.black,
          ),
        ),
        //trailing: Text(ball),
      ),
    );
  }
}
