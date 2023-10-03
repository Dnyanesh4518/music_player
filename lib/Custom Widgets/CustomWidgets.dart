import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screens/MainScreen.dart';
import 'package:music_player/Methods/Methods.dart';
Widget CustomButton(String text,BuildContext context)
{
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    ),
    child:
    ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
      onPressed:(){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
          return MainScreen();
        }));
      },
    ),
  );

}
Widget CustomTextField(String FieldLabel,String hint,TextInputType keyboardType,bool ispassword)
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
    child: TextField(
      obscureText: ispassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        disabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(28),borderSide: BorderSide(color: Colors.black,width: 5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28),borderSide: BorderSide(color: Colors.black,width: 5)),
        floatingLabelStyle: TextStyle(color: Colors.pinkAccent),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.pinkAccent,
          ),
              borderRadius: BorderRadius.circular(28)
        ),
        label: Text(FieldLabel),
        hintText:hint,
      ),
    ),
  );
}
void Navigate(MaterialPageRoute route,BuildContext context)
{
  Navigator.pushReplacement(context, route);
}

Widget CustomContainer(Methods methods,BuildContext context,AudioPlayer audioPlayer)
{
  bool isPlaying = false;
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child:Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        FutureBuilder(
          future: methods.getData(),
          builder: (context,AsyncSnapshot snap){
            return ListView.builder(
                itemCount: snap.data.items.l,
                itemBuilder:(context,index){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network("",
                      width:250,
                      height: 250,
                      fit: BoxFit.cover,),
                  );
                });
          },
        ),
        const SizedBox(
          height: 50,
        ),
        FutureBuilder(
          future: methods.getData(),
          builder: (context,AsyncSnapshot snap){
            return ListView.builder(
                itemCount: snap.data.items.l,
                itemBuilder:(context,index){
                  return Text(snap.data.total.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),);
                });
          },
        ),
        const SizedBox(
          height: 5,
        ),
        FutureBuilder(
          future: methods.getData(),
          builder: (context,AsyncSnapshot snap){
            return ListView.builder(
                itemCount: snap.data.items.l,
                itemBuilder:(context,index){
                  return const Text("",
                    style: TextStyle(
                        fontSize: 17
                    ),);
                });
          },
        ),
        // FutureBuilder(
        //   future: methods.getData(),
        //   builder: (context,AsyncSnapshot snap){
        //     return ListView.builder(
        //         itemCount: snap.data.items.l,
        //         itemBuilder:(context,index){
        //           return Slider(
        //               min: 0,
        //               activeColor:Colors.pinkAccent,
        //               inactiveColor:Colors.pinkAccent,
        //               max:
        //               value:
        //               onChanged:(value) async{
        //                 final pos = Duration(seconds: value.toInt());
        //                 await audioPlayer.seek(pos);
        //                 await audioPlayer.resume();
        //               });
        //         });
        //   },
        // ),
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
                    child: Image.network("https://imgnew.outlookindia.com/public/uploads/articles/2016/10/6/dhoni_20161017.jpg",
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
                            String url ="https://pagalsong.in/uploads/systemuploads/mp3/M.S.%20Dhoni%20-%20The%20Untold%20Story/Kaun%20Tujhe%20(M%20S%20Dhoni%20-%20The%20Untold%20Story)%20128.mp3";
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
    ) ,
  );
}