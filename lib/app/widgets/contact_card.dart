import 'package:contact_list/app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final ContactViewModel contactInfo;

  const ContactCard({Key? key, required this.contactInfo}) : super(key: key);

  Color _color(String seed) {
    const allAvailableColors = [
      Color(0xFF8787C0),
      Color(0xFFEE7E93),
      Color(0xFF9B8847),
      Color(0xFFA0CE8E),
      Color(0xFFD3987A),
      Color(0xFF427E6B),
      Color(0xFF0081CF),
    ];
    return allAvailableColors[seed.hashCode % allAvailableColors.length];
  }

  Widget _showInfoDialog(BuildContext context) {
    return SimpleDialog(
      title: Text(contactInfo.name),
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Email:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contactInfo.email)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Phone:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contactInfo.phone)
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showDialog(context: context, builder: _showInfoDialog);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _color(contactInfo.name),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(contactInfo.name.characters.first),
                ),
              ),
              const SizedBox(width: 8),
              Text(contactInfo.name),
            ],
          ),
        ),
      ),
    );
  }
}
