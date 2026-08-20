import 'package:flutter/material.dart';
import 'app/app.dart';
import 'bootstrap/initial_setup.dart';

void main() async {
  await InitialSetup.init();
  runApp(const App());
}
