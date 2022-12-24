import 'package:flutter/material.dart';

import 'package:lession_3_messenger/model/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? textField;
  bool isTapped = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChatModel item = ModalRoute.of(context)?.settings.arguments as ChatModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(item),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: item.chats == null
                          ? Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        height: 100,
                                        width: 100,
                                        child: Image.asset(
                                          item.avatar,
                                          fit: BoxFit.fitWidth,
                                        )),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      item.name,
                                      style: const TextStyle(fontSize: 24),
                                    )
                                  ]),
                            )
                          : Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListView.builder(
                                itemBuilder: (context, index) =>
                                    _buildItemListView(
                                        item.avatar, item.chats![index]),
                                itemCount: item.chats!.length),
                          )),
                     Row(
                      children: [
                        isTapped ? buildRowTap() : buildRowNotTap(),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(40)),
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: const InputDecoration(
                                            hintText: "Type Messenger",
                                            border: InputBorder.none),
                                        maxLines: null,
                                        onTap: () {
                                          setState(() {
                                            isTapped = true;
                                          });
                                        },
                                        controller: controller,
                                        onChanged: (value) {
                                          setState(() {
                                            // textField = value;
                                          });
                                        },
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.sentiment_very_satisfied_rounded))
                                  ],
                                ))),
                        // textField == '' || textField == null
                        controller.text == ''
                            ? IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.thumb_up),
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    // item.chats?.add(ChatItem(true, textField!),);
                                    item.chats?.add(ChatItem(true, controller.text),);
                                    controller.text = '';
                                  });
                                }, icon: const Icon(Icons.send)),
                      ],
                    )
                ],
              ))),
    );
  }

  Widget buildRowTap() {
    return IconButton(
        onPressed: () => setState(() {
              isTapped = false;
            }),
        icon: const Icon(Icons.arrow_forward_ios));
  }

  Widget buildRowNotTap() {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.photo)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.keyboard_voice_sharp)),
      ],
    );
  }

  AppBar _buildAppBar(ChatModel item) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.blue),
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 40,
                width: 40,
                child: Image.asset(
                  item.avatar,
                  fit: BoxFit.fitWidth,
                )),
          ),
          Text(
            item.name,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
      ],
    );
  }

  Widget _buildItemListView(String avatar, ChatItem chatItem) {
    final isSender = chatItem.isSender;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          !isSender
              ? Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              height: 48,
              width: 48,
              child: Image.asset(
                avatar,
                fit: BoxFit.fitWidth,
              ))
              : const SizedBox(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: isSender
                    ? const EdgeInsets.only(left: 60)
                    : const EdgeInsets.only(right: 60, left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isSender ? Colors.blue : Colors.grey.shade100,),
                child:  Text(
                  chatItem.chat,
                  style: TextStyle(
                      fontSize: 20,
                      color: isSender ? Colors.white : Colors.black),
                ),
              ),
            )
        ],
      ),
    );
    /*return Container(
      padding: const EdgeInsets.all(6),
      alignment: isSender
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Row(
        children: [
          isSender
              ? Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    avatar,
                    fit: BoxFit.fitWidth,
                  ))
              : const SizedBox(),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(15),
                margin: isSender
                    ? const EdgeInsets.only(left: 60)
                    : const EdgeInsets.only(right: 60),
                decoration: BoxDecoration(
                    color: isSender ? Colors.blue : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  chatItem.chat,
                  style: TextStyle(
                      fontSize: 18,
                      color: isSender ? Colors.white : Colors.black),
                )),
          ),
        ],
      ),
    );*/
  }
}
