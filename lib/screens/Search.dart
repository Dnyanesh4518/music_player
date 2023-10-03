import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/SearchResponse/Search.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  String query="";
  bool hasdata=false;
  final TextEditingController _searchController = TextEditingController();
  Future<Search> searchMusic(String query) async {
    String url = "https://deezerdevs-deezer.p.rapidapi.com/search/$query";
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
         Search search=jsonDecode(response.body.toString());
         return search;
      }
    } 
    catch (e) {
      print(e);
    }
    return Search();
  }
  
  @override
  Widget build(BuildContext context) {
    late Search Searched;
    return Scaffold(
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
      child:
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
            Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  width: MediaQuery.of(context).size.width * 0.97,
                  child: TextField(
                    onSubmitted:(value){
                      query=_searchController.text;
                     Search search = FutureSearch(query) as Search;
                     print(search.data?[0].title.toString());
                    },
                    style: TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none,
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search,),
                        suffixIconColor: Colors.black),
                    controller: _searchController,
                  ),
                ),
              ],
            ),
          ),

        ],
      )),
    );
  }
}

//
