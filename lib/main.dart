import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app/bindings/main_binding.dart';
import 'app/config/firebase_config.dart';
import 'app/routes/app_pages.dart';
import 'app/services/dependency_injection.dart';
import 'app/services/theme_service.dart';
import 'app/themes/text_theme.dart';
import 'app/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initFirebase();

  DependecyInjection.init();

  runZonedGuarded(
    () {
      runApp(
        const MyApp(),
      );
    },
    (Object error, StackTrace stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}

Future<void> initFirebase() async {
  FirebaseOptions? firebaseOptions;
  if (kIsWeb) {
    Map<String, dynamic>? firebaseConfig = firebaseConfigDevWeb;
    firebaseOptions = FirebaseOptions(
      apiKey: firebaseConfig['apiKey'],
      appId: firebaseConfig['appId'],
      messagingSenderId: firebaseConfig['messagingSenderId'],
      projectId: firebaseConfig['projectId'],
      databaseURL: firebaseConfig['databaseURL'],
      measurementId: firebaseConfig['measurementId'],
      trackingId: firebaseConfig['trackingId'],
    );
  }

  // else if (Platform.isAndroid) {
  //   Map<String, dynamic>? firebaseConfig = firebaseConfigDevAndroid;

  //   firebaseOptions = FirebaseOptions(
  //     apiKey: firebaseConfig['apiKey']!,
  //     appId: firebaseConfig['appId']!,
  //     messagingSenderId: firebaseConfig['messagingSenderId']!,
  //     projectId: firebaseConfig['projectId']!,
  //     databaseURL: firebaseConfig['databaseURL'],
  //     measurementId: firebaseConfig['measurementId'],
  //     trackingId: firebaseConfig['trackingId'],
  //   );
  // }
  await Firebase.initializeApp(options: firebaseOptions);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    MaterialTheme theme = MaterialTheme(textTheme);

    return GetMaterialApp(
      initialBinding: MainBinding(),
      title: "Estrellas",
      locale: const Locale('es'),
      fallbackLocale: const Locale('es'),
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeService.getThemeMode(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // builder: (context, child) => MainLayout(child: child!),
    );
  }
}
