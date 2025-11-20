import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/main.dart';
import 'package:quote_app/pages/quote_types.dart';

class Header extends StatelessWidget {
  final String title;
  
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 10),
            child: Container(height: 50.h, width: 379.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: Colors.transparent,
            // color:Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              InkWell(
                radius: 10,
                borderRadius: BorderRadius.circular(10),
                onTap: (){}, 
                splashColor: const Color.fromARGB(255, 75, 73, 73),
                child: Text(title, style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.white
                ),),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: (){Navigator.push(context, SwipePageRoute(page: QuoteTypes(), xPositon: 1.0, yPositon: 0));}, 
                splashColor: const Color.fromARGB(255, 75, 73, 73),
                child: Stack(children: [
                  Icon(Icons.favorite_border, color: Colors.white,),
                  Padding(
                    padding: const EdgeInsets.only(top:2.0, left: 3.5),
                    child: Icon(Icons.more_horiz, color: Colors.white, size: 15.sp,
                    ),
                  ),
                ],),
              )
            ],),
            ),
          );
  }
}