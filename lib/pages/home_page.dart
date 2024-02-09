import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/pizza_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            tabBorder: Border.all(color: Colors.black, width: 0.5),
            duration: Duration(milliseconds: 900),
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: "Cart",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('THE PIZZA HOUSE', style: GoogleFonts.dmSerifText(color: Colors.black)),
        backgroundColor: Color.fromRGBO(250, 141, 62, 1),
        elevation: 3,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(255, 187, 138, 0.8),
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50, // Image radius
                      backgroundImage: AssetImage('lib/images/chris.jpeg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "John Smith",
                      style: GoogleFonts.dmSerifText(fontSize: 20),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: GoogleFonts.dmSerifText(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text(
                  'Orders',
                  style: GoogleFonts.dmSerifText(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.inbox),
                title: Text(
                  'Inbox',
                  style: GoogleFonts.dmSerifText(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text(
                  'Favourites',
                  style: GoogleFonts.dmSerifText(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: GoogleFonts.dmSerifText(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text(
                  'Feedback',
                  style: GoogleFonts.dmSerifText(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              "Find Your Pizza",
              style: GoogleFonts.dmSerifText(fontSize: 30),
            ),
          ),
          _searchField(),

          const SizedBox(height: 30),

    
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: ScrollPhysics(),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return PizzaItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () => Provider.of<CartModel>(context, listen: false).addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: const Color(0xff1D1617).withOpacity(0.11), blurRadius: 40, spreadRadius: 0.0)]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search Pizza',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('lib/images/Search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('lib/images/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none)),
      ),
    );
  }
}
