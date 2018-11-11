import 'package:domain/interactor/future_interactor.dart';
import 'package:domain/model/contact.dart';
import 'package:domain/repository/contacts_repository.dart';

class GetContactListUseCase extends FutureInteractor<List<Contact>> {
  final ContactsRepository contactRepository;

  GetContactListUseCase(this.contactRepository);

  @override
  Future<List<Contact>> run() {
    return contactRepository.getContactList().then((contactList) {
      contactList.sort((a, b) => a.fullname.compareTo(b.fullname));
      return Future.value(contactList);
    });
  }
}
