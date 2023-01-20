import 'package:fake_json/data/data.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  Users? selectedUser;

  UserProfile({super.key, this.selectedUser});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(widget.selectedUser!.profile!.picture!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    child: const Text("Name")
                  ),
                  const Text(": "),
                  Text(widget.selectedUser!.profile!.name!)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    child: const Text("Email")
                  ),
                  const Text(": "),
                  Text(widget.selectedUser!.profile!.email!)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    child: const Text("Phone")
                  ),
                  const Text(": "),
                  Text(widget.selectedUser!.profile!.phone!)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    child: const Text("Address")
                  ),
                  const Text(": "),
                  Expanded(child: Text(widget.selectedUser!.profile!.address!))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    child: const Text("Gender")
                  ),
                  const Text(": "),
                  Text(widget.selectedUser!.profile!.gender!)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    child: const Text("Age")
                  ),
                  const Text(": "),
                  Text(widget.selectedUser!.profile!.age!.toString())
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    child: const Text("Eye Color")
                  ),
                  const Text(": "),
                  Text(widget.selectedUser!.profile!.eyeColor!)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.selectedUser!.isActive!?
                const Text("Active", style: TextStyle(color: Colors.green),):
                const Text("Not Active",style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

}