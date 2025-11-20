import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/main.dart';
import 'package:quote_app/pages/acting_page.dart';
import 'package:quote_app/pages/art_page.dart';
import 'package:quote_app/pages/business_page.dart';
import 'package:quote_app/pages/music_page.dart';
import 'package:quote_app/pages/poetry_page.dart';
import 'package:quote_app/pages/politics_page.dart';
import 'package:quote_app/pages/quotes.dart';
import 'package:quote_app/widgets/tiles.dart';

class QuoteTypes extends StatelessWidget {
  const QuoteTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child:Scaffold(
        
        backgroundColor: const Color.fromARGB(255, 6, 4, 4),
        body: Padding(
          padding: EdgeInsets.only( left:25.w, right: 25.w, bottom: 20.h),
          child: Column(
            spacing: 20.h,
            children: [
              Container( width: 379.w, 
              padding: EdgeInsets.only( top: 60.h, bottom: 10.h),
              // color: Colors.amber,
              color: const Color.fromARGB(255, 6, 4, 4),
              child: Column(
                spacing: 20.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("quote.", style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.white
                    ),),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      // onTap: (){Navigator.pushNamed(context, "/main");},
                      onTap: (){Navigator.push(context, SwipePageRoute(page: Quotes(), yPositon: 0, xPositon: -1.0));}, 
                      splashColor: const Color.fromARGB(255, 75, 73, 73),
                      child: Icon(Icons.close, color: Colors.white,)
                    )
                  ],),

              //     TextField(
              //   style: TextStyle(color: Colors.white),
              //   cursorColor: Colors.grey, cursorRadius: Radius.circular(10),
              //   autocorrect: true,
                
              //   decoration: InputDecoration(
              //     focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              //     suffixIcon: Transform.rotate( angle: 95.8,
              //       child: Icon(Icons.search, color: Colors.grey,))
              //   ),
              // ),
                ],
              ),
              ),


              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Tiles(tilename: "Acting",funTask: (){Navigator.push(context,SwipePageRoute(page: ActingPage(), xPositon: 1.0, yPositon: 0));},),
                    Tiles(tilename: "Art", funTask: () { Navigator.push(context, SwipePageRoute(page: ArtPage(), xPositon: 1.0, yPositon: 0)); },),
                    Tiles(tilename: "Business", funTask: () { Navigator.push(context, SwipePageRoute(page: BusinessPage(), xPositon: 1.0, yPositon: 0)); },),
                    Tiles(tilename: "Music", funTask: () {  Navigator.push(context, SwipePageRoute(page: MusicPage(), xPositon: 1.0, yPositon: 0)); },),
                    Tiles(tilename: "Poetry", funTask: () {Navigator.push(context, SwipePageRoute(page: PoetryPage(), xPositon: 1.0, yPositon: 0)); },),
                    Tiles(tilename: "Politics", funTask: () {Navigator.push(context, SwipePageRoute(page: PoliticsPage(), xPositon: 1.0, yPositon: 0)); },),
                    // Tiles(tilename: "Religion", funTask: () {  },),
                    // Tiles(tilename: "Life", funTask: () {  },),
                    // Tiles(tilename: "Technology", funTask: () {  },),
                    // Tiles(tilename: "Inspirational", funTask: () {  },),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    )
  );
  }
}
