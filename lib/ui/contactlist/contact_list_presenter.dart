import 'package:domain/interactor/contacts/get_contact_list_use_case.dart';
import 'package:domain/model/contact.dart';
import 'package:flutter_clean_contacts/core/injection/Injector.dart';
import 'package:flutter_clean_contacts/core/mvp/mvp_pattern.dart';

abstract class ContactListView {
  void showLoading();

  void showContactList(List<Contact> productList);
}

class ContactListPresenter extends Presenter {
  ContactListView _view;

  GetContactListUseCase getContactListUseCase;

  ContactListPresenter(ContactListView view) {
    this._view = view;
    this.getContactListUseCase =
        new GetContactListUseCase(Injector.contactsRepository);
  }

  void getContactList() {
    _view.showLoading();
    getContactListUseCase.execute(
      onData: (contactList) {
        print('onData');
        _view.showContactList(contactList);
      },
      onDone: () => print('onDone'),
      onError: (error) => print('onError'),
    );
  }

  @override
  void destroy() {
    getContactListUseCase.unsubscribe();
  }
}
