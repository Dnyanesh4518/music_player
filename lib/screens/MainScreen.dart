import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/DeezerResponse/Deezer.dart';
import 'package:music_player/Methods/Methods.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  late Deezer deezer;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration=Duration.zero;
  Duration position=Duration.zero;
  @override
  void initState() {
    super.initState();
    fetchData();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying=state==PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration=newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position=newPosition;
      });
    });
  }
  String formatTime(Duration duration) {
    String twoDigits(int n)=> n.toString().padLeft(2,'0');
    final hours =twoDigits(duration.inHours);
    final minutes =twoDigits(duration.inMinutes.remainder(60));
    final seconds =twoDigits(duration.inSeconds.remainder(60));

    return [
      if(duration.inHours>0) hours,minutes,seconds,
    ].join(':');
  }
  Future fetchData() async {
    String url="https://deezerdevs-deezer.p.rapidapi.com/track/3610744";
    final Uri uri = Uri.parse(url);
    try
    {
      final response = await http.get(uri, headers: {
        'X-RapidAPI-Key': '14dbbc7971mshf61483edba36eaap1bfe3ejsnac110126b45c',
        'X-RapidAPI-Host': 'deezerdevs-deezer.p.rapidapi.com'
      },);
      if(response.statusCode==200) {
        deezer = Deezer.fromJson(jsonDecode(response.body.toString()));
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    duration=Duration(seconds: deezer.duration!.toInt());
    position=Duration.zero;
    return Scaffold(
      appBar: AppBar(
        title: Text(deezer.album!.type.toString()),
      ),
      body: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors:[Colors.black45,Colors.teal,Colors.black45],begin: Alignment.topRight,end: Alignment.bottomLeft,tileMode: TileMode.clamp),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:Image.network(deezer.album!.cover.toString(),
                // Image.network("https://imgnew.outlookindia.com/public/uploads/articles/2016/10/6/dhoni_20161017.jpg",
                    width:250,
                    height: 250,
                    fit: BoxFit.cover,),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(deezer.album!.title.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                         Text(deezer.titleShort.toString(),
                          style: TextStyle(
                              fontSize: 17
                          ),),
                      ],
                    ),
                    IconButton(
                        onPressed:(){},
                        icon:Icon(Icons.favorite_border_outlined,color: Colors.black,)
                    )
                  ],
                ),
                Slider(
                    min: 0,
                    activeColor:Colors.pinkAccent,
                    inactiveColor:Colors.pinkAccent,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged:(value) async{
                      final pos = Duration(seconds: value.toInt());
                      await audioPlayer.seek(pos);
                      await audioPlayer.resume();
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0,vertical: 5 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration-position))
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(1),
                            child: Image.network(deezer.album!.cover.toString(),
                              width:40,
                              height: 40,
                              fit: BoxFit.cover,),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30,right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                icon:Icon(Icons.skip_previous_rounded,color: Colors.white),
                                iconSize: 40,
                                onPressed: () async {},
                                color: Colors.pinkAccent,
                              ),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                icon: isPlaying?Icon(Icons.pause_circle_outline,color: Colors.white):Icon(Icons.play_circle_outline,color: Colors.white),
                                iconSize: 40,
                                onPressed: () async {
                                  if(isPlaying)
                                  {
                                    await audioPlayer.pause();
                                  }
                                  else
                                  {
                                    // String url ="https://pagalsong.in/uploads/systemuploads/mp3/M.S.%20Dhoni%20-%20The%20Untold%20Story/Kaun%20Tujhe%20(M%20S%20Dhoni%20-%20The%20Untold%20Story)%20128.mp3";
                                    String url =deezer.preview.toString();
                                    await audioPlayer.play(UrlSource(url));
                                  }
                                },
                                color: Colors.pinkAccent,
                              ),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                icon:Icon(Icons.skip_next_rounded,color: Colors.white),
                                iconSize: 40,
                                onPressed: () {},
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            child: Image.asset("lib/assets/images/loop-removebg-preview.png",scale:8),
                            // IconButton(
                            //   icon:ImageIcon(AssetImage("lib/assets/images/loop.png"),color: Colors.black,),
                            //   iconSize: 40,
                            //   onPressed: () async {
                            //     if(isPlaying)
                            //     {
                            //       await audioPlayer.pause();
                            //     }
                            //     else
                            //     {
                            //       String url ="https://pagalsong.in/uploads/systemuploads/mp3/M.S.%20Dhoni%20-%20The%20Untold%20Story/Kaun%20Tujhe%20(M%20S%20Dhoni%20-%20The%20Untold%20Story)%20128.mp3";
                            //       await audioPlayer.play(UrlSource(url));
                            //     }
                            //   },
                            //   color: Colors.pinkAccent,
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

              ],
            ),
          ));

  }
}

