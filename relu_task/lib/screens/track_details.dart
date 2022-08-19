import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:relu_task/models/lyrics.dart';
import 'package:relu_task/services/remote_calls.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

var trackIndex, lyricsdata, isLoaded = false, network;

class TrackDetails extends StatefulWidget {
  const TrackDetails({Key? key}) : super(key: key);

  @override
  State<TrackDetails> createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLyricsData();
  }

  getLyricsData() async {
    lyricsdata =
        await RemoteCalls().getLyrics(tracks![trackIndex].track.trackId);
    if (lyricsdata != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Details'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text('Name'),
              subtitle: Text(tracks![trackIndex].track.trackName),
            ),
            ListTile(
              title: Text('Artist'),
              subtitle: Text(tracks![trackIndex].track.artistName),
            ),
            ListTile(
              title: Text('Album Name'),
              subtitle: Text(tracks![trackIndex].track.albumName),
            ),
            ListTile(
              title: Text('Explicit'),
              subtitle:
                  Text((tracks![trackIndex].track.explicit != 0).toString()),
            ),
            ListTile(
              title: Text('Rating'),
              subtitle: Text(tracks![trackIndex].track.trackRating.toString()),
            ),
            ListTile(
              title: Text('Lyrics'),
              subtitle: Text(lyricsdata.lyricsBody),
            ),
          ],
        ),
      ),
    );
  }
}
