import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app/layout/remote_config_layout.dart';
import 'app/config/firebase_config.dart';
import 'app/routes/app_pages.dart';
import 'app/services/dependency_injection.dart';
import 'app/services/environment.dart';
import 'app/themes/text_theme.dart';
import 'app/themes/theme.dart';

void main() async {
  const String flavor = String.fromEnvironment('flavor', defaultValue: '');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Environment.instance.init(env: flavor);
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
      storageBucket: firebaseConfig['storageBucket'],
    );
  } else if (Platform.isAndroid) {
    Map<String, dynamic>? firebaseConfig = firebaseConfigDevAndroid;

    firebaseOptions = FirebaseOptions(
      apiKey: firebaseConfig['apiKey']!,
      appId: firebaseConfig['appId']!,
      messagingSenderId: firebaseConfig['messagingSenderId']!,
      projectId: firebaseConfig['projectId']!,
      databaseURL: firebaseConfig['databaseURL'],
      measurementId: firebaseConfig['measurementId'],
      trackingId: firebaseConfig['trackingId'],
      storageBucket: firebaseConfig['storageBucket'],
    );
  }
  await Firebase.initializeApp(options: firebaseOptions);
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    MaterialTheme theme = MaterialTheme(textTheme);

    FlutterNativeSplash.remove();
    return GetMaterialApp(
      navigatorObservers: [routeObserver],

      title: "Estrellas",
      locale: const Locale('es'),
      fallbackLocale: const Locale('es'),
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      // darkTheme: theme.dark(),
      themeMode: ThemeMode.light,
      // themeMode: ThemeService.getThemeMode(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: (context, child) => RemoteConfigLayout(child: child!),
    );
  }
}
