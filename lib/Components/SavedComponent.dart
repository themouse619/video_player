import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:video_progressclub/Screens/PlayVideo.dart';

class SavedComponent extends StatefulWidget {
  @override
  _SavedComponentState createState() => _SavedComponentState();
}

class _SavedComponentState extends State<SavedComponent> {
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

  removeVideo() {
    print("Video Removed");
  }

  shareVideo() {
    print("Video Shared");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getVideoData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // List<dynamic> tempLength = [];
          // for (int i = 0; i < snapshot.data["Data"][i]["Videos"].length; i++) {
          //   tempLength.add(snapshot.data["Data"][i]["Videos"][i]);
          // }
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Image.network(
                                "https://img.youtube.com/vi/${snapshot.data["Data"][index]["Videos"][index]["url"].substring(snapshot.data["Data"][index]["Videos"][index]["url"].length - 11)}/0.jpg",
                                //code for last 11 character video Id
                                height: 100,
                                width: 180,
                                fit: BoxFit.fitWidth,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            PlayVideo(
                                              forwardData: snapshot.data["Data"]
                                                      [index]["Videos"][index]
                                                  ["url"],
                                            )));
                              },
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data["Data"][index]["Videos"]
                                        [index]["VideoTitle"],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "IT Futurz",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                PopupMenuButton(
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 1,
                                      child: Text("Delete"),
                                    ),
                                    PopupMenuItem(
                                        value: 2, child: Text("Share")),
                                  ],
                                  icon: Icon(Icons.more_vert),
                                  onSelected: (value) {
                                    if (value == 1) {
                                      removeVideo();
                                    } else {
                                      shareVideo();
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                }),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
