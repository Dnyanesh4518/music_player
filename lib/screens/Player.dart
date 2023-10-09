import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/APIResponse/SpotifyResponse/SpotifyGetTrack.dart';
import 'package:music_player/MusicData/assetLists.dart';

class MusicPlayer extends StatefulWidget {
  String Id;
  final String  smallimg;
  final String  img;
  MusicPlayer(
      {super.key,
      required this.Id, required this.smallimg, required this.img,});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}
class _MusicPlayerState extends State<MusicPlayer> {
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  int index=0;
  bool previous=false;
  SpotifyGetTrack? Track;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isFavorite = false;
  bool isLoop = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Future<SpotifyGetTrack?> getTrack(String query) async {
    String url = "https://spotify23.p.rapidapi.com/tracks/?id=$query";
    final Uri uri = Uri.parse(url);
    try {
      final response = await http.get(
        uri,
        headers: {
          'X-RapidAPI-Key':
              '8bb677b6ddmsh4de3e0cdc9b6c71p198c53jsnc6acc99abeeb',
          'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
        },
      );
      if (response.statusCode == 200) {
         Track = SpotifyGetTrack.fromJson(jsonDecode(response.body.toString()));
        return Track;
      } else {
        print(response.statusCode);
        return SpotifyGetTrack();
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    index=musicIdList.indexOf(widget.Id);
    print(musicIdList.length);
    print("current Id="+widget.Id);
    setupAudioPlayerListeners();
  }
  void setupAudioPlayerListeners() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
  Future<void> toggleLooping() async {
    if (isLoop) {
      await audioPlayer.setReleaseMode(ReleaseMode.release);
      isLoop = false;
    } else {
      await audioPlayer.setReleaseMode(ReleaseMode.loop);
      isLoop = true;
    }
  }

  Future<void> manualRefresh(bool isPrevious) async{
    await audioPlayer.pause();
    await audioPlayer.seek(const Duration(seconds: 0));
    void moveToNext() {
      if (index < musicIdList.length - 1) {
        index++;
      }
    }
    void moveToPrevious() {
      if (index > 0 ) {
        index--;
      }
    }
    setState(() {
      if (isPrevious)
      {
        moveToPrevious();
        widget.Id=musicIdList.elementAt(index);
      }
      else
      {
        moveToNext();
        widget.Id=musicIdList.elementAt(index);
      }
    });
  }
  Widget buildBody(String ID){
    return FutureBuilder<SpotifyGetTrack?>(
                   future: getTrack(ID),
                   builder: (context, snapshot) {
            if(Track==null) {return const Center(child:  CircularProgressIndicator(),);}
            else {
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black45,
                    Colors.teal,
                    Colors.black45
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0,top: 90),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      Track!.tracks![0].album!.images![0].url.toString(), width: 300, height: 300,),),
                ),
                ListTile(
                  style:ListTileStyle.list,
                  title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      Track!.tracks![0].name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  subtitle: Align(
                    alignment: Alignment.center,
                    child: Text(
                      Track!.tracks![0].artists![0].name
                          .toString(),
                      overflow:TextOverflow.clip,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 19),
                    ),
                  ),
                  // trailing: IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         if (isFavorite) {
                  //           isFavorite = false;
                  //           ScaffoldMessenger.of(context)
                  //               .showSnackBar(const SnackBar(
                  //             content: Text("Removed"),
                  //             duration: Duration(milliseconds: 400),
                  //           ));
                  //         } else {
                  //           isFavorite = true;
                  //           ScaffoldMessenger.of(context)
                  //               .showSnackBar(const SnackBar(
                  //               content: Text("Added"),
                  //               duration:
                  //               Duration(milliseconds: 400)));
                  //         }
                  //       });
                  //     },
                  //     icon: isFavorite
                  //         ? const Icon(
                  //       Icons.favorite_sharp,
                  //       size: 30,
                  //       color: Colors.white,
                  //     )
                  //         : const Icon(
                  //       size: 30,
                  //       Icons.favorite_border_outlined,
                  //       color: Colors.white,
                  //     )),
                ),
                Slider(
                  min:0,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final pos = Duration(seconds: value.toInt());
                    await audioPlayer.seek(pos);
                    await audioPlayer.resume();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 26.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(position),
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(formatTime(duration - position),
                          style: const TextStyle(fontSize: 17))
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(Track!.tracks![0].album!.images![2].url.toString(),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(Icons.skip_previous_rounded,
                                  color: Colors.white),
                              iconSize: 50,
                              onPressed: () async {
                              await manualRefresh(true);
                              },
                              color: Colors.pinkAccent,
                            ),
                            IconButton(
                              icon: isPlaying
                                  ? const Icon(
                                  Icons.pause_circle_outline,
                                  color: Colors.white)
                                  : const Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white),
                              iconSize: 50,
                              onPressed: () async {
                                if (isPlaying) {
                                  await audioPlayer.pause();
                                } else {
                                  String url = widget.Id;
                                  await audioPlayer.play(UrlSource(
                                      Track!.tracks![0]
                                          .previewUrl
                                          .toString()));
                                  await audioPlayer.resume();
                                }
                              },
                              color: Colors.pinkAccent,
                            ),
                            IconButton(
                              icon: Icon(Icons.skip_next_rounded,
                                  color: Colors.white),
                              iconSize: 50,
                              onPressed: () async {
                                await manualRefresh(false);
                                },
                              color: Colors.pinkAccent,
                            ),
                          ]),
                      InkWell(
                          onTap: () async {
                            toggleLooping();
                          },
                          child: isLoop
                              ? const Icon(
                            Icons.loop,
                            color: Colors.deepPurple,
                            size: 40,
                          )
                              : const Icon(
                            Icons.loop,
                            color: Colors.white,
                            size: 40,
                          )),
                    ],
                  ),
                )
              ],
            ),
                  );}
          },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        leading: Icon(Icons.dehaze),
      ),
        body:  RefreshIndicator(
        key: refreshKey,
        onRefresh: ()async{},
    child:buildBody(widget.Id))
    );
  }

}
