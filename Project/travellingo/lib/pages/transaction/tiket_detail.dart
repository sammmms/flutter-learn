import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_seat.dart';

class TiketDetailPage extends StatefulWidget {
  final Map<String, dynamic>? data; // Data can be null

  const TiketDetailPage(
      {super.key, this.data}); // Constructor can receive null data

  @override
  State<TiketDetailPage> createState() => _TiketDetailPageState();
}

class _TiketDetailPageState extends State<TiketDetailPage> {
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
          icon: Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Tiket Detail',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(16),
                elevation: 4,
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
                            style: TextStyle(
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
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${ticketData['ticketsLeft'] ?? '0'} tickets remaining",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            ticketData['departure'] ?? 'Unknown',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 10)
                                          .floor(),
                                      (index) => SizedBox(
                                        width: 5,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Text(
                            ticketData['arrival'] ?? 'Unknown',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${ticketData['departureTime'] ?? 'Unknown'} - ${ticketData['arrivalTime'] ?? 'Unknown'}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFF28527A),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "${ticketData['transport'] ?? 'Unknown'}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Duration ${ticketData['duration'] ?? 'Unknown'}",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xFF88879C)),
                          ),
                          Spacer(),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5D161),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward,
                                  size: 16, color: Colors.white),
                              onPressed: () {
                                // Handle tap here
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                          Icon(Icons.favorite, color: Color(0xFF333E63)),
                          SizedBox(width: 8),
                          Text(
                            "Passengers",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8), // Add space between the containers
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Adjust the color to match your design
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Luaman Guaamin",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF59597C),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "wayneenterprise@mail.com",
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle your onPressed event here
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFF5D161)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(150, 26)),
                              textStyle: MaterialStateProperty.all(
                                GoogleFonts.inter(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            child: Text("Add Passengers"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Passenger details",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: _addNewPassengerPanel,
                          child: Text(
                            "+ Add passengers",
                            style: GoogleFonts.inter(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _isExpanded.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildPassengerPanel(index);
                    },
                  ),
                ],
              ),
            ]),
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
                      fontWeight: FontWeight.w600,
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
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(171, 48)), // Set the button's size
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
                  'Sellect Seat',
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
    return ExpansionTile(
      key: ValueKey("passenger_$index"),
      initiallyExpanded: _isExpanded[index],
      title: Text(
        "Passenger ${index + 1}",
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Identity Type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      value: 'Passport',
                      items: ['Passport', 'ID Card', 'Driver License']
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (newValue) {},
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Identity number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 24),
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
    );
  }
}
