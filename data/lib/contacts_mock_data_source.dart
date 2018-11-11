import 'package:domain/model/contact.dart';
import 'package:domain/repository/contacts_repository.dart';

class ContactsMockDataSource implements ContactsRepository {
  @override
  Future<List<Contact>> getContactList() {
    return Future.value([
      Contact(
        "Antonio Mendoza",
        "antonio.mendoza11@example.com",
        "https://randomuser.me/api/portraits/thumb/men/1.jpg",
      ),
      Contact(
        "Everett Hicks",
        "everett.hicks43@example.com",
        "https://randomuser.me/api/portraits/thumb/men/2.jpg",
      ),
      Contact(
        "Andre Weaver",
        "andre.weaver73@example.com",
        "https://randomuser.me/api/portraits/thumb/men/3.jpg",
      ),
      Contact(
        "Logan Jackson",
        "logan.jackson35@example.com",
        null,
      ),
      Contact(
        "Rodney Wagner",
        "rodney.wagner50@example.com",
        null,
      ),
      Contact(
        "Jeanne Scott",
        "jeanne.scott69@example.com",
        "https://randomuser.me/api/portraits/thumb/women/1.jpg",
      ),
      Contact(
        "Marie Peters",
        "marie.peters87@example.com",
        "https://randomuser.me/api/portraits/thumb/women/2.jpg",
      ),
      Contact(
        "Marsha Hill",
        "marsha.hill76@example.com",
        "https://randomuser.me/api/portraits/thumb/women/3.jpg",
      ),
      Contact(
        "Tanya Hernandez",
        "tanya.hernandez92@example.com",
        null,
      ),
      Contact(
        "Elaine Beck",
        "elaine.beck10@example.com",
        null
      ),
    ]);
  }
}
