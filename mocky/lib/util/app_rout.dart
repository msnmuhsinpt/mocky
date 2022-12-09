import 'package:flutter/cupertino.dart';
import 'package:mocky/view/screen/splash/splash_page.dart';

import '../view/screen/cart/cart_page.dart';
import '../view/screen/home/home_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  Route page = CupertinoPageRoute(builder: (context) => const SplashPage());
  switch (settings.name) {
    case "/splash":
      page = CupertinoPageRoute(builder: (context) => const SplashPage());
      break;
    case "/home":
      page = CupertinoPageRoute(builder: (context) => const HomePage());
      break;
    case '/cart':
      page = CupertinoPageRoute(builder: (context) => const CartPage());
      break;
  }

  return page;
}
