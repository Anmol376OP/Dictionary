import 'package:dictionary_app/fetch.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  return (runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: Dictionary())));
}

class Dictionary extends StatefulWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  final player = AudioPlayer();
  final textcontroller = TextEditingController();
  String display = "your answer will be displayed here";
  String s = "";
  void set(str) async {
    String temp = await Fetch.calc(str);
    setState(() {
      display = temp;
    });
  }

  void audio() {
    player.play(UrlSource(
        "https://ssl.gstatic.com/dictionary/static/sounds/20200429/$s--_gb_1.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("One stop dictionary"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(child: Text("Enter your word here")),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (e) {
              setState(() {
                s = e;
              });
            },
            controller: textcontroller,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              labelText: 'Type here',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              set(s);
            },
            child: const Text("search"),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(display),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                audio();
              },
              child: const Text("Play"))
        ],
      ),
    );
  }
}
