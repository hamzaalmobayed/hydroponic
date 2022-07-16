class WriteFeeds {
  String createdAt;
  int entryId;
  String field1;
  String field2;

  WriteFeeds({this.createdAt, this.entryId, this.field1, this.field2});

  WriteFeeds.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    entryId = json['entry_id'];
    field1 = json['field1'];
    field2 = json['field2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['entry_id'] = this.entryId;
    data['field1'] = this.field1;
    data['field2'] = this.field2;
    return data;
  }
}