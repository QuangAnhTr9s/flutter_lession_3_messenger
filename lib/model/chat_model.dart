import 'package:lession_3_messenger/images.dart';

class ChatModel{
  String avatar;
  String name;
  String lastChat;
  List<ChatItem>? chats;

  ChatModel({required this.avatar, required this.name, required this.lastChat , this.chats});
}
//Dummy data
final listChats = [
  ChatModel(
      avatar: Images.ronaldo,
      name: 'Ronaldo',
      lastChat: 'Dang lam gi the',
      chats: [
        ChatItem(true, 'Alo'),
        ChatItem(false, 'Hello'),
        ChatItem(true, 'abc'),
        ChatItem(false, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
        ChatItem(true, 'Năm cũ qua đi, năm mới đã tới. Chúc bạn bầu trời sức khỏe, biển cả tình thương, đại dương tình bạn, sự nghiệp sáng ngời, gia đình thịnh vượng'),
        ChatItem(false, 'Chúc năm mới đau đầu vì nhà giàu,'),
        ChatItem(false, 'Mệt mỏi vì học giỏi.'),
        ChatItem(false, 'Buồn phiền vì nhiều tiền.'),
        ChatItem(false, 'Mệt mỏi vì đẹp trai.'),
        ChatItem(false, 'Và mất ngủ vì không có đối thủ'),
      ]),
  ChatModel(
      avatar: Images.casilas, name: "Casilas", lastChat: "Alo Casilas",
      chats: [
    ChatItem(true, 'Hi'),
    ChatItem(false, 'Hello'),
    ChatItem(true, 'Chúc năm mới đau đầu vì nhà giàu. Mệt mỏi vì học giỏi. Buồn phiền vì nhiều tiền. Ngang trái vì xinh gái. Mệt mỏi vì đẹp trai. Và mất ngủ vì không có đối thủ.'),
    ChatItem(false,
        'Mừng xuân Tân Sửu chúc mọi người vui vẻ như Chim Sẻ.'
            ' Khỏe mạnh như Đại Bàng. Giàu sang như chim Phụng.'
            ' Làm lụng như chim Sâu. Sống lâu như Đà Điểu.'),
  ]),
  ChatModel(avatar: Images.varane, name: "Varane", lastChat: "Varane"),
  ChatModel(avatar: Images.pepe, name: "Pepe", lastChat: "Alo Pepe"),
  ChatModel(avatar: Images.carvajal, name: "Carvajal", lastChat: "Alo Carvajal"),
  ChatModel(avatar: Images.marcelo, name: "Marcelo", lastChat: "Alo Marcelo"),
  ChatModel(avatar: Images.kroos, name: "Kroos", lastChat: "Alo Kroos"),
  ChatModel(avatar: Images.benzema, name: "Benzema", lastChat: "Alo Benzema"),
  ChatModel(avatar: Images.james, name: "James", lastChat: "Alo James"),
  ChatModel(avatar: Images.bale, name: "Bale", lastChat: "Alo Bale"),
];
class ChatItem{
  final bool isSender;
  final String chat;

  ChatItem(this.isSender, this.chat);
}