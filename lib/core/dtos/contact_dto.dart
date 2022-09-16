import 'abstract_paginated_dto.dart';

class ContactDTO implements AbstractContent {
  String id;
  String name;
  String phoneNumber;
  String email;
  String registrationDate;

  ContactDTO({
    this.id = "",
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.registrationDate = "",
  });

  ContactDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        name = json['name'] ?? "",
        phoneNumber = json['phoneNumber'] ?? "",
        email = json['email'] ?? "",
        registrationDate = json['registrationDate'] ?? "";

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'registrationDate': registrationDate,
    };
    return data;
  }
}

class ContactListResponse extends PaginatedDTO<ContactDTO> {
  ContactListResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(ContactDTO.fromJson, json);
}
