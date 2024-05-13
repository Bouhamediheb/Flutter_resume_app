// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cv_iheb_karim/components/my_drawer.dart';
import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:cv_iheb_karim/data/parcous_data.dart';
import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../components/my_app_bar.dart';

class ParcousPage extends StatefulWidget {
  final String? nom;

  const ParcousPage({super.key, required this.nom});

  @override
  State<ParcousPage> createState() => _ParcousPageState();
}

class _ParcousPageState extends State<ParcousPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(
        actions: [],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: 
                    widget.nom == 'iheb'
                        ? Image.asset(
                            imageIheb,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            imageKarim,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              // name
              const SizedBox(height: 20),

              Center(
                  child: widget.nom == 'iheb'
                      ? Text(
                          username,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 24,
                          ),
                        )
                      : Text(
                          username2,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 24,
                          ),
                        )),

              const SizedBox(height: 5),

              // email
              Center(
                child: Text(
                  widget.nom == 'iheb' ? email : email2,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 2, 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 5),
                        Consumer<LanguageProvider>(
                          builder: (context, language, child) {
                            return Text(
                              selectedLanguage == 'English'
                                  ? 'Academic Background'
                                  : selectedLanguage == 'Francais'
                                      ? 'Parcours Academique'
                                      : 'المسار الأكاديمي',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                widget.nom == 'iheb'
                    ? parcousAcademiqueIheb.map((parcousItem) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Diploma: ${parcousItem['diplome']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Diplome: ${parcousItem['diplome']}'
                                            : 'الشهادة: ${parcousItem['diplome']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Establishment: ${parcousItem['etablissement']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Etablissement: ${parcousItem['etablissement']}'
                                            : 'المؤسسة: ${parcousItem['etablissement']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Year: ${parcousItem['année obtention']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Année: ${parcousItem['année obtention']}'
                                            : 'السنة: ${parcousItem['année obtention']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Mention: ${parcousItem['mention']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Mention: ${parcousItem['mention']}'
                                            : 'التقدير: ${parcousItem['mention']}',
                                  );
                                },
                              ),                           

                            ],
                          ),
                        );
                      }).toList()
                    : parcousAcademiqueKarim.map((parcousItem) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Diploma: ${parcousItem['diplome']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Diplome: ${parcousItem['diplome']}'
                                            : 'الشهادة: ${parcousItem['diplome']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Establishment: ${parcousItem['etablissement']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Etablissement: ${parcousItem['etablissement']}'
                                            : 'المؤسسة: ${parcousItem['etablissement']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Year: ${parcousItem['année obtention']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Année: ${parcousItem['année obtention']}'
                                            : 'السنة: ${parcousItem['année obtention']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Mention: ${parcousItem['mention']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Mention: ${parcousItem['mention']}'
                                            : 'التقدير: ${parcousItem['mention']}',
                                  );
                                },
                              ),

                            ],
                          ),
                        );
                      }).toList(),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 2, 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 5),
                        Consumer<LanguageProvider>(
                          builder: (context, language, child) {
                            return Text(
                              selectedLanguage == 'English'
                                  ? 'Professional Background'
                                  : selectedLanguage == 'Francais'
                                      ? 'Parcours Professionel'
                                      : 'المسار المهني',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                widget.nom == 'iheb'
                    ? parcousProfessionelIheb.map((parcousItem) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                             Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Post: ${parcousItem['poste']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Poste: ${parcousItem['poste']}'
                                            : 'المنصب: ${parcousItem['poste']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Company: ${parcousItem['entreprise']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Entreprise: ${parcousItem['entreprise']}'
                                            : 'الشركة: ${parcousItem['entreprise']}',
                                  );
                                },
                              ),
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Year: ${parcousItem['année']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Année: ${parcousItem['année']}'
                                            : 'السنة: ${parcousItem['année']}',
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList()
                    : parcousProfessionelKarim.map((parcousItem) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Consumer<LanguageProvider>(
                                  builder: (context, language, child) {
                                    return Text(
                                      selectedLanguage == 'English'
                                          ? 'Post: ${parcousItem['poste']}'
                                          : selectedLanguage == 'Francais'
                                              ? 'Poste: ${parcousItem['poste']}'
                                              : 'المنصب: ${parcousItem['poste']}',
                                    );
                                  },
                                ),
                                Consumer<LanguageProvider>(
                                  builder: (context, language, child) {
                                    return Text(
                                      selectedLanguage == 'English'
                                          ? 'Company: ${parcousItem['entreprise']}'
                                          : selectedLanguage == 'Francais'
                                              ? 'Entreprise: ${parcousItem['entreprise']}'
                                              : 'الشركة: ${parcousItem['entreprise']}',
                                    );
                                  },
                                ),
                                Consumer<LanguageProvider>(
                                  builder: (context, language, child) {
                                    return Text(
                                      selectedLanguage == 'English'
                                          ? 'Year: ${parcousItem['année']}'
                                          : selectedLanguage == 'Francais'
                                              ? 'Année: ${parcousItem['année']}'
                                              : 'السنة: ${parcousItem['année']}',
                                    );
                                  },
                                ),
                            ],
                          ),
                        );
                      }).toList(),
      


              ),
              // competences
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 2, 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 5),
                        Consumer<LanguageProvider>(
                          builder: (context, language, child) {
                            return Text(
                              selectedLanguage == 'English'
                                  ? 'Skills'
                                  : selectedLanguage == 'Francais'
                                      ? 'Compétences'
                                      : 'المهارات',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                widget.nom == 'iheb'
                    ? competencesIheb.map((competence) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Skill: ${competence['compétence']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Compétence: ${competence['compétence']}'
                                            : 'المهارة: ${competence['compétence']}',
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList()
                    : competencesKarim.map((competence) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Consumer<LanguageProvider>(
                                builder: (context, language, child) {
                                  return Text(
                                    selectedLanguage == 'English'
                                        ? 'Skill: ${competence['compétence']}'
                                        : selectedLanguage == 'Francais'
                                            ? 'Compétence: ${competence['compétence']}'
                                            : 'المهارة: ${competence['compétence']}',
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
