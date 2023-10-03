import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_player/DeezerResponse/Deezer.dart';
import '../APIResponse/Items.dart';
import '../APIResponse/Main.dart';
class Methods {
  Future<void> getData() async {

    final queryParams = {
      'id': '37i9dQZF1DX4Wsb4d7NKfP',
    };
    String url="https://spotify23.p.rapidapi.com/playlist_tracks/";
    final Uri uri = Uri.parse(url).replace(queryParameters:queryParams);
    try
    {
      final response = await http.get(uri, headers: {
          'X-RapidAPI-Key': '14dbbc7971mshf61483edba36eaap1bfe3ejsnac110126b45c',
          'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
        },);
      if(response.statusCode==200)
      {
        Main.fromJson(jsonDecode(response.body.toString()));
      }
    }
    catch(e)
    {
      print(e);
    }
  }


}

