class WriteChannel {
  int id;
  String name;
  String latitude;
  String longitude;
  String field1;
  String field2;
  String createdAt;
  String updatedAt;
  int lastEntryId;

  WriteChannel(
      {this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.field1,
        this.field2,
        this.createdAt,
        this.updatedAt,
        this.lastEntryId});

  WriteChannel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    field1 = json['field1'];
    field2 = json['field2'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastEntryId = json['last_entry_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['field1'] = this.field1;
    data['field2'] = this.field2;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_entry_id'] = this.lastEntryId;
    return data;
  }
}