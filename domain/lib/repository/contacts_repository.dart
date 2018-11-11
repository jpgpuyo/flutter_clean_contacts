import 'package:domain/model/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> getContactList();
}
