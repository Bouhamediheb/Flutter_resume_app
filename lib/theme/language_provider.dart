import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {

  String _selectedLanguage = 'English';

  String get selectedLanguage => _selectedLanguage;

  set selectedLanguage(String newLanguage) {
    _selectedLanguage = newLanguage;
    notifyListeners();
  }



  void setLanguage(String newLanguage) {
    selectedLanguage = newLanguage;
    print('Selected language: $selectedLanguage');
  }


}