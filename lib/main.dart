import 'package:flutter/material.dart';
import 'package:video_progressclub/Screens/DisplayVideo.dart';
import 'package:video_progressclub/Screens/Home.dart';
import 'package:video_progressclub/Screens/PlayVideo.dart';
import 'package:video_progressclub/Screens/VideoDashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/VideoDashboard': (BuildContext context) => VideoDashboard(),
        '/DisplayVideo': (BuildContext context) => DisplayVideo(),
        '/YoutubePlayer': (BuildContext context) => PlayVideo(),
      },
      title: "Video_PC Testing app",
      debugShowCheckedModeBanner: false,
    );
  }
}
