import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        elevation: 0.2,
        title: Text("Formularios Tablas "),
        backgroundColor: const Color.fromARGB(255, 28, 114, 49),
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
        children: [
           UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              accountName: Text("Diego Ramirez 1091"),           
              accountEmail: Text("a.22308051281091@cbtis128.edu.mx"),
              currentAccountPicture: GestureDetector(
            child: CircleAvatar(
                  child: Text(
                    "DR",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.white,
                ),
                
              ) ,
           ),
        ],
      ),
      ),
    );
  }
}
