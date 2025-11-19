// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Tiles extends StatelessWidget {
  final String tilename;
  void Function()? funTask;
  Tiles({super.key, required this.tilename, required this.funTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        children:[ 
          ListTile( onTap: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minTileHeight: 62.h,
          tileColor: Colors.grey,),
          ListTile(
            onTap: funTask,
          minTileHeight: 60.h,
          tileColor:  const Color.fromARGB(255, 6, 4, 4),
          title: Text( tilename,style: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
          fontSize: 18,
          color: Colors.white
        ),),
        ),]
      ),
    );
  }
}