import 'package:data/contacts_mock_data_source.dart';
import 'package:domain/model/contact.dart';
import 'package:domain/repository/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsMockDataSource contactsMockDataSource;

  ContactsRepositoryImpl(this.contactsMockDataSource);

  @override
  Future<List<Contact>> getContactList() {
    return Future.delayed(Duration(milliseconds: 5000), () {
      return Future.value(contactsMockDataSource.getContactList());
    });
  }
}
