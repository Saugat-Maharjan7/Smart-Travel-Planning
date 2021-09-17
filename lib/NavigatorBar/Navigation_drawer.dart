import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_travel_planning_appli/Login/login_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = 'name';
    final email = 'name@email.com';
    final urlImage =
        'https://scontent.fbwa1-1.fna.fbcdn.net/v/t1.6435-9/126142314_3117845208320675_8204778654295153619_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=alcFjFwibRUAX84o7qJ&_nc_ht=scontent.fbwa1-1.fna&oh=b812110a6550cdbc5652fae7d9d4f242&oe=61687853';
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/cctravel.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              padding: EdgeInsets.zero,
              child: Container(
                child: Column(
                  children: [
                    buildHeader(
                      urlImage: urlImage,
                      name: name,
                      email: email,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            buildMenuItem(
              text: 'Packages',
              icon: Icons.apps,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Destinations',
              icon: Icons.location_pin,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications_active,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 24,
            ),
            Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Sign-out',
              icon: Icons.logout,
              onClicked: () {
                selectedItem(context, 5);
                // return alert(
                //   context,
                //   title: Text('Are you sure?'),
                //   textOK: Text('Yes',),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    @required String urlImage,
    @required String name,
    @required String email,
  }) =>
      InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(urlImage),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    @required String text,
    @required IconData icon,
    @required VoidCallback onClicked,
  }) {
    final color = Colors.white;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 40),
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => null,
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => null,
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
    }
  }
}
