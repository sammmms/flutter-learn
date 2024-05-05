import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/pages/transaction/components/airplance_animation.dart';
import 'select_seat.dart';

class TicketDetailPage extends StatefulWidget {
  final Map<String, dynamic>? data; // Data can be null

  const TicketDetailPage(
      {super.key, this.data}); // Constructor can receive null data

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  late Map<String, dynamic> ticketData; // Variable to store ticket data
  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = [true];
    // If data is null or not complete, use default data
    ticketData = widget.data ??
        {
          "castleName": "Himeji Castle",
          "departure": "KOBE",
          "arrival": "HCL",
          "departureTime": "12:00 PM",
          "arrivalTime": "01:15 PM",
          "duration": "1h 15m",
          "price": 475.22,
          "ticketsLeft": "2",
          "passengerCount": 1,
          "transport": "Aircraft"
        };
  }

  void _addNewPassengerPanel() {
    setState(() {
      _isExpanded.add(false); // Add new passenger in collapsed state
    });
  }

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
          'Tiket Details',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Color(0xFF292F2E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
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
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticketData['castleName'] ?? 'Unknown Castle',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$${(ticketData['price'] ?? 0).toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${ticketData['ticketsLeft'] ?? '0'} tickets remaining",
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ticketData['departure'] ?? 'Unknown',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${ticketData['departureTime'] ?? 'Unknown'}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.circle,
                              color: Color(0xFF3E84A8), size: 8),
                          const SizedBox(width: 8),
                          const AirplaneAnimation(),
                          const SizedBox(width: 8),
                          const Icon(Icons.circle,
                              color: Color(0xFF3E84A8), size: 8),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ticketData['arrival'] ?? 'Unknown',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${ticketData['arrivalTime'] ?? 'Unknown'}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF28527A),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.airplanemode_active,
                                    color: Colors.white, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "${ticketData['transport'] ?? 'Unknown'}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Duration ${ticketData['duration'] ?? 'Unknown'}",
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xFF88879C)),
                          ),
                          const Spacer(),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5D161),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward,
                                  size: 16, color: Colors.white),
                              onPressed: () {
                                // Handle tap here
                              },
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.favorite, color: Color(0xFF3E84A8)),
                          const SizedBox(width: 8),
                          Text(
                            "Passengers",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color(0xFF3E84A8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Add space between the containers
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[
                            50], // Adjust the color to match your design
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Luaman Guaamin",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: const Color(0xFF59597C),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "wayneenterprise@mail.com",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Handle your onPressed event here
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFF5D161)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(150, 26)),
                              textStyle: MaterialStateProperty.all(
                                GoogleFonts.inter(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Add Passengers",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.people,
                                  color: Color(0xFF3E84A8)),
                              const SizedBox(width: 8),
                              Text(
                                "Passengers details",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: const Color(0xFF3E84A8),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: _addNewPassengerPanel,
                            child: Text(
                              "+ Add passengers",
                              style: GoogleFonts.inter(
                                color: const Color(0xFFF5D161),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 28), // Add space between the containers
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _isExpanded.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildPassengerPanel(index);
                      },
                    ),
                  ],
                ),
              ),
            ]),
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
                    '/PERSON',
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          SelectSeatPage(), // Asumsi ada constructor yang menerima data
                    ),
                  );
                },
                child: Text(
                  'Select Seat',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildPassengerPanel(int index) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          shape: const Border(),
          key: ValueKey("passenger_$index"),
          initiallyExpanded: _isExpanded[index],
          title: Row(
            children: [
              const Icon(
                Icons.emoji_emotions_outlined,
                color: Color(0xFF3E84A8),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                "Passenger ${index + 1}",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFF3E84A8),
                ),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Identity Type',
                            hintText: '',
                            hintStyle: TextStyle(height: 2.2),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(),
                          ),
                          value: 'Passport',
                          items: ['Passport', 'ID Card', 'Driver License']
                              .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: SizedBox(
                                      width: 80,
                                      child: Text(value),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (newValue) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Identity number',
                            hintText: '',
                            hintStyle: TextStyle(height: 2.2),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Full name',
                      hintText: '',
                      hintStyle: TextStyle(height: 2.2),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Infant passengers do not get their own seat. Passengers under 18 years old can fill in another identification number or date of birth.",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded[index] = expanded;
            });
          },
        ),
      ),
    );
  }
}
