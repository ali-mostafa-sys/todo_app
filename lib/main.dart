// import 'package:flutter/material.dart';

import 'package:to_do_app/export_main_app.dart';
import 'package:to_do_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// here for injection
  await di.init();
  runApp(const MyApp());
}
