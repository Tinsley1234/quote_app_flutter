import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final void Function()? onpressedValue;
  const Button({super.key,  required this.onpressedValue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpressedValue, 
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              side: BorderSide(color: Colors.grey, width: 1.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r)
              ),
              padding: EdgeInsets.symmetric( vertical: 10.h, horizontal: 10.w)
            ),child: Text("New Quote", style: GoogleFonts.poppins(color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
              )
            ),
          );
  }
}