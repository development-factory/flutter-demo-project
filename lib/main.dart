import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name;
  String greeting = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _displayDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fy Flutter Project Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(greeting,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
            ],
          ),
        ));
  }

  void _displayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Hi, what is your name?'),
              content: TextField(
                controller: textEditingController,
              ),
              actions: [
                TextButton(
                    onPressed: () => {
                          setState(() {
                            _updateGreeting(textEditingController.text);
                            Navigator.pop(context);
                          })
                        },
                    child: Text('Ok'))
              ],
            ));
  }

  void _updateGreeting(String text) {
    setState(() {
      if (text.isNotEmpty) {
        greeting = 'Hello there, $text';
      } else {
        greeting = "I'm sorry, I don't know your name :(";
      }
    });
  }
}
