import 'package:flutter/material.dart';
import 'ticket_list_card.dart'; // Pastikan sudah membuat dan mengimpor file ini dengan benar
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
      "image":
          "https://i.pinimg.com/originals/2f/88/4b/2f884b66c1a53b93a9e4826e5f4c459d.png",
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
      "image":
          "https://download.logo.wine/logo/Lion_Air/Lion_Air-Logo.wine.png",
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
      "image": "https://airhex.com/images/airline-logos/citilink.png",
      "available": "5 left"
    },
  ];

  final List<String> dates = [
    "Mon, 01 Apr",
    "Tue, 02 Apr",
    "Wed, 03 Apr",
    "Thu, 04 Apr",
    "Fri, 05 Apr",
    "Sat, 06 Apr",
    "Sun, 07 Apr",
  ];

  int selectedDateIndex = -1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dates.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Ticket List',
            style: GoogleFonts.inter(
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
                      color: const Color(0xFF141511),
                    ),
                  ),
                  const SizedBox(
                      width:
                          8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Color(0xFF141511),
                  ),
                  const SizedBox(
                      width:
                          8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                  Text(
                    'Himeji Castle',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color(0xFF141511),
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
                      color: const Color(0xFF8C8D89),
                    ),
                  ),
                  const SizedBox(
                      width:
                          8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                  Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF8C8D89),
                    ),
                  ),
                  const SizedBox(
                      width:
                          8), // Tambahkan jarak sesuai dengan desain yang diinginkan
                  Text(
                    'Economy',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF8C8D89),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: 50,
              child: TabBar(
                unselectedLabelColor: const Color(0xFF8C8D89),
                indicatorColor: const Color(0xFF3E84A8),
                labelColor: const Color(0xFF3E84A8),
                isScrollable: true,
                tabs: List.generate(
                    dates.length,
                    (index) => SizedBox(
                          width: 100,
                          child: Tab(
                            text: dates[index],
                          ),
                        )),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                  dates.length,
                  (index) => ListView.builder(
                    itemCount: tickets.length,
                    itemBuilder: (BuildContext context, int idx) {
                      return TicketListCard(data: tickets[idx]);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
