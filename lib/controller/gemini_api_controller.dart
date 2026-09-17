import "dart:convert";
import "dart:developer";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class GeminiApiController extends ChangeNotifier {
  //GeminiApiController({super.key, required super.create});

  Future<void> geminiChatHttpAPi(String userInputText) async {
    log("Gemini Chat APi called");
    try {
      final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent",
      );

      //HEADER
      Map<String, String> header = {
        "x-goog-api-key": dotenv.env["GEMINI_API_KEY"]!,
        "Content-Type": "application/json",
      };

      //PROMPT
      String prompt =
          """
        You are the Grammer Checker

        You have certain rules:
        1.If Sentence is Gramatically correct then just reply Correct
        2.If Sentence is Gramatically incorrect then just reply with corrected sentence

        This is the sentence: $userInputText
      """;

      //BODY
      Map<String, dynamic> body = {
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      };

      //Calling API
      final response = await http.post(
        url,
        headers: header,
        body: json.encode(body), //convert dart object(like map) to json
      );

      //log("Response body:${response.body}");
      log("Status Code:${response.statusCode}");

      final convertedResponse = json.decode(
        response.body,
      ); //convert json to dart object
      String aiResponse =
          convertedResponse["candidates"][0]["content"]["parts"][0]["text"];

      log("AI Response: $aiResponse");
    } catch (e) {
      log("Get Chat API Error:$e");
    }
  }
}
