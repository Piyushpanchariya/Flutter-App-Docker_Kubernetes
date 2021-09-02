import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyKube extends StatefulWidget {
  @override
  _MyKubeState createState() => _MyKubeState();
}

String cmd;
var r;
var url;
var response;

class _MyKubeState extends State<MyKube> {
  String cmd;
  var r;
  void web(i) async {
    url = Uri.http("3.108.185.39", "/cgi-bin/task11.py", {"cmd": i});
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
                    fit: BoxFit.fill,
                    image: AssetImage(""),
                    alignment: Alignment.topLeft),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      "Kubernetes at your service : ",
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
                      hintText: 'Kubernetes Commands',
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: Colors.red[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      web(cmd);
                    },
                    child: Text("RUN"),
                    textColor: Colors.white,
                  ),
                  Text(
                    r ?? "Output will display here",
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
