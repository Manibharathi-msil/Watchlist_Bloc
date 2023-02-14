import 'dart:convert';

List<ContactData> itemFromJson(String str) =>
    List<ContactData>.from(json.decode(str).map((x) => ContactData.fromJson(x)));

String itemToJson(List<ContactData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class ContactData {
  String? id;
  String? name;
  String? Contacts;
  String? url;

  ContactData({required this.id, required this.name, required this.Contacts, required this.url});

  ContactData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    Contacts = json['Contacts'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Contacts'] = this.Contacts;
    data['url'] = this.url;
    return data;
  }
}
