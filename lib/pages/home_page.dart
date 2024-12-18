import 'package:ecommerce_ui/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // keep track of the selected index
  int _selectedIndex = 0;

  // method to update our selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ));
          })),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Column(children: [
                          //logo
            DrawerHeader(
                child: Image.asset(
              'lib/images/fatjordan.png',
              color: Colors.white,
            )),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: Colors.grey[800],
              ),
            ),

            // other pages
            const Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text('Home', style: TextStyle(color: Colors.white))),
            ),

            const Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: Text('About', style: TextStyle(color: Colors.white))),
            ),
            ],),


          //position - at the end 
            const Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text('Logout', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
