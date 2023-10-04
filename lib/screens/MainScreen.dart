import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/APIResponse/SearchResponse/Deezer.dart';

class MainScreen extends StatefulWidget {
  final String MusicId;
  const MainScreen({super.key, required this.MusicId});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final audioPlayer = AudioPlayer();
  Deezer? deezer;
  bool isPlaying = false;
  bool isLoading =false;
  bool isFavorite=false;
  bool isLoop=false;

  Duration duration=Duration.zero;
  Duration position=Duration.zero;
  @override
    void initState() {
    super.initState();
    fetchData(widget.MusicId);
    setupAudioPlayerListeners();
    Future.delayed(const Duration(seconds: 5));
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
  Future<void> fetchData(String id) async {
    String url = "https://deezerdevs-deezer.p.rapidapi.com/track/$id";
    final Uri uri = Uri.parse(url);
    try {
      final response = await http.get(
        uri,
        headers: {
          'X-RapidAPI-Key':
              '14dbbc7971mshf61483edba36eaap1bfe3ejsnac110126b45c',
          'X-RapidAPI-Host': 'deezerdevs-deezer.p.rapidapi.com'
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          deezer = Deezer.fromJson(jsonDecode(response.body));
        });
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: buildBody()),
    );
  }

  Widget buildBody() {
    if (deezer == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return FutureBuilder(
        future: fetchData(widget.MusicId),
        builder: (context, snapshot) {
          return
            Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black45, Colors.teal, Colors.black45],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 190,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    deezer!.album!.coverBig.toString(),
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
               const SizedBox(height: 70,),
                ListTile(
                  title: Text(
                  deezer!.album!.title.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ) ,
                  subtitle:Text(
                  deezer!.artist!.name.toString(),
                  style: const TextStyle(fontSize: 19),
                  ) ,
                  trailing:  IconButton(
                      onPressed: () {
                        setState(() {
                          if(isFavorite)
                            {
                              isFavorite=false;
                              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("Removed"),duration: Duration(milliseconds: 400),));

                            }
                          else
                          {
                            isFavorite=true;
                            ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("Added"),duration: Duration(milliseconds: 400)));
                          }

                        });
                      },
                      icon: isFavorite?const Icon(

                            Icons.favorite_sharp,
                        size: 30,
                        color: Colors.white,
                      ):const Icon(
                        size: 30,
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      )),
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
                  // onChangeEnd: (value)  {
                  //   // final pos = Duration(seconds: value.toInt());
                  //   //  audioPlayer.seek(pos);
                  //
                  // },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position),style: const TextStyle(fontSize: 17),),
                      Text(formatTime(duration - position),style: const TextStyle(fontSize: 17))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      deezer!.album!.coverSmall.toString(),
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                                 IconButton(
                      icon: Icon(Icons.skip_previous_rounded,
                          color: Colors.white),
                      iconSize: 50,
                      onPressed: () async {},
                      color: Colors.pinkAccent,
                    ),
                                 IconButton(
                      icon: isPlaying
                          ? Icon(Icons.pause_circle_outline,
                              color: Colors.white)
                          : Icon(Icons.play_circle_outline,
                              color: Colors.white),
                      iconSize: 50,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          String url = deezer!.preview.toString();
                          await audioPlayer.play(UrlSource(url));
                        }
                      },
                      color: Colors.pinkAccent,
                    ),
                                 IconButton(
                      icon: Icon(Icons.skip_next_rounded,
                          color: Colors.white),
                      iconSize: 50,
                      onPressed: () {},
                      color: Colors.pinkAccent,
                    ),
                               ]
                    ),
                    InkWell(
                      onTap: ()async{
                        toggleLooping();
                      },
                      child: isLoop?const Icon(Icons.loop,color: Colors.deepPurple,size: 40,):const Icon(Icons.loop,color:Colors.white,size: 40,)),
                  ],
                )
              ],
            ),
          );
        },
      );
    }
  }
}
