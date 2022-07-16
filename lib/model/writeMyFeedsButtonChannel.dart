import 'package:hydro_app/model/wreiteButtonChannel.dart';
import 'package:hydro_app/model/writeButtonFeeds.dart';

class WriteMyFeedsButtonChannel {
  WriteButtonChannel channel;
  List<WriteButtonFeeds> feeds;

  WriteMyFeedsButtonChannel({this.channel, this.feeds});

  WriteMyFeedsButtonChannel.fromJson(Map<String, dynamic> json) {
    channel =
    json['channel'] != null ? new WriteButtonChannel.fromJson(json['channel']) : null;
    if (json['feeds'] != null) {
      feeds = <WriteButtonFeeds>[];
      json['feeds'].forEach((v) {
        feeds.add(new WriteButtonFeeds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.channel != null) {
      data['channel'] = this.channel.toJson();
    }
    if (this.feeds != null) {
      data['feeds'] = this.feeds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}