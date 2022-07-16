import 'package:hydro_app/model/writeChannel.dart';
import 'package:hydro_app/model/writeFeeds.dart';

class WriteMyFeedsChannel {
  WriteChannel channel;
  List<WriteFeeds> feeds;

  WriteMyFeedsChannel({this.channel, this.feeds});

  WriteMyFeedsChannel.fromJson(Map<String, dynamic> json) {
    channel =
    json['channel'] != null ? new WriteChannel.fromJson(json['channel']) : null;
    if (json['feeds'] != null) {
      feeds = new List<WriteFeeds>();
      json['feeds'].forEach((v) {
        feeds.add(new WriteFeeds.fromJson(v));
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