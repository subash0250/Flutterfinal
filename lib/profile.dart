import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meditation_app_flutterfinalproject/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  late User _currentUser;
  String email = "";
  String username = "";
  String phone = "";
  String gender = "";
  String address = "";

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser!;
    email = _currentUser.email!;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      DataSnapshot snapshot = await _database.child('users/${_currentUser.uid}').get();
      if (snapshot.exists) {
        setState(() {
          username = snapshot.child('username').value as String;
          phone = snapshot.child('phone').value as String;
          gender = snapshot.child('gender').value as String;
          address = snapshot.child('address').value as String;

          _usernameController.text = username;
          _phoneController.text = phone;
          _genderController.text = gender;
          _addressController.text = address;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load user data: $e')),
      );
    }
  }

  Future<void> _updateUserData() async {
    try {
      await _database.child('users/${_currentUser.uid}').update({
        'username': _usernameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'gender': _genderController.text.trim(),
        'address': _addressController.text.trim(),
      });

      setState(() {
        username = _usernameController.text.trim();
        phone = _phoneController.text.trim();
        gender = _genderController.text.trim();
        address = _addressController.text.trim();
        _isEditing = false; // Exit edit mode after saving
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $e')),
      );
    }
  }

  void _logout() async {
    await _auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Username:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _usernameController,
              readOnly: !_isEditing,
              decoration: InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Email:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Phone:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _phoneController,
              readOnly: !_isEditing,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Gender:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _genderController,
              readOnly: !_isEditing,
              decoration: InputDecoration(
                hintText: 'Enter your gender',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _addressController,
              readOnly: !_isEditing,
              decoration: InputDecoration(
                hintText: 'Enter your address',
              ),
            ),
            const Spacer(), // Pushes the buttons to the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!_isEditing) ...[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = true; // Enter edit mode
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: _updateUserData,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.red, // Customize the button color
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
