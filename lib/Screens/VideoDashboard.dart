import 'package:flutter/material.dart';
import 'package:video_progressclub/Components/WatchNowComponent.dart';
import 'package:video_progressclub/Components/SavedComponent.dart';

class VideoDashboard extends StatefulWidget {
  @override
  _VideoDashboardState createState() => _VideoDashboardState();
}

class _VideoDashboardState extends State<VideoDashboard> {
  List<Widget> tabBarViews = [WatchNowComponent(), SavedComponent()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Motivational Videos"),
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Watch Now",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Saved",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: tabBarViews,
        ),
      ),
    );
  }
}
