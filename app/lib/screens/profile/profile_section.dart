import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final String name;
  final String email;
  final String avatarUrl;

  ProfileSection({required this.name, required this.email, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatarUrl),
              ),
            ]),
            SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
            SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ]),
            buildProfileCard(
              icon: Icons.person,
              label: 'Profile',
              onPressed: () {
                // Handle profile button tap
              },
            ),
            buildProfileCard(
              icon: Icons.settings,
              label: 'Settings',
              onPressed: () {
                // Handle settings button tap
              },
            ),
            buildProfileCard(
              icon: Icons.mail,
              label: 'Contact',
              onPressed: () {
                // Handle contact button tap
              },
            ),
            buildProfileCard(
              icon: Icons.share,
              label: 'Share App',
              onPressed: () {
                // Handle share app button tap
              },
            ),
            buildProfileCard(
              icon: Icons.person,
              label: 'Share App', // It seems like there's a typo here, should it be 'Help'?
              onPressed: () {
                // Handle share app button tap
              },
            ),
            buildProfileCard(
              icon: Icons.help,
              label: 'Help',
              onPressed: () {
                // Handle help button tap
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildProfileCard({required IconData icon, required String label, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          width: 350,
          height: 40,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 7),
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
