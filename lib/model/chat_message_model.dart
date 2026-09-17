class ChatMessageModel {
  bool isUser;
  String msg;
  int currentMsgStatus;

  ChatMessageModel({
    required this.isUser,
    required this.msg,
    required this.currentMsgStatus,
  });
}
