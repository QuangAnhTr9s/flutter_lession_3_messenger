
import 'package:flutter/material.dart';
import 'package:lession_3_messenger/call/call_screen.dart';
import 'package:lession_3_messenger/contacts/contacts_screen.dart';
import 'package:lession_3_messenger/model/chat_model.dart';
import 'package:lession_3_messenger/screen_consts.dart';
import 'package:lession_3_messenger/story/story_screen.dart';
import 'chat/chat_screen.dart';
import 'images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.blue),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        RouteName.CHAT_SCREEN: (context) => const ChatScreen(),
        RouteName.CALL_SCREEN: (context) => CallScreen(),
        RouteName.CONTACTS_SCREEN: (context) => ContactsScreen(),
        RouteName.STORY_SCREEN: (context) => StoryScreen(),
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ChatModel> listHorizontal = List.from(listChats);

  @override
  Widget build(BuildContext context) {
    listHorizontal.shuffle();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          /*leading: InkWell(
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(Images.kaka))),
            ),
          ),*/
          centerTitle: true,
          title: const Text('Messenger'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chat))
          ],
        ),
        drawer: Drawer(
          child: Center(
            child: Container(
              child: const Text('This is Setting'),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12)),
                ),
              ),
              Container(
                height: 135,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = listHorizontal[index];
                            return _buildItemHorizontal(context, index, item);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 5);
                          },
                          itemCount: listChats.length),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: listChats.length,
                  itemBuilder: (context, index) {
                    final item = listChats[index];
                    return _buildItem(context, item);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.chat),
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.CALL_SCREEN);
                  },
                  icon: const Icon(Icons.videocam_sharp),
                ),
                label: 'Call'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.CONTACTS_SCREEN);
                  },
                  icon: const Icon(Icons.people),
                ),
                label: 'Contacts'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.STORY_SCREEN);
                  },
                  icon: const Icon(Icons.camera),
                ),
                label: 'Story'),
          ],
        ));
  }

  Widget _buildItem(BuildContext context, ChatModel item) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).pushNamed(RouteName.CHAT_SCREEN, arguments: item);
      }),
      child: Container(
        child: Row(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 100,
                width: 100,
                child: Image.asset(
                  item.avatar,
                  fit: BoxFit.fitWidth,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.lastChat,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemHorizontal(BuildContext context, int index, ChatModel item) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(RouteName.CHAT_SCREEN, arguments: item),
      child: Column(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, border: Border.all()),
              padding: const EdgeInsets.all(2),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: index == 0
                            ? const AssetImage(Images.add)
                            :  AssetImage(item.avatar),
                        fit: BoxFit.cover,
                      )),
                  // child: Image.asset(
                  //   'assets/james.jpg',
                  //   fit: BoxFit.fitWidth,
                  // ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: index == 0 ? const Text('Your story') : Text(item.name),
          )
        ],
      ),
    );
  }

/*Widget _buildItem() {
    return Container(
      height: 100,
      color: [
        Colors.pink,
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.green,
      ][Random().nextInt(5)],
      child: Row(children: [
        Image.asset('assets/james.jpg')
      ],),
    );
  }*/
}
