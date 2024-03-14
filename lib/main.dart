import 'package:diploma_task/account/create_account.dart';
import 'package:diploma_task/account/log_in_screen.dart';
import 'package:diploma_task/app_theme.dart';
import 'package:diploma_task/home/home_screen.dart';
import 'package:diploma_task/shared/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late bool isDark  ;
  late ThemeMode savedTheme ;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey("is dark")){
    isDark =  (prefs.getBool("is dark"))!;
  }else{
    isDark = false ;
  }
  if(isDark){
    savedTheme = ThemeMode.dark;
  }else{
    savedTheme = ThemeMode.light;

  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) =>ScreensProvider()..changeAppTheme(savedTheme),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreensProvider provider = Provider.of<ScreensProvider>(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route:(context)=>const HomeScreen(),
        LogInScreen.route:(context)=>const LogInScreen(),
        CreateAccount.route:(context)=>const CreateAccount(),
      },
      initialRoute: FirebaseAuth.instance.currentUser == null?LogInScreen.route:HomeScreen.route,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:provider.themeMode ,

    );
  }
}


