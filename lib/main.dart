import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/core/theme/themes.dart';
import 'package:application_patient/routes/app_routes.dart';
import 'package:application_patient/service/notification_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotifcationApp.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'onePeace patient',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
      themeMode: ThemeMode.dark,
      getPages: AppRoutes.routes,
      initialRoute: RoutesName.onboarding,
      theme: Apptheme.light,
    );
  }
}
