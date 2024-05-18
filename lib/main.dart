import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:inplayin2/Authentication/AuthPage.dart';
import 'package:inplayin2/Services/context_utility.dart';
import 'package:inplayin2/Services/uni_services.dart';
import 'package:inplayin2/forgot_password/forgotpassword.dart';
import 'package:inplayin2/pages/feedbackpage.dart';
import 'package:inplayin2/pages/homepage.dart';
import 'package:inplayin2/pages/coursepage.dart';
import 'package:inplayin2/pages/announcementspage.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await UniServices.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: ContextUtility.navigatorKey,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.light(),
      home: const MainView(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/authpage': (context) => const MainView(),
        '/coursepage': (context) => const CoursePage(),
        '/announcements': (context) => const AnnouncementsPage(),
        '/feedbacks' : (context) => const FeedbackPage(),
        '/forgotpassword': (context) => const ForgotScreen(),
      },
    );
  }
}



