import 'package:flutter/foundation.dart';

class IconAreaState extends ChangeNotifier{
  bool isOpen = false;

  void setIsOpen(bool isOpen){
    this.isOpen = isOpen;
    notifyListeners();
  }
}