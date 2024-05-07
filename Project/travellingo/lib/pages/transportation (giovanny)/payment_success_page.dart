import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/component/dotted_divider_component.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Transaction Details',
          style: GoogleFonts.dmSans(
            textStyle: const TextStyle(
              color: Color(0xFF292F2E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.0), // Garis outline
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Lottie.asset(
                        "assets/lottie/success.json", // Use a static image instead of Lottie animation
                        fit: BoxFit.contain,
                      ),
                    ), // Size adjusted for visibility
                    const SizedBox(height: 16),
                    Text(
                      "Your payment was successful!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF292F2E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const DottedDivider(),
                    const SizedBox(height: 48),
                    SizedBox(
                      height: 184,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                detailText('Invoice Number', '8C8D89', 14),
                                detailText('INV567489240UI', '141511', 16),
                                detailText('Date', '8C8D89', 14),
                                detailText('01 April 2024', '141511', 16),
                                detailText('Amount Paid', '8C8D89', 14),
                                detailText('\$475.22', '141511', 16),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                detailText('Payment Method', '8C8D89', 14),
                                detailText('e-Money', '141511', 16),
                                detailText('Time', '8C8D89', 14),
                                detailText('09:41 AM', '141511', 16),
                                detailText('Status', '8C8D89', 14),
                                detailText('Successful', '141511', 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const DottedDivider(),
                    const SizedBox(height: 24),
                    TextButton.icon(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey.withOpacity(0.1))),
                      onPressed: () {},
                      icon: const Icon(Icons.file_download_outlined,
                          color: Color(0xFF1C6AE4)),
                      label: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Download Invoice',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              color: Color(0xFF1C6AE4),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                            24), // Spacing before the 'Return to Homepage' button
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFF5D161)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();    
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    'Return to Homepage',
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        color:
                            Colors.white, // Choose appropriate color for text
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailText(String text, String color, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: GoogleFonts.dmSans(
          textStyle: TextStyle(
            color: Color(int.parse('0xFF$color')),
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
