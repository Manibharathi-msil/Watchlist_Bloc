import '../model/model_item.dart';
import 'network.dart';

class ContactRepository {
  String url ='http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts';

  Future<List<ContactData>> fetchContact() async {
    ApiNetwork network = ApiNetwork();
    final response = await network.get(url);
    var contactData = itemFromJson(response);
    return contactData;
  }
}
