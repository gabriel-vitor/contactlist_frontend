import 'package:contact_list/app/models/contact.dart';
import 'package:contact_list/app/pages/contact_list_page.dart';
import 'package:flutter/material.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: FutureBuilder<List<ContactViewModel>>(
        future: _store.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildError();
          }

          if (snapshot.hasData) {
            return _buildList(snapshot.data ?? []);
          }

          return _buildLoading();
        },
      ),
    );
  }

  Center _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  ContactListPage _buildList(List<ContactViewModel> list) {
    return ContactListPage(
      contactList: list,
    );
  }

  Center _buildError() {
    return const Center(
      child: Text('Failed to load the contact list'),
    );
  }
}
