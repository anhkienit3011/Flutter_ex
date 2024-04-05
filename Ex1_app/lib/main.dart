import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Contact {
  final String name;
  final String phoneNumber;
  final String address;

  Contact({required this.name, required this.phoneNumber, required this.address});
}

class MyApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'TKien', phoneNumber: '0123456789', address: 'Hateco'),
    Contact(name: 'TH', phoneNumber: '01924325', address: 'XuanDinhStreet'),
    // Add more contacts here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book',
      home: Scaffold(
        appBar: AppBar(title: Text('Phone ')),
        body: ContactList(contacts: contacts),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> contacts;

  ContactList({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'), // Replace with actual image
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactDetail(contact: contact)),
              );
            },
          ),
        );
      },
    );
  }
}

class ContactDetail extends StatelessWidget {
  final Contact contact;

  ContactDetail({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'), // Replace with actual image
              radius: 50,
            ),
            SizedBox(height: 16),
            Text('Phone: ${contact.phoneNumber}'),
            Text('Address: ${contact.address}'),
            // Add more details here
          ],
        ),
      ),
    );
  }
}
