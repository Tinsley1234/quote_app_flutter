//https://api.api-ninjas.com/v2/randomquotes

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_app/Api/main_modelapi.dart';

Future<MainModelapi?> mainfetchQuote() async{
  final client = http.Client();

  try{
    final url = Uri.parse('https://lucifer-quotes.vercel.app/api/quotes');
    final response = await client.get(url).timeout(Duration(seconds: 5));

    if (response.statusCode == 200){
      final List<dynamic> jsonMap = jsonDecode(response.body);

      if (jsonMap.isNotEmpty){
        final Map<String, dynamic> quoteJson = jsonMap[0];
        return MainModelapi.fromJson(quoteJson);
      }
    } else {
        throw Exception('Failed to load quote: ${response.statusCode}');
  }} catch (e){
    throw Exception('Error: $e');
  }
  return null;
}



