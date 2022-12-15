import 'package:flutter/material.dart';
import 'package:flutter_tisbi_isu/screens/raiting_screen/loading_page.dart';
import 'package:flutter_tisbi_isu/screens/raiting_screen/raiting_final.dart';

class LoadingMainScreen extends StatefulWidget {
  const LoadingMainScreen({Key? key}) : super(key: key);

  @override
  State<LoadingMainScreen> createState() => _LoadingMainScreenState();
}

class _LoadingMainScreenState extends State<LoadingMainScreen> {
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
    return _isLoaded ? RaitingListView() : LoadingListPage();
  }
}
