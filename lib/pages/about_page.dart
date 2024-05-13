import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // about the developers consumer , add mail button
            Consumer<LanguageProvider>(
              builder: (context, languageProvider, child) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Text(
                      selectedLanguage == 'English'
                          ? 'About the Developers'
                          : selectedLanguage == 'Francais'
                              ? 'À propos des développeurs'
                              : 'حول المطورين',
                      style: Theme.of(context).textTheme.headline6,
                    );
                      },
                    ),
                    const SizedBox(height: 20),
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Text(
                          selectedLanguage == 'English'
                              ? 'This app is created by Iheb and Karim'
                              : selectedLanguage == 'Francais'
                                  ? 'Cette application est créée par Iheb et Karim'
                                  : 'تم إنشاء هذا التطبيق بواسطة إيهاب وكريم لامتحان مشروع',
                          style: Theme.of(context).textTheme.bodyText1,
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    // show two rounded images
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('lib/images/iheb.jpeg'),
                            radius: 50,
                          ),
                        ),
                        const SizedBox(width: 50),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('lib/images/karim.jpg'),
                            radius: 50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

                    Text(
                      selectedLanguage == 'English'
                          ? 'For any inquiries, please contact us at:'
                          : selectedLanguage == 'Francais'
                              ? 'Pour toute demande, veuillez nous contacter à :'
                              : 'لأي استفسار ، يرجى الاتصال بنا على:',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        // send mail
                      },
                      child: Consumer<LanguageProvider>(
                        builder: (context, languageProvider, child) {
                          return Text(
                            selectedLanguage == 'English'
                                ? 'Send Mail'
                                : selectedLanguage == 'Francais'
                                    ? 'Envoyer un mail'
                                    : 'إرسال بريد',
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
