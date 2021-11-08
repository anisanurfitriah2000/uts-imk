import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout_challenge/user.dart';
import 'package:layout_challenge/userapi.dart';

import 'form.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
  }

  final myController = TextEditingController();
  final emailController = TextEditingController();
  List<Character> characterList = new List<Character>();

  void getCharactersfromApi() async {
    CharacterApi.getCharacters().then((response) {
      setState(() {
        //Iterable list = json.decode(response.body);
        print(response.body);
        //characterList = list.map((model) => Character.fromJson(model)).toList();
        Map<String, dynamic> data = jsonDecode(response.body);
        String vNama = data["nama"];
        String vEmail = data["email"];
        myController.text = vNama;
        emailController.text = vEmail;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.red,
          body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/nisa.png'),
                radius: 50.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: myController,
                // "TESTTT ", //characterList[0].nama != null ? characterList[0].nama : "nisa",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              Text(
                "FLUTTER NEWBIE",
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.red[100],
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                child: Divider(
                  color: Colors.teal.shade100,
                ),
                width: 150,
                height: 20.0,
              ),
              Card(
                elevation: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                  title: Text(
                    "+62 082153432084",
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'SourceSansPro',
                        fontSize: 16.0),
                  ),
                ),
              ),
              
              TextField(
                textAlign: TextAlign.center,
                controller: emailController,
                // "TESTTT ", //characterList[0].nama != null ? characterList[0].nama : "nisa",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BelajarForm()));
                  },
                  child: const Text('FORM')),
              ElevatedButton(
                  onPressed: () {
                    getCharactersfromApi();
                  },
                  child: const Text('Reload')),
            ]),
          ),
        ));
  }
}
