import 'package:get/get.dart';
import '../../view/register/register.dart';
import '../index.dart';
import '../widgets/index.dart';

class AppRoutes {
  static List<GetPage<dynamic>> appRoutes() => <GetPage<dynamic>>[
        GetPage<dynamic>(
          name: RouteName.splashScreen,
          page: () =>  MainWrapper(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage<dynamic>(
          name: RouteName.homeView,
          page: () => const Register(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
      ];
}
