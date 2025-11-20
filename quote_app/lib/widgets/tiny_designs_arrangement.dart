import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_app/widgets/tiny_designs.dart';

class TinyDesignsArrangement extends StatelessWidget {
  const TinyDesignsArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TinyDesigns(containerwidth: 60.w,),

        TinyDesigns(containerheight: 20.h, containerwidth: 20.w, 
        xOffset: 60.w, yOffset: 100.h , gradientAlignment: Alignment.centerLeft,
        gradientradius: 1.r, gradientMainColor: const Color.fromARGB(255, 15, 228, 168),),
        
        TinyDesigns(containerheight: 130.h, containerwidth: 130.w, 
        xOffset: 290.w, yOffset: 130.h , gradientAlignment: Alignment.centerLeft,
        gradientradius: 1.r, gradientMainColor:Color.fromARGB(255, 96, 66, 204)),
        
        TinyDesigns(containerheight: 15.h, containerwidth: 15.w, 
        xOffset: 30.w, yOffset: 400.h , gradientAlignment: Alignment.centerLeft,
        gradientradius: 1.r, gradientMainColor: const Color.fromARGB(214, 255, 162, 0),gradientSupportColor:const Color.fromARGB(200, 255, 162, 0),),
        
        TinyDesigns(containerheight: 100.h, containerwidth: 100.w, 
        xOffset: -80.w, yOffset: 530.h , gradientAlignment: Alignment.centerLeft,
        gradientradius: 1.r, gradientMainColor: const Color.fromRGBO(96, 125, 139, 0.5),gradientSupportColor: const Color.fromRGBO(96, 125, 139, 0.3),),
        
        TinyDesigns(containerheight: 20.h, containerwidth: 20.w, 
        xOffset: 240.w, yOffset: 600.h , gradientAlignment: Alignment.centerLeft,
        gradientradius: 1.r, gradientMainColor: const Color.fromARGB(255, 96, 66, 204), gradientSupportColor: const Color.fromARGB(255, 70, 66, 66),),
        
        TinyDesigns(containerheight: 40.h, containerwidth: 40.w, 
        xOffset: 300.w, yOffset: 450.h , gradientAlignment: Alignment.centerLeft,
        gradientradius: 1.r, gradientMainColor:Colors.red),
      ],
    );
  }
}