import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GeminiApiHttp extends ChangeNotifier {
  Future<void> geminiChatHttpAPi(String userInputText) async {
    log("Gemini Chat APi");
    try {
      final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent",
      );

      Map<String, String> header = {
        "x-goog-api-key": dotenv.env["GEMINI_API_KEY"]!,
        "Content-Type": "application/json",
      };
      Map<String, dynamic> body = {
        "contents": [
          {
            "parts": [
              {"text": userInputText},
            ],
          },
        ],
      };

      //Calling API
      final response = await http.post(
        url,
        headers: header,
        body: json.encode(body),
      );

      log("Response body:${response.body}");
      log("Status Code:${response.statusCode}");
    } catch (e) {
      log("Get Chat API Error:$e");
    }
  }
}
