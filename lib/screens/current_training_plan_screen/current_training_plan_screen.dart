import 'package:flutter/material.dart';

import 'current_training_plan.dart';
import 'loading_page.dart';

class CurrentTrainingPlanScreen extends StatefulWidget {
  const CurrentTrainingPlanScreen({Key? key}) : super(key: key);

  @override
  State<CurrentTrainingPlanScreen> createState() =>
      _CurrentTrainingPlanScreenState();
}

class _CurrentTrainingPlanScreenState extends State<CurrentTrainingPlanScreen> {
  bool _isLoaded = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded ? CurrentTrainingPlan() : LoadingCurrentTrainingPlan();
  }
}
