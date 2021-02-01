import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:extended_image/extended_image.dart';

class PlayVideo extends StatefulWidget {
  final String forwardData;
  var relatedData;

  PlayVideo({this.forwardData, this.relatedData});

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  String selectedUrl;
  // bool flag = false;

  List colorList = [
    Colors.blueGrey[700],
    Colors.blueGrey[700],
    Colors.blueGrey[700],
    Colors.blueGrey[700],
    Colors.blueGrey[700],
    Colors.blueGrey[700]
  ];

  resetListColor() {
    for (int i = 0; i < colorList.length; i++) {
      colorList[i] = Colors.blueGrey[700];
    }
  }

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(selectedUrl),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("Youtube Player"),
        ),
        body: Column(
          children: [
            YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.amber,
              ),
              builder: (BuildContext context, player) {
                return Center(
                  child: player,
                );
              },
            ),
            Container(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      "${widget.relatedData["CategoryTitle"]} Related Videos",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      " (${widget.relatedData["VideoCount"].toString()})",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print("Clicked");
                        setState(() {
                          resetListColor();
                          colorList[index] = Colors.blueGrey[300];
                        });
                      },
                      child: Container(
                        color: colorList[index],
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow_rounded),
                              ExtendedImage.network(
                                "https://img.youtube.com/vi/${widget.relatedData["Videos"][index]["url"].substring(widget.relatedData["Videos"][index]["url"].length - 11)}/0.jpg",
                                //code for last 11 character video Id
                                height: 45,
                                width: 75,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.relatedData["Videos"][index]
                                          ["VideoTitle"],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }

  @override
  void initState() {
    selectedUrl = widget.forwardData.toString();
  }
}
