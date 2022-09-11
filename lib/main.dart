import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = "api 통신 전!!!";
  final String _url = 'https://four-carrots.link/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          http.Response res = await http.get(Uri.parse(_url));

            setState(() {
              if (_text == "api 통신 전!!!") {
                _text = res.body;
              } else {
                _text = "api 통신 전!!!";
              }
            });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.cached),
      ),
    );
  }
}
