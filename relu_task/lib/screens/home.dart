import 'dart:isolate';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:relu_task/models/lyrics.dart';
import 'package:relu_task/models/track.dart';
import 'track_details.dart';
import 'package:relu_task/services/remote_calls.dart';

List<TrackList>? tracks;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    tracks = await RemoteCalls().getTracks();
    if (tracks != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trending'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Visibility(
          visible: isLoaded,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.builder(
              itemCount: tracks?.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: (() {
                    setState(() {
                      trackIndex = index;
                    });
                    Navigator.pushNamed(context, 'track_details');
                  }),
                  child: Card(
                    shadowColor: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.library_music),
                        trailing: Text(tracks![index].track.artistName),
                        title: Text(tracks![index].track.trackName),
                        subtitle: Text(tracks![index].track.albumName),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
