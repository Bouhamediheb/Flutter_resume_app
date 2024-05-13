import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'home_page.dart';
import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  late SharedPreferences sharedPref;

  // register method
  void register() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Email, password or confirm password cannot be empty'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Password and confirm password do not match'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
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

    // save user email
    sharedPref.setString('email', email);

    // save user password
    sharedPref.setString('password', password);

    // save user login status
    sharedPref.setBool('loggedIn', true);

    // once created, send user to homepage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

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
                const SizedBox(height: 50),

                // logo
                Image.asset(
                  'lib/images/unlock.png',
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 50),

                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Text(
                      selectedLanguage == 'English'
                          ? 'Register'
                          : selectedLanguage == 'Francais'
                              ? 'S\'inscrire'
                              : 'تسجيل',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 25),

                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return MyTextField(
                      controller: emailController,
                      hintText: selectedLanguage == 'English'
                          ? 'Email Address'
                          : selectedLanguage == 'Francais'
                              ? 'Adresse Email'
                              : 'عنوان البريد الإلكتروني',
                      obscureText: false,
                    );
                  },
                ),

                const SizedBox(height: 10),

                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return MyTextField(
                      controller: passwordController,
                      hintText: selectedLanguage == 'English'
                          ? 'Password'
                          : selectedLanguage == 'Francais'
                              ? 'Mot de passe'
                              : 'كلمة السر',
                      obscureText: true,
                    );
                  },
                ),

                const SizedBox(height: 10),

                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return MyTextField(
                      controller: confirmPasswordController,
                      hintText: selectedLanguage == 'English'
                          ? 'Confirm Password'
                          : selectedLanguage == 'Francais'
                              ? 'Confirmez le mot de passe'
                              : 'تأكيد كلمة المرور',
                      obscureText: true,
                    );
                  },
                ),

                const SizedBox(height: 25),

                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return MyButton(
                      text: selectedLanguage == 'English'
                          ? 'Register'
                          : selectedLanguage == 'Francais'
                              ? 'S\'inscrire'
                              : 'تسجيل',
                      onTap: register,
                    );
                  },
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Text(
                            selectedLanguage == 'English'
                                ? 'Not a member?'
                                : selectedLanguage == 'Francais'
                                    ? 'Pas encore membre?'
                                    : 'لست عضوا؟',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ));
                      },
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Consumer<LanguageProvider>(
                        builder: (context, languageProvider, child) {
                          return Text(
                              selectedLanguage == 'English'
                                  ? 'Register now'
                                  : selectedLanguage == 'Francais'
                                      ? 'Inscrivez-vous maintenant'
                                      : ' سجل الان ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
