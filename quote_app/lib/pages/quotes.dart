import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/Api/api_call.dart';
import 'package:quote_app/Api/modelapi.dart';
import 'package:quote_app/main.dart';
import 'package:quote_app/pages/quote_types.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

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
        // backgroundColor: Colors.amber,
        body: Page()
      ),
    )
  );
  }
}


class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {

  late final Future<QuoteApi?> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = _fetchQuote();
  }

  Future<QuoteApi?> _fetchQuote() {
    return fetchQuote();
  }

  void getNewQuote(){
    print("Fetching new quote");
    setState(() {
      futureQuote = _fetchQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        children: [
          Padding(
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
                child: Text("quote.", style: GoogleFonts.poppins(
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
          ),
          
          SizedBox(height: 130.h,),
          FutureBuilder(future: futureQuote, builder: (BuildContext context, AsyncSnapshot<QuoteApi?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(color: Colors.white,value: null,);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white,),));
              } else if (snapshot.hasData) {
                  final QuoteApi quote = snapshot.data as QuoteApi;
                  return Container(
          height: 180.h,
          // color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                                    children: [
                                      Expanded(
                    child: SingleChildScrollView(
                      child: Container( width: 250.w,
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                   child: Column(
                                    spacing: 15.h,
                                    children: [
                       Text(quote.quote ??"No quotes",// maxLines: 5,
                      // overflow: TextOverflow.ellipsis,
                      // textAlign:TextAlign.justify,
                      // textWidthBasis: ,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          color: Colors.white,
                          wordSpacing: 0
                        ),
                        
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                        children: [
                          IconButton(onPressed: () {},
                            icon: Icon( Icons.favorite_border),
                            color: Colors.grey, ),
                          Text(quote.author ?? "Unknown",
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.white,
                              wordSpacing: 0
                            ),
                          ),
                        ],
                      ),
                    
                    SizedBox(height: 10.h,),
                    
                                    ],
                                  ),
                                  ),
                    ),
                                      )],),
                  );
              }else {
                return const Center(child: Text('No Quote Found', style: TextStyle(color: Colors.white)));}
                  }),
    
    
        ElevatedButton(onPressed: getNewQuote, 
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
          ),
          
        
        ],
      ),
    );
        }
      
    
    
  }



