import 'package:relu_task/models/lyrics.dart';
import 'package:relu_task/models/track.dart';

import 'package:relu_task/models/track.dart';
import 'package:http/http.dart' as http;

class RemoteCalls {
  Future<List<TrackList>?> getTracks() async {
    var client = http.Client();
    var uri = Uri.parse(
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2214f14a3c77a554936bae2133d9397e");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return TracFromJson(json).message.body.trackList;
    }
  }

  Future<LyricsClass?> getLyrics(trackId) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=${trackId!}&apikey=2214f14a3c77a554936bae2133d9397e');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return lyricsFromJson(json).message.body.lyrics;
    }
  }
}
