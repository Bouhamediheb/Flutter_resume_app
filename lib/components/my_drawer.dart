// ignore_for_file: prefer_const_constructors

import 'package:cv_iheb_karim/pages/about_page.dart';
import 'package:cv_iheb_karim/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../auth/login_or_register.dart';
import '../pages/parcous_page.dart';
import '../pages/settings_page.dart';
import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:provider/provider.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DrawerHeader(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Image.asset(
                        'lib/images/unlock.png',
                        color: Theme.of(context).colorScheme.primary,
                        height: 60,
                      ),
                    ),
                  ),
                ),
              ),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: 
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return ListTile(
                      title: 
                          selectedLanguage == 'English'
                              ? const Text("H O M E")
                              : selectedLanguage == 'Francais'
                                  ? const Text("A C C U E I L")
                                  : const Text("الصفحة الرئيسية"),
                      leading: const Icon(Icons.home),
                      onTap: () {
                        // go to home page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              // parcous list tile
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: 
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return ExpansionTile(
                  title:  
                      selectedLanguage == 'English'
                          ? const Text("P A R C O U R S")
                          : selectedLanguage == 'Francais'
                              ? const Text("P A R C O U R S")
                              : const Text("المسار"),
                  leading: const Icon(Icons.directions),
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 35),
                      child: ListTile(
                        title: 
                            selectedLanguage == 'English'
                                ? const Text('Parcours Iheb')
                                : selectedLanguage == 'Francais'
                                    ? const Text('Parcours Iheb')
                                    : const Text('مسار إيهاب'),
                        onTap: () {
                          Navigator.pop(context);

                          // go to Iheb's page with a variable
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParcousPage(nom: 'iheb'),
                            ),
                          );
                        },
                        leading: Container(
                          // rounded image
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('lib/images/iheb.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 35),
                      child: ListTile(
                        title: 
                            selectedLanguage == 'English'
                                ? const Text('Parcours Karim')
                                : selectedLanguage == 'Francais'
                                    ? const Text('Parcours Karim')
                                    : const Text('مسار كريم'),
                        onTap: () {

                          Navigator.pop(context);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParcousPage(nom: 'karim'),
                            ),
                          );

                        },
                        leading: Container(
                          // rounded image
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('lib/images/karim.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  onExpansionChanged: (bool expanding) {
                    if (expanding) {
                      // pop drawer
                    }
                  },
                );
                  },
                ),
              ),

              // settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: 
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return ListTile(
                      title: 
                          selectedLanguage == 'English'
                              ? const Text("S E T T I N G S")
                              : selectedLanguage == 'Francais'
                                  ? const Text("P A R A M È T R E S")
                                  : const Text("الإعدادات"),
                      leading: const Icon(Icons.settings),
                      onTap: () {
                        // go to settings page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                    );
                  },
                ),

              ),

              // about list tile consumer
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: 
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return ListTile(
                      title: 
                          selectedLanguage == 'English'
                              ? const Text("A B O U T")
                              : selectedLanguage == 'Francais'
                                  ? const Text("A  P R O P O S")
                                  : const Text("حول"),
                      leading: const Icon(Icons.info),
                      onTap: () {
                        // go to about page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutPage(),
                          ),
                        );
                      },
                    );
                  },
              ),
              ),

            ],
          ),

          // logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 25),
            child: ListTile(
              title: 
                  selectedLanguage == 'English'
                      ? const Text("L O G O U T")
                      : selectedLanguage == 'Francais'
                          ? const Text("D É C O N N E X I O N")
                          : const Text("تسجيل الخروج"),
              leading: const Icon(Icons.logout),
              onTap: () {
                // go to about page
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginOrRegister(),
                    ),
                    (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
