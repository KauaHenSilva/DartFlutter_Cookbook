import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);


  Widget _creatItem(IconData icon, String label, void Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }

  Future<void> _launchUrl() async {
  if (!await launchUrl(Uri.parse('https://github.com/KauaHenSilva'))) {
    throw Exception('Could not launch');
  }
}

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double paddingTop = mediaQuery.padding.top;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: paddingTop),
        children: [
          ListTile(
            title: const Flexible(
              child: Text(
                'Kaua Henrique Da Silva',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: const Text('KauaHenSilva'),
            leading: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://avatars.githubusercontent.com/KauaHenSilva',
                ),
              ),
            ),
          ),
          const Divider(),
          _creatItem(Icons.restaurant, 'Restaurants', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          _creatItem(Icons.settings, 'Settings', () {
            Navigator.of(context).pushReplacementNamed('/settings');
          }),
          _creatItem(Icons.favorite, 'GitHub', () {
            _launchUrl();
          }),
        ],
      ),
    );
  }
}
