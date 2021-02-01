import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_progressclub/Screens/DisplayVideo.dart';

class WatchNowComponent extends StatefulWidget {
  @override
  _WatchNowComponentState createState() => _WatchNowComponentState();
}

class _WatchNowComponentState extends State<WatchNowComponent> {
  Future<dynamic> getVideoData() async {
    final url = "https://next.json-generator.com/api/json/get/VJ4AzAL2K";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVideoData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new DisplayVideo(
                                    videoData: snapshot.data["Data"][index],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.75),
                                BlendMode.dstATop),
                            image: NetworkImage(
                                "https://geekgardener.in/wp-content/uploads/growing-coriander-seedlings-ready-for-harvest-1280x720.jpg"),
                            fit: BoxFit.fill),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data["Data"][index]["CategoryTitle"],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "(${snapshot.data["Data"][index]["VideoCount"].toString()})",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
