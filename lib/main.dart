import 'package:api_call_using_cleanarq_di_bloc/core/app_theme.dart';
import 'package:api_call_using_cleanarq_di_bloc/di/di.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/blocs_settings/bloc_observer.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Call',
      theme: appTheme(),
      home: const MainScreen(),
    );
  }
}
