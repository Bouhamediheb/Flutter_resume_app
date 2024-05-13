// ignore_for_file: prefer_const_constructors

import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/my_square_tile.dart';
import '../theme/theme_provider.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences sharedPref;

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: 
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return Text(
                languageProvider.selectedLanguage == 'English'
                    ? 'Error'
                    : languageProvider.selectedLanguage == 'Francais'
                        ? 'Erreur'
                        : 'خطأ',
              );
            },
          ),
          content: 
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return Text(
                languageProvider.selectedLanguage == 'English'
                    ? 'Please fill in all fields'
                    : languageProvider.selectedLanguage == 'Francais'
                        ? 'Veuillez remplir tous les champs'
                        : 'يرجى ملء جميع الحقول',
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: 
              Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Text(
                    languageProvider.selectedLanguage == 'English'
                        ? 'OK'
                        : languageProvider.selectedLanguage == 'Francais'
                            ? 'D\'accord'
                            : 'حسنا',
                  );
                },
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    sharedPref = await SharedPreferences.getInstance();

    String? savedEmail = sharedPref.getString('email');
    String? savedPassword = sharedPref.getString('password');

    if (savedEmail == null || savedPassword == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: 
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return Text(
                languageProvider.selectedLanguage == 'English'
                    ? 'Error'
                    : languageProvider.selectedLanguage == 'Francais'
                        ? 'Erreur'
                        : 'خطأ',
              );
            },
          ),
          content: 
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return Text(
                languageProvider.selectedLanguage == 'English'
                    ? 'No account found'
                    : languageProvider.selectedLanguage == 'Francais'
                        ? 'Aucun compte trouvé'
                        : 'لم يتم العثور على حساب',
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: 
              Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Text(
                    languageProvider.selectedLanguage == 'English'
                        ? 'OK'
                        : languageProvider.selectedLanguage == 'Francais'
                            ? 'D\'accord'
                            : 'حسنا',
                  );
                },
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    if (email == savedEmail && password == savedPassword) {
      sharedPref.setBool('loggedIn', true);

      // once authenticated, send user to homepage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: 
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return Text(
                languageProvider.selectedLanguage == 'English'
                    ? 'Error'
                    : languageProvider.selectedLanguage == 'Francais'
                        ? 'Erreur'
                        : 'خطأ',
              );
            },
          ),
          content: 
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return Text(
                languageProvider.selectedLanguage == 'English'
                    ? 'Invalid email or password'
                    : languageProvider.selectedLanguage == 'Francais'
                        ? 'Email ou mot de passe invalide'
                        : 'بريد إلكتروني أو كلمة مرور غير صالحة',
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: 
              Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Text(
                    languageProvider.selectedLanguage == 'English'
                        ? 'OK'
                        : languageProvider.selectedLanguage == 'Francais'
                            ? 'D\'accord'
                            : 'حسنا',
                  );
                },
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void initState() {
    //print selected language
    print(selectedLanguage);
  }

  void forgotPw() {}

  void googleSignIn() {}

  // apple sign in
  void appleSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // logo
                Image.asset(
                  'lib/images/lock.png',
                  height: 150,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 50),

                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Text(
                      languageProvider.selectedLanguage == 'English'
                          ? 'Welcome!'
                          : languageProvider.selectedLanguage == 'Francais'
                              ? 'Bienvenue!'
                              : 'أهلا بك!',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 25),

                // email textfield
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return MyTextField(
                      controller: emailController,
                      hintText: languageProvider.selectedLanguage == 'English'
                          ? 'Email Address'
                          : languageProvider.selectedLanguage == 'Francais'
                              ? 'Adresse Email'
                              : 'عنوان البريد الإلكتروني',
                      obscureText: false,
                    );
                  },
                ),

                const SizedBox(height: 10),

                // password textfield
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return MyTextField(
                      controller: passwordController,
                      hintText: languageProvider.selectedLanguage == 'English'
                          ? 'Password'
                          : languageProvider.selectedLanguage == 'Francais'
                              ? 'Mot de passe'
                              : 'كلمة السر',
                      obscureText: false,
                    );
                  },
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: forgotPw,
                        child: Consumer<LanguageProvider>(
                          builder: (context, languageProvider, child) {
                            return Text(
                              languageProvider.selectedLanguage == 'English'
                                  ? 'Forgot Password?'
                                  : languageProvider.selectedLanguage ==
                                          'Francais'
                                      ? 'Mot de passe oublié?'
                                      : 'هل نسيت كلمة المرور؟',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return MyButton(
                      onTap: login,
                      text: languageProvider.selectedLanguage == 'English'
                          ? 'Log in'
                          : languageProvider.selectedLanguage == 'Francais'
                              ? 'Se connecter'
                              : 'تسجيل الدخول',
                    );
                  },
                ),

                const SizedBox(height: 25),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Consumer<LanguageProvider>(
                            builder: (context, languageProvider, child) {
                              return Text(
                                languageProvider.selectedLanguage == 'English'
                                    ? 'or continue with'
                                    : languageProvider.selectedLanguage ==
                                            'Francais'
                                        ? 'ou continuer avec'
                                        : 'أو تابع مع',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              );
                            },
                          )),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                      onTap: googleSignIn,
                      child: Image.asset(
                        'lib/images/google.png',
                        height: 25,
                      ),
                    ),

                    const SizedBox(width: 25),

                    // apple button
                    SquareTile(
                      onTap: appleSignIn,
                      child: Image.asset(
                        'lib/images/apple.png',
                        height: 25,
                        color: Provider.of<ThemeProvider>(context).isDarkMode
                            ? Colors.grey.shade400
                            : Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Text(
                          languageProvider.selectedLanguage == 'English'
                              ? 'Not a member? '
                              : languageProvider.selectedLanguage == 'Francais'
                                  ? 'Pas encore membre? '
                                  : ' عضو؟ ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        );
                      },
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Consumer<LanguageProvider>(
                        builder: (context, languageProvider, child) {
                          return Text(
                            languageProvider.selectedLanguage == 'English'
                                ? 'Register now'
                                : languageProvider.selectedLanguage ==
                                        'Francais'
                                    ? 'Inscrivez-vous maintenant'
                                    : 'سجل الآن',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    child: Provider.of<ThemeProvider>(context).isDarkMode
                        ? const Text('Light Mode')
                        : const Text('Dark Mode'),
                  ),
                ),

                // test button to home 
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text('Home Page'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
