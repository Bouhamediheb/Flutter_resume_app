// ignore_for_file: prefer_const_constructors

import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_app_bar.dart';
import '../theme/theme_provider.dart';
import '../data/config_var.dart';
import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

void initState() {
  print('Settings Page');
  //print selected language
  print(selectedLanguage);
}
  
void clearSharedPrefs() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sharedPref.clear();
  print('Shared Preferences Cleared');
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        
        actions: []
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Text(
                          selectedLanguage == 'English'
                              ? 'Theme'
                              : selectedLanguage == 'Francais'
                                  ? 'Thème'
                                  : 'السمة',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        );
                      },
                    ),

                    // switch toggle
                    CupertinoSwitch(
                      onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(),
                      value: Provider.of<ThemeProvider>(context, listen: false)
                          .isDarkMode,
                    ),
                  ],
                ),
              ),
              // language changer
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // language
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Text(
                          selectedLanguage == 'English'
                              ? 'Language'
                              : selectedLanguage == 'Francais'
                                  ? 'Langue'
                                  : 'لغة',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        );
                      },
                    ),

                    // language picker
                    CupertinoButton(
                      child: Consumer<LanguageProvider>(
                        builder: (context, languageProvider, child) {
                          return Text(
                            selectedLanguage,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          );
                        },
                      ),
                      onPressed: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoActionSheet(
                            title: selectedLanguage == 'English'
                                ? const Text('Select Language')
                                : selectedLanguage == 'Francais'
                                    ? const Text('Sélectionnez la langue')
                                    : const Text('اختر اللغة'),
                            actions: <CupertinoActionSheetAction>[
                              CupertinoActionSheetAction(
                                child: Text('English'),
                                onPressed: () {
                                  selectedLanguage = 'English';
                                  Provider.of<LanguageProvider>(context,
                                          listen: false)
                                      .selectedLanguage = 'English';

                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text('Francais'),
                                onPressed: () {
                                  selectedLanguage = 'Francais';
                                  Provider.of<LanguageProvider>(context,
                                          listen: false)
                                      .selectedLanguage = 'Francais';

                                  // reOpen the settings
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text('العربية'),
                                onPressed: () {
                                  selectedLanguage = 'العربية';
                                  Provider.of<LanguageProvider>(context,
                                          listen: false)
                                      .selectedLanguage = 'العربية';

                                  Navigator.pop(context);
                                },
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('Cancel'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              //clear shared
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Text(
                          selectedLanguage == 'English'
                              ? 'Clear Preferences'
                              : selectedLanguage == 'Francais'
                                  ? 'Effacer les préférences '
                                  : 'مسح الإعدادات ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        );
                      },
                    ),
                    CupertinoButton(
                      child: Consumer<LanguageProvider>(
                        builder: (context, languageProvider, child) {
                          return Text(
                            selectedLanguage == 'English'
                                ? 'Clear'
                                : selectedLanguage == 'Francais'
                                    ? 'Effacer'
                                    : 'مسح',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          );
                        },
                      ),
                      onPressed: () {
                        // clear shared preferences
                        clearSharedPrefs();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
