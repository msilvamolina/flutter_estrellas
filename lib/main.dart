import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

import 'app/app/layout/remote_config/remote_config_layout.dart';
import 'app/config/firebase_config.dart';
import 'app/routes/app_pages.dart';
import 'app/services/dependency_injection.dart';
import 'app/services/environment.dart';
import 'app/themes/text_theme.dart';
import 'app/themes/theme.dart';

void main() async {
  await GetStorage.init();
  const String flavor = String.fromEnvironment('flavor', defaultValue: '');

  await Environment.instance.init(env: flavor);

  // Inicializar Firebase y Remote Config
  await initFirebase();
  // await initRemoteConfig();

  // Inicializar dependencias
  DependecyInjection.init();

  // Manejo global de errores
  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}

/// Inicialización de Firebase
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
  } else if (Platform.isIOS) {
    // Usar el archivo GoogleService-Info.plist para iOS
    await Firebase.initializeApp();
    return;
  }

  await Firebase.initializeApp(options: firebaseOptions);
}

/// Inicialización de Firebase Remote Config
// Future<void> initRemoteConfig() async {
//   final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

//   try {
//     await remoteConfig.setDefaults({});
//     await remoteConfig.fetchAndActivate();
//     print('Remote Config inicializado correctamente.');
//   } catch (e) {
//     print('Error inicializando Remote Config: $e');
//     FirebaseCrashlytics.instance.recordError(e, StackTrace.current,
//         reason: "Error en initRemoteConfig");
//   }
// }

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    MaterialTheme theme = MaterialTheme(textTheme);

    // Quitar el splash screen después de cargar todo
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      navigatorObservers: [routeObserver],
      localizationsDelegates: const [
        ...PhoneFieldLocalization.delegates,
      ],
      supportedLocales: const [
        Locale('es', ''),
      ],
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
      // builder: (context, child) => RemoteConfigLayout(child: child!),
    );
  }
}
