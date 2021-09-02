import 'package:dockerapp/Kubernetes.dart';
import 'package:dockerapp/docker.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => MyApp(),
      "/docker": (context) => Docker(),
      "/kubernetes": (context) => MyKube(),
    },
  ));
}
