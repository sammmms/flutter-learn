import 'package:flutter/material.dart';
import 'tiketlist_card.dart'; // Pastikan sudah membuat dan mengimpor file ini dengan benar
import 'package:google_fonts/google_fonts.dart';

class TicketListPage extends StatefulWidget {
  const TicketListPage({super.key});

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState extends State<TicketListPage> {
  final List<Map<String, dynamic>> tickets = [
    {
      "origin": "Kobe",
      "destination": "Himeji Castle",
      "departureTime": "19:00 PM",
      "arrivalTime": "19:10 PM",
      "date": "01 April 2024",
      "duration": "10m",
      "price": 25.00,
      "status": false,
      "image": "https://placehold.jp/150x150.png",
      "available": "5 left"
    },
    {
      "origin": "Osaka",
      "destination": "Cherry Blossom Park",
      "departureTime": "10:00 AM",
      "arrivalTime": "10:30 AM",
      "date": "01 April 2024",
      "duration": "30m",
      "price": 15.00,
      "status": true,
      "image": "https://placehold.jp/150x150.png",
      "available": "Available"
    },
    {
      "origin": "Tokyo",
      "destination": "Earthquake Museum",
      "departureTime": "14:00 PM",
      "arrivalTime": "14:45 PM",
      "date": "01 April 2024",
      "duration": "45m",
      "price": 30.00,
      "status": false,
      "image": "https://placehold.jp/150x150.png",
      "available": "5 left"
    },
  ];

  final List<String> dates = [
    "Mon, 01 Apr",
    "Tue, 02 Apr",
    "Wed, 03 Apr",
    "Thu, 04 Apr",
    "Thu, 04 Apr",
    "Thu, 04 Apr",
    "Thu, 04 Apr",
  ];

  int selectedDateIndex = -1;

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
          'Ticket List',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              color: Color(0xFF292F2E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Kobe',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF141511),
                  ),
                ),
                SizedBox(
                    width:
                        8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF141511),
                ),
                SizedBox(
                    width:
                        8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                Text(
                  'Himeji Castle',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF141511),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '1 Passenger',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF8C8D89),
                  ),
                ),
                SizedBox(
                    width:
                        8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF8C8D89),
                  ),
                ),
                SizedBox(
                    width:
                        8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                Text(
                  'Economy',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF8C8D89),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                bool isSelected = index ==
                    selectedDateIndex; // Apakah tanggal ini yang dipilih?
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedDateIndex =
                          index; // Menandai tanggal sebagai dipilih
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    child: Text(
                      dates[index],
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color:
                            isSelected ? Color(0xFF3E84A8) : Color(0xFF8C8D89),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (BuildContext context, int index) {
                return TicketListCard(data: tickets[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
