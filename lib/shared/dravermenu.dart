import 'package:flutter/material.dart';
import 'package:gohealthination/pages/freequote/home.dart';
import 'package:gohealthination/pages/patients/patients.dart';
import 'package:gohealthination/shared/custom_text.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});



  @override
  Widget build(BuildContext context) {
    Color color1 = const Color(0xff3e2093);
    Color color2 = const Color(0xff37b2cb);
    Color color3 = const Color(0xffffffff);

    return Drawer(backgroundColor: color3,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/logo.png'))),
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading:  Icon(Icons.input, color: color2 ),
            title: const CustomText(text: 'Teklif Formları'),
            onTap: () => {Navigator.of(context).pop(),
            Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (BuildContext context) =>  const Home()))
              },

          ),
          ListTile(
            leading: Icon(Icons.verified_user, color: color2),
            title: const CustomText(text:'Hasta Süreçleri'),
            onTap: () => {
           //   Navigator.of(context).pop(),
            Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (BuildContext context) =>  const Patients()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: color2),
            title: CustomText(text:'Meeting'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color, color: color2),
            title: CustomText(text:'Tasks'),
            onTap: () => {Navigator.of(context).pop()},
          ),
      /*    ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),*/
        ],
      ),
    );
  }
}