import 'package:flutter/material.dart';
import 'package:flutter_app1/AuthenticationPage.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool geolocation = true;
  bool safeMode = false;
  bool hdImageQuality = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildSettingsItem(Icons.location_on, "My Addresses",
                    "Set shopping delivery address"),
                _buildSettingsItem(Icons.shopping_cart, "My Cart",
                    "Add, remove products and move to checkout"),
                _buildSettingsItem(Icons.list_alt, "My Orders",
                    "In-progress and Completed Orders"),
                _buildSettingsItem(Icons.account_balance, "Bank Account",
                    "Withdraw balance to registered bank account"),
                _buildSettingsItem(Icons.card_giftcard, "My Coupons",
                    "List of all the discounted coupons"),
                _buildSettingsItem(Icons.notifications, "Notifications",
                    "Set up any kind of notification message"),
                _buildSettingsItem(Icons.privacy_tip, "Account Privacy",
                    "Manage data usage and connected accounts"),
                const Divider(color: Colors.grey),
                _buildSectionTitle("App Settings"),
                _buildSettingsItem(Icons.cloud_upload, "Load Data",
                    "Upload Data to your Cloud Firebase"),
                _buildSwitchItem(
                    Icons.location_on,
                    "Geolocation",
                    "Set recommendation based on location",
                    geolocation, (value) {
                  setState(() {
                    geolocation = value;
                  });
                }),
                _buildSwitchItem(Icons.security, "Safe Mode",
                    "Search result is safe for all ages", safeMode, (value) {
                  setState(() {
                    safeMode = value;
                  });
                }),
                _buildSwitchItem(Icons.image, "HD Image Quality",
                    "Set image quality to be seen", hdImageQuality, (value) {
                  setState(() {
                    hdImageQuality = value;
                  });
                }),
                const SizedBox(height: 20),
                _buildLogoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("images/photo_2025-01-16_22-40-59.jpg"),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Yossif Ebrahim",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("yossifebrahim@gmail.com", style: TextStyle(fontSize: 14)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.edit, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.orangeAccent),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey)),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {},
    );
  }

  Widget _buildSwitchItem(IconData icon, String title, String subtitle,
      bool value, Function(bool) onChanged) {
    return SwitchListTile(
      activeColor: Colors.deepOrangeAccent,
      secondary: Icon(icon, color: Colors.orange),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey)),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AuthenticationPage()));
          },
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(color: Colors.deepOrangeAccent),
              backgroundColor: Colors.orange),
          child: const Text("Logout",
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
      ),
    );
  }
}
