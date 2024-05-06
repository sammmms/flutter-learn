import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/component/route_animator_component.dart';
import 'package:travellingo/pages/transaction/basket/widget/basket_card.dart';
import '../checkout_page.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  double total = 0;

  // Sample basket data
  List<Map<String, dynamic>> baskets = [
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

  List<bool> isChecked = List<bool>.filled(3, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: baskets.length, // Just an example item count
                itemBuilder: (BuildContext context, int index) {
                  // return BasketCard(basketData: baskets[index]);
                  return Row(
                    children: [
                      // Checkbox on the left side
                      Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: isChecked[index],
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked[index] = value!;

                                // Calculate total
                                total = 0;
                                for (int i = 0; i < isChecked.length; i++) {
                                  if (isChecked[i]) {
                                    total += baskets[i]['price'];
                                  }
                                }
                              });
                            },
                            activeColor: Colors.orange,
                          )),
                      Expanded(
                        flex: 15,
                        child: BasketCard(basketData: baskets[index]),
                      )
                    ],
                  );
                },
              ),
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
                      '\$${total.toStringAsFixed(2)}',
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
                  onPressed: total == 0
                      ? null
                      : () {
                          Navigator.push(context,
                              createRouteFromBottom(const CheckoutPage()));
                        },
                  child: Text(
                    'Checkout',
                    style: GoogleFonts.inter(
                      fontSize: 16,
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
