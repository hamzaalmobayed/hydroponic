class Feeds {
  String  createdAt;
  int  entryId;
  String  temp;
  String  humidity;
  String  tdsMeter;
  String  waterTemp;

  Feeds(
      {this.createdAt,
        this.entryId,
        this.temp,
        this.humidity,
        this.tdsMeter,
        this.waterTemp});

  Feeds.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    entryId = json['entry_id'];
    temp = json['field1'] ?? '';
    humidity = json['field2'] ?? '';
    tdsMeter = json['field3'] ?? '';
    waterTemp = json['field4'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['entry_id'] = this.entryId;
    data['field1'] = this.temp;
    data['field2'] = this.humidity;
    data['field3'] = this.tdsMeter;
    data['field5'] = this.waterTemp;
    return data;
  }
}