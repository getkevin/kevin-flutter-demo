import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import 'package:kevin_demo_app/presentation/app_widget.dart';
import 'package:kevin_demo_app/injectable.dart';

//------------------------------------------------------------------------------

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);

  runApp(const AppWidget());
}
