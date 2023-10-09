import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/APIResponse/SpotifyResponse/SpotifySearch.dart';
import 'package:music_player/MusicData/assetLists.dart';
import 'package:music_player/screens/AuthenticationScreens/Signup.dart';
import 'package:music_player/screens/Player.dart';
import '../Methods/AuthMethods/Auth.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,required User? user}): _user = user;
  final User? _user;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  User? _user;
  SignInAuthentication authentication=SignInAuthentication();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  bool hasData = false;
  String query = '';
  int retryCount = 0;
  bool isSearching = false;
  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }
  Future<SpotifySearch> searchMusic(String query) async {
    String url = "https://spotify23.p.rapidapi.com/search/?q=$query& type=tracks&limit=30";
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
        final search = SpotifySearch.fromJson(jsonDecode(response.body.toString()));
        return search;
      } else if (response.statusCode == 429 && retryCount < 3) {
        await Future.delayed(const Duration(seconds: 5));
        retryCount++;
      }
      return searchMusic(query);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    bool textEntered = false;
    return
      Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
            child: const Icon(Icons.dehaze),
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            }),
        title: const Text("Music Player"),
      ),
      drawer: NavigationDrawer(
          backgroundColor: Colors.grey.shade300,
          children: [
          SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                decoration: const BoxDecoration(color: Colors.black),
                alignment: Alignment.topLeft,
                height: 120,
                width: MediaQuery.of(context).size.width,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 30,
                            child: Text(_user?.displayName?.substring(0,1).toString()??'',
                              style: const TextStyle(fontSize: 30,color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(onPressed:()async{
                           FutureBuilder(
                            future: authentication.signOut(),
                            builder: (context,snapshot){
                              if(snapshot.connectionState==ConnectionState.waiting)
                              {
                                return const Center(child: CircularProgressIndicator(color: Colors.blueAccent,semanticsLabel:"Logging out "),);
                              }
                              else if(snapshot.connectionState==ConnectionState.done)
                              {
                                return const SignUpPage();
                              }
                              else {
                                return  const ScaffoldMessenger(child: SnackBar(content:Text("Something went wrong"),));
                              }
                            },
                          );
                        }, icon:const Icon(Icons.exit_to_app,color: Colors.white,size: 30,))
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      _user?.displayName.toString()??'Person',
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      body: Container(
          alignment: Alignment.topCenter,
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  width: MediaQuery.of(context).size.width * 0.97,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (value) {
                        setState(() {
                          query = _searchController.text.toString();
                          if (_searchController.text.isNotEmpty) {
                            textEntered = true;
                          }
                          hasData = true;
                          searchMusic(query);
                        });
                      },
                      onChanged: (val) {
                        setState(() {
                          isSearching = true;
                          hasData = false;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          if (isSearching) {
                            query = _searchController.text.toString();
                            if (_searchController.text.isNotEmpty) {
                              textEntered = true;
                            }
                            hasData = true;
                            searchMusic(query);
                          }
                        });
                      },
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 18),
                          border: InputBorder.none,
                          hintText: "Search",
                          suffixIcon: InkWell(
                              onTap: () {
                                query = _searchController.text.toString();
                                hasData = true;
                                FocusScope.of(context).unfocus();
                                searchMusic(query);
                              },
                              child: const Icon(Icons.search)),
                          suffixIconColor: Colors.black),
                    ),
                  ),
                ),
              ),
              hasData
                  ? 
              Expanded(
                      child: FutureBuilder<SpotifySearch>(
                          future: searchMusic(query),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                child:
                                    Text('Error: ${snapshot.error.toString()}'),
                              );
                            } else {
                              final search = snapshot.data ?? SpotifySearch();
                              if(search.tracks?.items?.isNotEmpty??false) {
                                int i=0;
                                while(i<(search.tracks?.items?.length??0))
                                {
                                  musicIdList.add(search.tracks!.items![i].data!.id.toString());
                                  i++;
                                }
                              }
                              if (search == null) {
                                return const ListTile(
                                  title: Text("No match Found"),
                                );
                              }
                              else {
                                return ListView.separated(
                                  itemCount: search.tracks!.items!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(search.tracks!.items![index]?.data?.name ?? ''),
                                      subtitle: Text(search.tracks!.items![index]?.data?.albumOfTrack?.name??''),
                                      leading: CircleAvatar(
                                        radius: 25,
                                        child: Image.network(
                                          search.tracks!.items![index]?.data?.albumOfTrack?.coverArt?.sources?[1].url??'',
                                          width: search.tracks!.items![index]?.data?.albumOfTrack?.coverArt?.sources?[1].width?.toDouble() ?? 0,
                                          height: search.tracks!.items![index]?.data?.albumOfTrack?.coverArt?.sources?[1].height?.toDouble() ?? 0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute( builder: (context) {
                                          return MusicPlayer(
                                            smallimg: search.tracks!.items![index].data?.albumOfTrack?.coverArt?.sources?[2].url ?? '',
                                            img: search.tracks!.items![index].data?.albumOfTrack?.coverArt?.sources?[0].url ?? '',
                                            Id: search.tracks!.items![index].data?.id.toString() ?? '',
                                          );
                                        }));
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: Colors.black,
                                      height: 1.0,
                                    ); // Customize the separator here.
                                  },
                                );
                              }
                            }
                          }),
                    )
                  : Text("")
            ],
          )),
    );
  }
}

