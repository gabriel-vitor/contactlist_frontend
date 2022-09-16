import 'package:contact_list/app/models/contact.dart';
import 'package:contact_list/app/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  final List<ContactViewModel> contactList;

  const ContactListPage({Key? key, this.contactList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactList.length,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      itemBuilder: (context, index) {
        final contact = contactList[index];
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
          child: ContactCard(contactInfo: contact),
        );
      },
    );
  }
}
