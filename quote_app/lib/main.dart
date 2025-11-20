import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_app/pages/quotes.dart';
import 'package:quote_app/pages/quote_types.dart';
// import 'package:quote_app/step.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Standard design size (e.g., typical mobile phone)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return MaterialApp(
      //     theme: ThemeData(
      //   pageTransitionsTheme: PageTransitionsTheme(
      //     builders: {
      //       TargetPlatform.android: CustomZoomPageTransitionsBuilder()
      //     },
      //   ),
      // ),
        debugShowCheckedModeBanner: false,
        home: 
        // MyStepperApp(),
        Quotes(),
        // ActingPage(),
        routes: {
            "/types": (context) => QuoteTypes(),
            "/main" : (context) =>Quotes(),
          },
        );
        }
    );
    }
  }

  //for smooth zoom of naviagtion. It is used in the main

  class CustomZoomPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {return ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
      ),
      child: child,
    );
  }
}


//Smooth slide of pages. Used directly in the file
class SwipePageRoute extends PageRouteBuilder {
  final Widget page;
  double yPositon;
  double xPositon;

  SwipePageRoute({required this.page, required this.xPositon,required this.yPositon})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define the swipe direction (e.g., from right to left)
            var begin = Offset(xPositon, yPositon); // Start from right
            const end = Offset.zero; // End at center
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}