import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const MyAppBar({
    super.key,
    required this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        selectedLanguage == 'English'
            ? 'C V  -  I H E B  &  K A R I M'
            : selectedLanguage == 'Francais'
                ? 'C V  -  I H E B  &  K A R I M'
                : ' C V  -  إيهاب وكريم',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }
}
