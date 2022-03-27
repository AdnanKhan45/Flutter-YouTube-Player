import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YouTube Player",
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  YoutubePlayerController? youtubePlayerController;

  @override
  void initState() {

    const url = "https://www.youtube.com/watch?v=VHFniDyK6uM";

    youtubePlayerController = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(url)!,
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      loop: false,
      forceHD: false,
      isLive: false
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController!,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text("YouTube Player Tutorial"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              player,
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                const url = "https://www.youtube.com/watch?v=YBUt6Q6Vu9Y";

                youtubePlayerController!.load(YoutubePlayer.convertUrlToId(url)!);

              }, child: Text("Play Next")),
              ElevatedButton(onPressed: () {
                if (youtubePlayerController!.value.isPlaying) {
                  youtubePlayerController!.pause();
                } else {
                  youtubePlayerController!.play();
                }


              }, child: Text("Play & Pause")),
              SizedBox(height: 10,),
              Text("${youtubePlayerController!.metadata.title}"),
              SizedBox(height: 10,),
              Text("${youtubePlayerController!.metadata.author}"),
              SizedBox(height: 10,),
              Text("${youtubePlayerController!.metadata.duration.inMinutes} : Minutes"),
              SizedBox(height: 10,),
              Text("${youtubePlayerController!.metadata.videoId} : videoId"),
            ],
          ),
        );
      }
    );
  }
}

