import 'package:flutter/material.dart';
import 'package:rapidor_task/features/feature_user_sign_up/dispaly/pages/user_sign_up.dart';

class AppRoutes {
  static const String kLandingPage = '/';

  static const String kSingUpPage = '/sign_up_page';

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case kSingUpPage:
        return _materialRoute(UserSignUpPage());
      default:
        return null;
    }
  }

  static Route<dynamic>? _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
