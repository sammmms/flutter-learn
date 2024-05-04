import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'purchase_card.dart'; // Make sure this import points to where your PurchaseCard class is defined.

class PurchasePage extends StatelessWidget {
  final List<Map<String, dynamic>> purchases = [
    {
      "status": "Payment Success",
      "type": "Flight",
      "date": "01 April 2024",
      "price": 475.22,
      "invoice": "Invoice Number INV567489240UI",
      "image":
          "https://placehold.jp/150x150.png", // Replace with your actual image URL
    },
    {
      "status": "Payment Success",
      "type": "Flight",
      "date": "01 April 2024",
      "price": 475.22,
      "invoice": "Invoice Number INV567489240UI",
      "image":
          "https://placehold.jp/150x150.png", // Replace with your actual image URL
    },
    {
      "status": "Payment Success",
      "type": "Flight",
      "date": "01 April 2024",
      "price": 475.22,
      "invoice": "Invoice Number INV567489240UI",
      "image":
          "https://placehold.jp/150x150.png", // Replace with your actual image URL
    },
    // Add more purchase maps if necessary
  ];

  @override
  Widget build(BuildContext context) {
    // Convert the list of purchases to a list of PurchaseCard widgets
    List<Widget> purchaseCards = purchases.map((purchase) {
      return PurchaseCard(
        status: purchase['status'] as String,
        type: purchase['type'] as String,
        date: purchase['date'] as String,
        price: purchase['price'] as double,
        invoice: purchase['invoice'] as String,
        imageUrl: purchase['image'] as String,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Purchase History',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              color: Color(0xFF292F2E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: purchaseCards,
        ),
      ),
    );
  }
}
