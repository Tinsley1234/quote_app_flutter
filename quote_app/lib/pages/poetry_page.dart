import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/Api/main_api_call.dart';
import 'package:quote_app/Api/main_modelapi.dart';
import 'package:quote_app/widgets/button.dart';
import 'package:quote_app/widgets/header.dart';
import 'package:quote_app/widgets/tiny_designs_arrangement.dart';
// import 'package:quote_app/widgets/tiny_designs.dart';

class PoetryPage extends StatefulWidget {
  const PoetryPage({super.key});

  @override
  State<PoetryPage> createState() => _PoetryPageState();
}

class _PoetryPageState extends State<PoetryPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child:Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 4, 4),
        // backgroundColor: Colors.amber,
        body: Ppage()
      ),
    )
  );
  }
}



class Ppage extends StatefulWidget {
  const Ppage({super.key});

  @override
  State<Ppage> createState() => _PpageState();
}

class _PpageState extends State<Ppage> {
   late Future<MainModelapi?> futureQuote;
  @override
void initState() {
  super.initState();
  futureQuote = mainfetchQuote();}

Future<void> _refreshMusicPage() async {
  setState(() {
    futureQuote = mainfetchQuote();  // THIS fetches a NEW quote
  });
}
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      elevation: 0,
      backgroundColor: Colors.transparent,
      color: Colors.white,
      onRefresh: _refreshMusicPage,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: Stack(
          children: [
            TinyDesignsArrangement(),
            
            Column(
              children: [
                Header(title:"poetry."),
                
                SizedBox(height: 130.h,),  
            
                Container(
                  color: Colors.transparent,
                height: 180.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                   FutureBuilder<MainModelapi?>(
                      future: futureQuote,
                      builder: (BuildContext context, AsyncSnapshot<MainModelapi?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator(color: Colors.white));
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)),
                          );
                        } else if (snapshot.hasData && snapshot.data != null) {
                          final MainModelapi quote = snapshot.data!;
                          
                          // Start of the quote display widget structure
                          return Expanded(
                            child: SingleChildScrollView( // Wrap in SingleChildScrollView to allow text overflow handling
                              child: Container(
                                width: 250.w,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    // Quote Text
                                    Text(
                                      quote.quote ?? "No quote available.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 28.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    
                                    // Author and Icon Row
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Favorite Icon (moved to the start for better spacing)
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.favorite_border),
                                          color: Colors.grey,
                                        ),
                                        
                                        // Author Text
                                        Expanded( // Use Expanded to give the Text room and prevent overflow
                                          child: Text(
                                            "— ${quote.author ?? "Unknown"}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14.sp,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ); 
                        } else {
                          return const Center(child: Text('No Quote Found', style: TextStyle(color: Colors.white)));
                        }}
                    ),
                
      
              ],
              ),
            
          ),
                  
                Button(onpressedValue: _refreshMusicPage,)
          ]
        ),]
      )),
    );
  }
}
        
