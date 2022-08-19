

import 'dart:convert';

Lyrics lyricsFromJson(String str) => Lyrics.fromJson(json.decode(str));

String lyricsToJson(Lyrics data) => json.encode(data.toJson());

class Lyrics {
  Lyrics({
    required this.message,
  });

  Message message;

  factory Lyrics.fromJson(Map<String, dynamic> json) => Lyrics(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  Message({
    required this.header,
    required this.body,
  });

  Header header;
  Body body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        header: Header.fromJson(json["header"]),
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "body": body.toJson(),
      };
}

class Body {
  Body({
    required this.lyrics,
  });

  LyricsClass lyrics;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        lyrics: LyricsClass.fromJson(json["lyrics"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics": lyrics.toJson(),
      };
}

class LyricsClass {
  LyricsClass({
    required this.lyricsId,
    required this.explicit,
    required this.lyricsBody,
    required this.scriptTrackingUrl,
    required this.pixelTrackingUrl,
    required this.lyricsCopyright,
    required this.updatedTime,
  });

  int lyricsId;
  int explicit;
  String lyricsBody;
  String scriptTrackingUrl;
  String pixelTrackingUrl;
  String lyricsCopyright;
  DateTime updatedTime;

  factory LyricsClass.fromJson(Map<String, dynamic> json) => LyricsClass(
        lyricsId: json["lyrics_id"],
        explicit: json["explicit"],
        lyricsBody: json["lyrics_body"],
        scriptTrackingUrl: json["script_tracking_url"],
        pixelTrackingUrl: json["pixel_tracking_url"],
        lyricsCopyright: json["lyrics_copyright"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics_id": lyricsId,
        "explicit": explicit,
        "lyrics_body": lyricsBody,
        "script_tracking_url": scriptTrackingUrl,
        "pixel_tracking_url": pixelTrackingUrl,
        "lyrics_copyright": lyricsCopyright,
        "updated_time": updatedTime.toIso8601String(),
      };
}

class Header {
  Header({
    required this.statusCode,
    required this.executeTime,
  });

  int statusCode;
  double executeTime;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        statusCode: json["status_code"],
        executeTime: json["execute_time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "execute_time": executeTime,
      };
}
