import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/pages/transaction/ticket_detail.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

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
          'Transaction Detail',
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: 542,
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                const Icon(Icons.check_circle_outline,
                    size: 100,
                    color: Color(0xFF28527A)), // Size adjusted for visibility
                const SizedBox(height: 16),
                Text(
                  "Your payment was successful!",
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF292F2E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download, color: Color(0xFF1C6AE4)),
                  label: Text(
                    'Download Invoice',
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        color: Color(0xFF1C6AE4),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        24), // Spacing before the 'Return to Homepage' button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFF5D161)),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const TicketDetailPage(), // Asumsi ada constructor yang menerima data
                      ),
                    );
                  },
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
              ],
            ),
          ),
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
