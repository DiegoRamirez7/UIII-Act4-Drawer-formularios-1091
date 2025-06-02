import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text("Formularios Tablas"),
        backgroundColor: const Color.fromARGB(255, 54, 244, 70),
        actions: <Widget>[
          InkWell(
            onTap: null,
            child: new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ), onPressed: () {  },
            ),
          ),
          InkWell(
            onTap: null,
            child: new IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ), onPressed: () {  },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 43, 175, 54)),
              accountName: Text("Diego Ramirez"),
              accountEmail: Text("Diego@gmail.com"),
              currentAccountPicture: GestureDetector(
              child: CircleAvatar(
            radius: 120,
            child: ClipOval(
              child: Image.network(
                'https://raw.githubusercontent.com/DiegoRamirez7/p8MisImagenes6I/refs/heads/main/user%20icon.jpg',
              ),
            ),
          )
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                onTap: (){Navigator.popAndPushNamed(context, "/home");},
                leading: Icon(Icons.home, color: Colors.pink),
                title: Text("Inicio"),
              ),
            ),
            InkWell(
              onTap: null,
              child: ListTile(
                onTap: (){Navigator.popAndPushNamed(context, "/clientes");},
                leading: Icon(Icons.person, color: Colors.black),
                title: Text("clientes"),
              ),
            ),
            InkWell(
              onTap: null,
              child: ListTile(
                onTap: (){Navigator.pushNamed(context, "/empleados");},
                leading: Icon(Icons.shopping_basket, color: Colors.red),
                title: Text("Empleados"),
              ),
            ),
            Divider(),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.help, color: Colors.green),
                title: Text("About"),
              ),
            ),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(
                  Icons.power_settings_new,
                  color: Colors.black,
                ),
                title: Text("Log out"),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}