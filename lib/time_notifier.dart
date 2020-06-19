import 'package:flutter/cupertino.dart';

class TimeNotifier extends ChangeNotifier {
  DateTime _dateTime = DateTime.now();
  DateTime get  dateTime => _dateTime;
  int get second => _dateTime.second ~/ 2;
  void updateTime() {
    _dateTime = DateTime.now();
    notifyListeners();
  }
}