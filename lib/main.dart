
import 'package:clean_advicer/application/pages/advice/advicer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_advicer/theme.dart';
import 'package:clean_advicer/application/core/services/theme_services.dart';
import 'package:clean_advicer/injection.dart'as di; //di = dependency injection




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp (ChangeNotifierProvider(
    create: ((context) => ThemeService()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
    return Consumer<ThemeService>(builder: (context, themeService, child){
      return MaterialApp(
          themeMode: themeService.isDarkModeOn ? ThemeMode.dark :ThemeMode.light ,

          theme:AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: AdvicerPageWrapperProvider(),


      );

    });


  }}