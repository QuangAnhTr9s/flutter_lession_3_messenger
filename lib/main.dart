
import 'package:flutter/material.dart';
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
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Messenger'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12)
              ),
            ),
          ),
          Container(
            height: 135,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _buildItemHorizontal(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 5,
                  );
                },
                itemCount: 15),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => _buildItem(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: 20),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Story'),
        ],
      )
    );
  }

  Widget _buildItem() {
    return Container(
      child: Row(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(shape: BoxShape.circle),
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/james.jpg',
                fit: BoxFit.fitWidth,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Quang Anh'),
                Text('ban dang lam gi do'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemHorizontal() {
    return Container(
      child: Column(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
              padding: EdgeInsets.all(2),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(Images.james),
                      fit: BoxFit.cover,
                    )
                  ),
                  // child: Image.asset(
                  //   'assets/james.jpg',
                  //   fit: BoxFit.fitWidth,
                  // ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Quang Anh'),
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
