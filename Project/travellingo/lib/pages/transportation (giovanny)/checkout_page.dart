import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/component/airplane_animation_component.dart';
import 'package:travellingo/component/dotted_divider_component.dart';
import 'package:travellingo/component/route_animator_component.dart';
import 'payment_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isChecked = false;

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
          'Checkout',
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
        children: [
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ... Progress bar code from previous snippets
              const SizedBox(height: 12), // Adds space below the progress bar
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

              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  'Your Trip',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                height: 194, // Set the card height
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(16),
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
                                  'https://i.pinimg.com/originals/2f/88/4b/2f884b66c1a53b93a9e4826e5f4c459d.png'),
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
                    const DottedDivider(),
                    const SizedBox(height: 8), // Add space between elements
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
                            AirplaneAnimation(),
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

              Container(
                margin: const EdgeInsets.only(
                    left: 24, right: 24, top: 24, bottom: 16),
                child: Text(
                  'Passenger List',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.0), // Garis outline
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Luaman Guaamin',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500, // Medium weight
                                fontFamily:
                                    'Inter', // Pastikan font Inter tersedia
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Text(
                                  "Economy",
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF8C8D89),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(Icons.circle,
                                    color: Color(0xFF8C8D89), size: 8),
                                const SizedBox(width: 16),
                                Text(
                                  "8D",
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF8C8D89),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text("Change Seat",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF3E84A8),
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        24), // horizontal padding to match the card's margin
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                                width: 1.0,
                                color: Colors.grey.withOpacity(0.7)),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                          activeColor: Colors.orange,
                        ),
                        const SizedBox(
                            width: 8), // Spacing between the checkbox and text
                        Text(
                          'Protect Your Trip',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$5 per passenger',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF3E84A8), // Set text color
                      ),
                    ),
                  ],
                ),
              ),

              // Spacing between the text row and the card
              const SizedBox(height: 8),

              // Card for 'Extra Protection'
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.0), // Garis outline
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  height: 145, // Fixed height for the card
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Aligns children at the start of the row's cross axis
                      children: <Widget>[
                        const Icon(
                          Icons
                              .verified_user, // Replace with your actual protection icon
                          color: Color(0xFFFF7A1A),
                          size: 24,
                        ),
                        const SizedBox(
                            width: 12), // Spacing between icon and title
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Align the column content to the top
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Extra Protection',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(
                                      0xFF141511), // Set text color for title
                                ),
                              ),
                              Text(
                                'Protect your trip to get insurance in the event of an accident. Accident compensation up to \$800.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.withOpacity(
                                      0.85), // Set text color for description
                                ),
                              ), // Spacing between the description and
                              const SizedBox(height: 8), // the 'More Info' text
                              RichText(
                                text: TextSpan(
                                  text: 'More Info',
                                  style: const TextStyle(
                                    color: Color(0xFF3E84A8),
                                    decoration: TextDecoration.none,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
          Container(
            margin: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Subtotal',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF6B7B78),
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 8), // Spacing between text
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                        ), // Info icon
                      ],
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(95, 48)), // Set the button's size
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, createRouteFromRight(const PaymentPage()));
                  },
                  child: Text(
                    'Proceed to Payment',
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
