// import 'dart:developer';

import 'package:flutter/material.dart';

import 'PlayVideo.dart';

class DisplayVideo extends StatefulWidget {
  final videoData;

  DisplayVideo({this.videoData});

  @override
  _DisplayVideoState createState() => _DisplayVideoState();
}

class _DisplayVideoState extends State<DisplayVideo> {
  // List<String> id;

  // @override
  /*void initState() {
    for (int i = 0; i < widget.videoData["Videos"][i].length; i++) {
      id.add(widget.videoData["Videos"][i]["url"]
          .substring(widget.videoData["Videos"][i]["url"].length - 11));
    }
  }*/
  saveVideo() {
    print("Video Saved");
  }

  shareVideo() {
    print("Video Shared");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoData["CategoryTitle"]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
            itemCount: 6,
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
                            "https://img.youtube.com/vi/${widget.videoData["Videos"][index]["url"].substring(widget.videoData["Videos"][index]["url"].length - 11)}/0.jpg", //code for last 11 character video Id
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
                                          forwardData:
                                              widget.videoData["Videos"][index]
                                                  ["url"],
                                          relatedData: widget.videoData,
                                        )));
                            // print(id);
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
                                widget.videoData["Videos"][index]["VideoTitle"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "IT Futurz",
                                style: TextStyle(fontWeight: FontWeight.w300),
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
                                  child: Text("Save"),
                                ),
                                PopupMenuItem(value: 2, child: Text("Share")),
                              ],
                              icon: Icon(Icons.more_vert),
                              onSelected: (value) {
                                if (value == 1) {
                                  saveVideo();
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
      ),
    );
  }
}
