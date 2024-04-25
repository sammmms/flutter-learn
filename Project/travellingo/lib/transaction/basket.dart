import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './basket_card.dart'; // Make sure this is pointing to your BasketCard file

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  // Sample basket data
  final List<Map<String, dynamic>> baskets = [
    {
      "castleName": "Himeji Castle",
      "departure": "KOBE",
      "arrival": "HCL",
      "departureTime": "12:00",
      "arrivalTime": "01:15",
      "duration": "1h 15m",
      "price": 475.22,
      "ticketsLeft": "2",
      "passengerCount": 1,
      "transport": "Aircraft"
    },
    {
      "castleName": "Himeji Castle",
      "departure": "KOBE",
      "arrival": "HCL",
      "departureTime": "12:00",
      "arrivalTime": "01:15",
      "duration": "1h 15m",
      "price": 475.22,
      "ticketsLeft": "2",
      "passengerCount": 1,
      "transport": "Aircraft"
    },
    {
      "castleName": "Himeji Castle",
      "departure": "KOBE",
      "arrival": "HCL",
      "departureTime": "12:00",
      "arrivalTime": "01:15",
      "duration": "1h 15m",
      "price": 475.22,
      "ticketsLeft": "2",
      "passengerCount": 1,
      "transport": "Aircraft"
    },
    // Add more basket items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Basket',
          style: GoogleFonts.dmSans(
            textStyle: const TextStyle(
              color: Color(0xFF292F2E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            // Your scrollable content goes here
            child: ListView.builder(
              itemCount: baskets.length, // Just an example item count
              itemBuilder: (BuildContext context, int index) {
                return BasketCard(basketData: baskets[index]);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subtotal',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF6B7B78),
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '\$475.22',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF292F2E),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFF5D161)), // Button background color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFFFFFF)), // Text color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(171, 48)), // Set the button's size
                  ),
                  onPressed: () {
                    // Handle the button tap
                  },
                  child: Text(
                    'Proceed to Payment',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
