import 'package:data/contacts_mock_data_source.dart';
import 'package:domain/repository/contacts_repository.dart';
import 'package:data/contacts_repository_impl.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();
  GetIt _getIt;

  factory Injector() {
    return _singleton;
  }

  Injector._internal() {
    _getIt = new GetIt();
  }

  static init() {
    _singleton._getIt.registerSingleton(_singleton._createContactRepository());
  }

  ContactsRepository _createContactRepository() {
    return ContactsRepositoryImpl(new ContactsMockDataSource());
  }

  static ContactsRepository get contactsRepository =>
      _singleton._getIt<ContactsRepository>();
}
