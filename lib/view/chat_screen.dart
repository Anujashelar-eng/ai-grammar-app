import 'package:ai_grammer_app/controller/gemini_api_controller.dart';
import 'package:ai_grammer_app/view/widget/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isConversationStarted = true;
  TextEditingController chatTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "AI GrammarSence",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(93, 93, 95, 1),
          ),
        ),
        centerTitle: true,
        actions: [Icon(Icons.refresh_outlined, color: Colors.white)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isConversationStarted
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Align(
                                alignment: AlignmentGeometry.bottomRight,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(top: 15, left: 50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromRGBO(106, 83, 231, 0.4),
                                  ),
                                  child: Text(
                                    "How Are You",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Align(
                                alignment: AlignmentGeometry.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    right: 50,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/images.jpg",
                                        height: 15,
                                        width: 15,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                            255,
                                            255,
                                            255,
                                            0.04,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          border: Border.all(
                                            color: Color.fromRGBO(
                                              255,
                                              255,
                                              255,
                                              0.02,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Your Sentence How can I help you using gemini APi in the flutter application",
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                  )
                : NoDataWidget(),

            //Check Grammer TextField
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //TEXTFIELD
                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    controller: chatTextEditingController,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Check Grammer..",
                      hintStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(158, 158, 158, 1),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(25, 25, 27, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                //SUBMIT BUTTON   //API CALL
                GestureDetector(
                  onTap: () async {
                    if (chatTextEditingController.text.isNotEmpty) {
                      await Provider.of<GeminiApiController>(
                        context,
                        listen: false, //
                      ).geminiChatHttpAPi(chatTextEditingController.text);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(106, 83, 231, 1),
                    ),
                    child: Icon(Icons.send, size: 25),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
