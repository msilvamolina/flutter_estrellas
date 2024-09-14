import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Estrellas",
      locale: const Locale('es'),
      fallbackLocale: const Locale('es'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // builder: (context, child) => MainLayout(child: child!),
    ),
  );
}
