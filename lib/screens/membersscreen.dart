import 'package:flutter/material.dart';
import 'package:media/Models/MemeberModel.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final List<Member> members = const [
    Member(name: 'George Lindelof', email: 'carlsen@armand.no', status: 'Active'),
    Member(name: 'Eric Dyer', email: 'cristofor.ajer@lone.no', status: 'Active'),
    Member(name: 'Haitam Alissami', email: 'haitam@gmail.com', status: 'Active'),
    Member(name: 'Michael Cambel', email: 'camp@hotmail.com', status: 'Inactive'),
    Member(name: 'Ashley Williams', email: 'william.ash@newl.com', status: 'Active'),
    Member(name: 'Vanessa Paradi', email: 'paradi.van@google.com', status: 'Active'),
    Member(name: 'Lora Palmer', email: 'lora.palm@gmail.com', status: 'Active'),
    Member(name: 'Christy Newborn', email: 'chris@amazon.com', status: 'Inactive'),
    Member(name: 'Nick Jackel', email: 'jackel1234@google.com', status: 'Active'),
    Member(name: 'Tora Laundren', email: 'tora.lan@gmail.com', status: 'Active'),
    Member(name: 'Malisha Manis', email: 'manisha@hotmail.com', status: 'Active'),
  ];

  List<Member> filteredMembers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMembers = members;
    searchController.addListener(() {
      filterMembers();
    });
  }

  void filterMembers() {
    List<Member> results = [];
    if (searchController.text.isEmpty) {
      results = members;
    } else {
      results = members
          .where((member) =>
              member.name.toLowerCase().contains(searchController.text.toLowerCase()) ||
              member.email.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredMembers = results;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search members...',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMembers.length,
              itemBuilder: (context, index) {
                final member = filteredMembers[index];
                return ListTile(
                  title: Text(member.name),
                  subtitle: Text(member.email),
                  trailing: Text(
                    member.status,
                    style: TextStyle(
                      color: member.status == 'Active' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
