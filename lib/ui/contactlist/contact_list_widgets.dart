import 'package:domain/model/contact.dart';
import 'package:flutter/material.dart';

class ContactListAppBarWidget extends AppBar {
  ContactListAppBarWidget()
      : super(
            title: new Text(
          "Flutter Clean Contacts",
        ));
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class ContactListWidget extends StatelessWidget {
  final List<Contact> contactList;
  final Function onRefresh;

  ContactListWidget({
    Key key,
    @required this.contactList,
    @required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
        child: Container(
          child: ListView.separated(
            itemCount: contactList.length,
            itemBuilder: (context, index) => contactItem(contactList[index]),
            separatorBuilder: (context, index) => Divider(),
          ),
        ),
        onRefresh: () async {
          onRefresh();
          return;
        });
  }

  Widget contactItem(Contact contact) {
    return ListTile(
      leading: getContactAvatar(contact),
      title: Text(contact.fullname),
      subtitle: Text(contact.email),
    );
  }

  CircleAvatar getContactAvatar(Contact contact) {
    if (contact.thumbnailUrl != null) {
      return CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(contact.thumbnailUrl),
      );
    } else {
      return CircleAvatar(
        radius: 30.0,
        child: Text(_getAvatarInitials(contact)),
      );
    }
  }

  String _getAvatarInitials(Contact contact) {
    var fullNameArray = contact.fullname.split(" ");
    String initials = "";
    for (var value in fullNameArray) {
      initials = initials + value[0];
    }
    return initials;
  }
}
