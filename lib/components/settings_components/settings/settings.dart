

import 'package:certracker/components/settings_components/about/about_page.dart';
import 'package:certracker/components/settings_components/change_password/change_password_page.dart';
import 'package:certracker/components/settings_components/edit_profile/edit_profile.dart';
import 'package:certracker/components/settings_components/help/help_page.dart';
import 'package:certracker/components/settings_components/log_out/log_out_page.dart';
import 'package:certracker/components/settings_components/notification/Notification_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: _buildSettingsCard(context),
      ),
    );
  }

  Widget _buildSettingsCard(BuildContext context) {
    final List<String> settings = [
      'Profile',
      'Notification',
      'Change Password',
      'Help',
      'About',
      'Log Out',
    ];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: settings.length,
          itemBuilder: (context, index) {
            final String text = settings[index];
            return _buildSettingsItem(context, text);
          },
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, String text) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            _navigateToSettingsPage(context, text); // Navigate to the respective page
          },
          child: Container(
            height: 70,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(_getIconForSetting(text)), // Get respective icon for each setting
                    const SizedBox(width: 10),
                    Text(
                      text,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        if (text != 'Log Out') const Divider(height: 0), // Add divider for each item except the last one
      ],
    );
  }

  IconData _getIconForSetting(String text) {
    switch (text) {
      case 'Profile':
        return Icons.person;
      case 'Notification':
        return Icons.notifications;
      case 'Change Password':
        return Icons.lock;
      case 'Help':
        return Icons.help;
      case 'About':
        return Icons.info;
      default:
        return Icons.logout;
    }
  }

  void _navigateToSettingsPage(BuildContext context, String text) {
    switch (text) {
      case 'Profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfilePage()),
        );
        break;
      case 'Notification':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationPage()),
        );
        break;
      case 'Change Password':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
        );
        break;
      case 'Help':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelpPage()),
        );
        break;
      case 'About':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutPage()),
        );
        break;
      case 'Log Out':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LogOutPage()),
        );
        break;
      default:
        // Handle other settings
        break;
    }
  }
}
