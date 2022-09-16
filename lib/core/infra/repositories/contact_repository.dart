import 'dart:convert';

import 'package:contact_list/core/dtos/contact_dto.dart';
import 'package:http/http.dart' as http;

class ContactRepositoryHttp {
  Future<ContactListResponse> getContactList() async {
    var url = Uri.parse('http://localhost:8080/contact-list');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      return ContactListResponse.fromJson(
        Map<String, dynamic>.from(decodedResponse),
      );
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }
  }
}
