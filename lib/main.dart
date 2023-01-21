import 'package:ateam_test/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/router.dart' as router;
import 'config/routing_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(
      MaterialApp(
        title: "Ateam Soft",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        initialRoute: homeViewRoute,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: MaterialColor(ColorConstants.primaryColor.value, ColorConstants.colorMap),
        ),
      ),
    );
  },
  );
}
