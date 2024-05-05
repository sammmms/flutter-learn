import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment_success.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

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
            'Payment',
            style: GoogleFonts.dmSans(
              textStyle: const TextStyle(
                color: Color(0xFF292F2E),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ... Progress bar code from previous snippets
              const SizedBox(height: 24), // Adds space below the progress bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24)
                    .copyWith(bottom: 24), // Horizontal and bottom margin of 24
                padding:
                    const EdgeInsets.all(16), // Padding inside the container
                color: const Color(
                    0xFFFDE6EB), // Change this to your desired danger color
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.access_time,
                        color: Color(0xFFEE3D60)), // Icon with danger color
                    SizedBox(width: 8), // Spacing between icon and text
                    Text(
                      "The remaining time of order 00:05:49", // Your alert message
                      style: TextStyle(
                        color: Color(0xFFEE3D60), // Text color for danger
                        fontSize: 14, // Adjust the font size as needed
                        fontWeight: FontWeight
                            .bold, // Bold font weight for alert message
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Your Trip',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Container(
                height: 194, // Set the card height
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Distribute the children evenly
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 32,
                          width: 52,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://placehold.jp/150x150.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          'View Details',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF3E84A8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kobe',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF8C8D89),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Himeji Castle',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF8C8D89),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '19.00 PM',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF141511),
                            fontSize: 16,
                          ),
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize
                              .min, // Use the minimum amount of space
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xFF3E84A8),
                              size: 8,
                            ),
                            SizedBox(width: 8), // Add space between icons
                            Icon(
                              Icons.airplanemode_active,
                              color: Color(0xFF3E84A8),
                              size: 16,
                            ),
                            SizedBox(width: 8), // Add space between icons
                            Icon(
                              Icons.lens,
                              color: Color(0xFF3E84A8),
                              size: 8,
                            ),
                          ],
                        ),
                        Text(
                          '19.10 PM',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF141511),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '01 April 2024',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF8C8D89),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Duration 10m',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF8C8D89),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '01 April 2024',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF8C8D89),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Payment Method',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF141511), // Set text color
                ),
              ),
              Card(
                margin: const EdgeInsets.all(24), // Set the card margin
                child: Padding(
                  padding: const EdgeInsets.all(
                      12), // Set the padding inside the card
                  child: ListView(
                    shrinkWrap:
                        true, // Use only as much space as needed for the children
                    physics:
                        const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
                    children: [
                      ListTile(
                        leading: const Icon(Icons.account_balance_wallet,
                            color: Color(0xFF3E84A8)),
                        title: Text('Paylater',
                            style: GoogleFonts.inter(
                                color: const Color(0xFF141511))),
                        trailing: Text('Activate Now',
                            style: GoogleFonts.inter(
                                color: const Color(0xFF3E84A8))),
                      ),
                      ExpansionTile(
                        leading:
                            const Icon(Icons.money, color: Color(0xFF3E84A8)),
                        title: Text('e-Money',
                            style: GoogleFonts.inter(
                                color: const Color(0xFF141511))),
                        children: ['Paypal', 'Gopay', 'Apple Pay', 'Amazon Pay']
                            .map((paymentMethod) {
                          return ListTile(
                            contentPadding: const EdgeInsets.only(
                                left: 36), // Indent the submenu items
                            leading: const Icon(Icons.circle,
                                color: Color(0xFF3E84A8),
                                size: 20), // Submenu icon
                            title: Text(paymentMethod,
                                style: GoogleFonts.inter(
                                    color: const Color(0xFF141511))),
                            trailing: paymentMethod == 'Paypal'
                                ? const Icon(Icons.check_box,
                                    color: Color(
                                        0xFFFF7A1A)) // Orange checkbox for Paypal
                                : null,
                          );
                        }).toList(),
                      ),
                      ExpansionTile(
                        leading: const Icon(Icons.phone_android,
                            color: Color(0xFF3E84A8)),
                        title: Text('Virtual Account',
                            style: GoogleFonts.inter(
                                color: const Color(0xFF141511))),
                        // Add children for the dropdown content
                      ),
                      ExpansionTile(
                        leading: const Icon(Icons.account_balance,
                            color: Color(0xFF3E84A8)),
                        title: Text('Bank Transfer',
                            style: GoogleFonts.inter(
                                color: const Color(0xFF141511))),
                        // Add children for the dropdown content
                      ),
                      ExpansionTile(
                        leading: const Icon(Icons.credit_card,
                            color: Color(0xFF3E84A8)),
                        title: Text('Credit Card',
                            style: GoogleFonts.inter(
                                color: const Color(0xFF141511))),
                        // Add children for the dropdown content
                      ),
                    ],
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
                          '\$475.22',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF292F2E),
                            fontSize: 20,
                            fontWeight: FontWeight
                                .w600, // Inter doesn't have a 'semi-bold', w600 is 'semi-bold' equivalent
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(95, 48)), // Set the button's size
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const PaymentDetailPage(), // Asumsi ada constructor yang menerima data
                          ),
                        );
                      },
                      child: Text(
                        'Pay Now',
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
        ));
  }
}
