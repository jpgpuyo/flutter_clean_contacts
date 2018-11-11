import 'package:domain/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_contacts/ui/contactlist/contact_list_presenter.dart';
import 'package:flutter_clean_contacts/core/mvp/mvp_pattern.dart';
import 'package:flutter_clean_contacts/ui/contactlist/contact_list_widgets.dart';

enum _ViewStates {
  LOADING,
  SHOW_CONTACT_LIST,
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends MvpState<ContactListScreen, _ViewStates>
    implements ContactListView {
  List<Contact> _contactList = new List();

  ContactListPresenter _presenter;

  _ContactListState() {
    this._presenter = new ContactListPresenter(this);
  }

  @override
  Presenter getPresenter() {
    return _presenter;
  }

  @override
  void onInitState() {
    _presenter.getContactList();
  }

  @override
  Widget onBuild(BuildContext context, _ViewStates currentState) {
    print('onBuild: ' + currentState.toString());
    return new Scaffold(
      appBar: ContactListAppBarWidget(),
      body: widgetSelector(currentState),
    );
  }

  Widget widgetSelector(_ViewStates currentState) {
    switch (currentState) {
      case _ViewStates.LOADING:
        return LoadingWidget();
      case _ViewStates.SHOW_CONTACT_LIST:
        return ContactListWidget(
            contactList: _contactList,
            onRefresh: () => _presenter.getContactList());
    }
  }

  @override
  void showLoading() {
    rebuild(
      () {},
      _ViewStates.LOADING,
    );
  }

  @override
  void showContactList(List<Contact> contactList) {
    rebuild(
      () {
        this._contactList = contactList;
      },
      _ViewStates.SHOW_CONTACT_LIST,
    );
  }
}
