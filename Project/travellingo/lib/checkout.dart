import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Checkout',
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
            children: [
              // ... Progress bar code from previous snippets
              SizedBox(height: 24), // Adds space below the progress bar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24)
                    .copyWith(bottom: 24), // Horizontal and bottom margin of 24
                padding: EdgeInsets.all(16), // Padding inside the container
                color: Color(
                    0xFFFDE6EB), // Change this to your desired danger color
                child: Row(
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
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 3),
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
                          decoration: BoxDecoration(
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
                            color: Color(0xFF3E84A8),
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
                            color: Color(0xFF8C8D89),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Himeji Castle',
                          style: GoogleFonts.inter(
                            color: Color(0xFF8C8D89),
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
                            color: Color(0xFF141511),
                            fontSize: 16,
                          ),
                        ),
                        Row(
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
                            color: Color(0xFF141511),
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
                            color: Color(0xFF8C8D89),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Duration 10m',
                          style: GoogleFonts.inter(
                            color: Color(0xFF8C8D89),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '01 April 2024',
                          style: GoogleFonts.inter(
                            color: Color(0xFF8C8D89),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Text(
                'Passanger List',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF141511), // Set text color
                ),
              ),
              Card(
                margin: EdgeInsets.all(24), // Set the card margin
                child: Padding(
                  padding:
                      EdgeInsets.all(12), // Set the padding inside the card
                  child: Container(
                    height: 78,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Left container
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Luaman Guaamin',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(
                                      0xFF141511), // Set text color for name
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Economy',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(
                                          0xFF8C8D89), // Set text color for 'Economy'
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          4), // Spacing between text and icon
                                  Icon(
                                    Icons.lens,
                                    size: 5,
                                    color: Color(0xFF8C8D89),
                                  ),
                                  SizedBox(
                                      width:
                                          4), // Spacing between icon and text
                                  Text(
                                    '8D',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(
                                          0xFF8C8D89), // Set text color for '8D'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Right container
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Change Seat',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(
                                  0xFF3E84A8), // Set text color for 'Change Seat'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        24), // horizontal padding to match the card's margin
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Protect Your Trip',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF141511), // Set text color
                      ),
                    ),
                    Text(
                      '\$5 per passenger',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF3E84A8), // Set text color
                      ),
                    ),
                  ],
                ),
              ),

              // Spacing between the text row and the card
              SizedBox(height: 16),

              // Card for 'Extra Protection'
              Card(
                margin: EdgeInsets.all(24),
                child: Container(
                  height: 145, // Fixed height for the card
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Aligns children at the start of the row's cross axis
                      children: <Widget>[
                        Icon(
                          Icons
                              .shield, // Replace with your actual protection icon
                          color: Color(0xFFFF7A1A),
                          size: 24,
                        ),
                        SizedBox(width: 12), // Spacing between icon and title
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
                                  color: Color(
                                      0xFF141511), // Set text color for title
                                ),
                              ),
                              Text(
                                'Protect your trip to get insurance in the event of an accident. Accident compensation up to \$800.',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(
                                      0xFF141511), // Set text color for description
                                ),
                              ), // Spacing between the description and 'More info'
                              Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle 'More info' tap
                                  },
                                  child: Text(
                                    'More info',
                                    style: GoogleFonts.inter(
                                      color: Color(
                                          0xFF3E84A8), // Set text color for 'More info'
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subtotal',
                          style: GoogleFonts.dmSans(
                            color: Color(0xFF6B7B78),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '\$475.22',
                          style: GoogleFonts.inter(
                            color: Color(0xFF292F2E),
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
                            Color(0xFFF5D161)), // Button background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFFFFFFF)), // Text color
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(95, 48)), // Set the button's size
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentPage(), // Asumsi ada constructor yang menerima data
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
