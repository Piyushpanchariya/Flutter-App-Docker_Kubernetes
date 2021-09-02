import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String cmd;
var r;
var url;
var response;

class Docker extends StatefulWidget {
  @override
  _MyDockerState createState() => _MyDockerState();
}

class _MyDockerState extends State<Docker> {
  String cmd;
  var r;
  void web() async {
    url = Uri.http("192.168.43.200", "/cgi-bin/task7.py", {"cmd": cmd});
    response = await http.get(url);
    setState(() {
      r = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Docker Container",
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        backgroundColor: Colors.red[800],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: 410,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(""),
                    alignment: Alignment.topCenter),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      "Docker services : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      cmd = value;
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                    autocorrect: false,
                    autofocus: false,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.comment),
                      hintText: 'Docker Commands',
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: Colors.red[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      web();
                    },
                    child: Text("RUN"),
                    textColor: Colors.white,
                  ),
                  Text(
                    r ?? "Output Will Show Here",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.red[800],
                        color: Colors.white),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
