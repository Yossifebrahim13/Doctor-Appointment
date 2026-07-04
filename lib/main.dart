import 'package:doctor_appointment/core/di/dependancy_injection.dart';
import 'package:doctor_appointment/core/routing/app_router.dart';
import 'package:doctor_appointment/doc_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
