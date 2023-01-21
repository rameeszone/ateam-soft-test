import 'package:ateam_test/screens/home/view.dart';
import 'package:flutter/material.dart';
import 'routing_constants.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => const HomeView(), settings: settings);
  }
  return MaterialPageRoute(builder: (context) => Container(), settings: settings);
}
