class WriteButtonFeeds {
  String createdAt;
  int entryId;
  String field1;
  String field2;
  String field3;
  String field4;

  WriteButtonFeeds(
      {this.createdAt,
        this.entryId,
        this.field1,
        this.field2,
        this.field3,
        this.field4});

  WriteButtonFeeds.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    entryId = json['entry_id'];
    field1 = json['field1'];
    field2 = json['field2'];
    field3 = json['field3'];
    field4 = json['field4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['entry_id'] = this.entryId;
    data['field1'] = this.field1;
    data['field2'] = this.field2;
    data['field3'] = this.field3;
    data['field4'] = this.field4;
    return data;
  }
}