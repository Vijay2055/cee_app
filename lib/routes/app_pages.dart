import 'package:get/get.dart';
import 'package:psc_app/bindings/bottom_nav_binding.dart';
import 'package:psc_app/routes/app_routes.dart';
import 'package:psc_app/widgets/bottom_nav_widget.dart';

class AppPages {
  static final routes =[
    GetPage(name: AppRoutes.bottomnav,page:()=> BottomNavScreen(),binding: BottomNavBinding())
  ];
}
