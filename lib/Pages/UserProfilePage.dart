import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String userName = "John Doe";
  final String userEmail = "johndoe@example.com";
  final String userPhone = "+1234567890";
  final String userAddress = "123 Main Street, Springfield, USA";

  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),borderSide: BorderSide.none),
        title: const Text('User Profile',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/img2.png'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  userEmail,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Divider(height: 40, thickness: 1),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                subtitle: Text(userPhone),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Address'),
                subtitle: Text(userAddress),
              ),
              const Divider(height: 40, thickness: 1),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Edit Profile Page or handle edit logic
                  },
                  child: const Text('Edit Profile'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    // Handle logout logic
                  },
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
