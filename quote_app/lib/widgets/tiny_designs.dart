import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

class TinyDesigns extends StatelessWidget {
  final double? yOffset;
  final double? xOffset;
  final double? containerheight;
  final double? containerwidth;
  final Color? gradientMainColor;  
  final Color? gradientSupportColor;  
  final Alignment? gradientAlignment;
  final double? gradientradius;
  

  const TinyDesigns({super.key,  this.containerheight, this.containerwidth, 
  this.gradientMainColor, this.gradientSupportColor, this.gradientAlignment, 
  this.gradientradius, this.yOffset, this.xOffset});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(xOffset ?? 160.w, yOffset?? -35.h),
      child: Container(width: containerwidth??50.w, height: containerheight??50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: RadialGradient(colors: [gradientMainColor??Colors.amber, gradientSupportColor?? Colors.black, ],
          center : gradientAlignment ?? Alignment.bottomCenter,
          radius : gradientradius ??0.8.r,
        // transform:GradientRotation(10.r),
        )
      ),),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

// class TinyDesigns extends StatelessWidget {
//   final double? leftPadding;
//   final double? rightPadding;
//   final double? topPadding;
//   final double? bottomPadding;
//   final double? containerheight;
//   final double? containerwidth;
//   final Color? containerColor;  

//   const TinyDesigns({super.key, this.leftPadding, this.rightPadding, this.topPadding, this.bottomPadding, this.containerheight, this.containerwidth, this.containerColor});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//               padding:  EdgeInsets.only(left: leftPadding??150.w,right: rightPadding??0, top: topPadding??0, bottom: bottomPadding??0),
//               child: Container(width: containerwidth??50.w, height: containerheight??50.h,
//               decoration: BoxDecoration(
//                 color: containerColor??const Color.fromARGB(255, 244, 197, 28),
//                 borderRadius: BorderRadius.circular(200),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color.fromARGB(255, 93, 84, 84),
//                     offset: Offset(0, 2),
//                     blurRadius: 2.r
//                   )
//                   ],
//                 gradient: RadialGradient(colors: [Colors.amber, Colors.black],
//                   center : Alignment.bottomLeft,
//                   radius : 1,
//                   // stops: [],
//                   // tileMode : TileMode.clamp,
//                   // focal:,
//                   // focalRadius : 0.0,
//                   // transform:,
//                 )
//               ),),
//             );
//   }
// }