import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/dog_pic1.png'),
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,
            color: Colors.white,),
            title: const Text(
              'Inicio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Quicksand',
              ),
            ),
            onTap: () => {
              Navigator.pushNamed(context, '/home'),
            },
          ),
          // about us
          ListTile(
            leading: const Icon(Icons.info,
            color: Colors.white,),
            title: const Text(
              'Nosotros',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Quicksand',
              ),
            ),
            onTap: () => {
              Navigator.pushNamed(context, '/about_us'),
            },
          ),
          // contact us
          ListTile(
            leading: const Icon(Icons.contact_mail,
            color: Colors.white,),
            title: const Text(
              'Contacto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Quicksand',
              ),
            ),
            onTap: () => {
              Navigator.pushNamed(context, '/contact'),
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.verified_user),
          //   title: Text('Profile'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.border_color),
          //   title: Text('Feedback'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}
