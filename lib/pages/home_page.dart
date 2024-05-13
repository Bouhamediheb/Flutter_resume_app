import 'package:cv_iheb_karim/data/config_var.dart';
import 'package:flutter/material.dart';
import '../components/my_app_bar.dart';
import '../components/my_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cv_iheb_karim/theme/language_provider.dart';
import 'package:provider/provider.dart';

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  return await Geolocator.getCurrentPosition();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double latitude = 0.0;
  late double longitude = 0.0;
  bool _showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar:  MyAppBar(

        actions: [],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Text(
                      selectedLanguage == 'English'
                          ? 'Welcome to the Home Page'
                          : selectedLanguage == 'Francais'
                              ? 'Bienvenue sur la page d\'accueil'
                              : 'مرحبًا بك في الصفحة الرئيسية',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
                // this app is created by Iheb and Karim for the Flutter project exam to show our cvs
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Text(
                      textDirection: selectedLanguage == 'English'
                          ? TextDirection.ltr
                          : selectedLanguage == 'Francais'
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                      selectedLanguage == 'English'
                          ? 'This app is created by Iheb and Karim for the Flutter project exam to show our cvs'
                          : selectedLanguage == 'Francais'
                              ? 'Cette application est créée par Iheb et Karim pour l\'examen du projet Flutter pour montrer nos cvs'
                              : 'تم إنشاء هذا التطبيق بواسطة إيهاب وكريم لامتحان مشروع Flutter لعرض سيرتنا الذاتية',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
               

                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Text(
                      selectedLanguage == 'English'
                          ? 'Click the button below to get your location'
                          : selectedLanguage == 'Francais'
                              ? 'Cliquez sur le bouton ci-dessous pour obtenir votre position'
                              : 'انقر على الزر  للحصول على موقعك',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final Position position = await _determinePosition();
                      setState(() {
                        latitude = position.latitude;
                        longitude = position.longitude;
                        print(latitude);
                        print(longitude);
                        if (latitude.isFinite && longitude.isFinite) {
                          _showMap = true;
                        } else {
                          print("Invalid latitude or longitude");
                        }
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: selectedLanguage == 'English'
                      ? const Text('Get Location')
                      : selectedLanguage == 'Francais'
                          ? const Text('Obtenir la position')
                          : const Text('الحصول على الموقع'),
                ),
                const SizedBox(height: 50),
                if (_showMap)
                  Container(
                    height: 300,
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(latitude, longitude),
                        zoom: 9.2,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(latitude, longitude),
                              child: Container(
                                child: Icon(
                                  Icons.location_pin,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
