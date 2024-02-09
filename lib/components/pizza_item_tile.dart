
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class PizzaItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  PizzaItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color[100],
                blurRadius: 5,
                spreadRadius: 0.0
              )
            ]
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // item image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                imagePath,
                height: 150,
              ),
            ),

            // item name
            Text(
              itemName,
              style: GoogleFonts.dmSerifText(
                fontSize: 20,
              ),
              ),
           

            MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                '\₹' + itemPrice,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
