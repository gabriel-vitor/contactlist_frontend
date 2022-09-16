import 'package:contact_list/app/models/contact.dart';
import 'package:contact_list/core/dtos/contact_dto.dart';
import 'package:contact_list/core/infra/repositories/contact_repository.dart';

class HomeStore {
  final repository = ContactRepositoryHttp();

  Future<List<ContactViewModel>> getAllUsers() async {
    final fetchedData = await repository.getContactList();
    final resultList = <ContactViewModel>[
      for (final element in fetchedData.content ?? <ContactDTO>[])
        ContactViewModel(element.name, element.email, element.phoneNumber)
    ];

    return resultList;
  }
}
