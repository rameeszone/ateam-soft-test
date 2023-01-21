import 'package:flutter/foundation.dart';

class HomeModel extends ChangeNotifier {
late int _myValue;

int get myValue => _myValue;

set myValue(int myValue) {
  _myValue = myValue;
  notifyListeners();
}


}