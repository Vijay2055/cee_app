import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/routes/app_pages.dart';
import 'package:psc_app/app/routes/app_routes.dart';
import 'package:psc_app/app_initializer.dart';


void main() async {
  await AppInitializer.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: Routes.ONBOARDING,
     getPages:AppPages.pages,
    );
  }
}
