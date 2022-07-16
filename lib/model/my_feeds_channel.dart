import 'channel.dart';
import 'feeds.dart';

class MyFeedsChannel {
  Channel channel;
  List<Feeds> feeds;

  MyFeedsChannel({this.channel, this.feeds});

  MyFeedsChannel.fromJson(Map<String, dynamic> json) {
    channel =
        json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    if (json['feeds'] != null) {
      feeds = <Feeds>[];
      json['feeds'].forEach((v) {
        feeds.add(new Feeds.fromJson(v));
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
