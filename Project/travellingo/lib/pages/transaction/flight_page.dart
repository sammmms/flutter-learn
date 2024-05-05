import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/pages/transaction/tiket_list/ticket_list.dart';

class FlightPage extends StatelessWidget {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 180, // Tinggi simulasi AppBar
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            image: DecorationImage(
              image: NetworkImage("https://placehold.jp/300x180.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  const Text('Flight',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        // Konten yang menindih bagian dari simulasi AppBar
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Card(
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.airplane_ticket,
                                        color: Color(0xFF3E84A8)),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: 'Kobe',
                                        onChanged: (String? newValue) {},
                                        items: const [
                                          DropdownMenuItem(
                                              value: 'Kobe', child: Text('Kobe')),
                                          DropdownMenuItem(
                                              value: 'Osaka',
                                              child: Text('Osaka'))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        color: Color(0xFF3E84A8)),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: 'Himeji Castle',
                                        onChanged: (String? newValue) {},
                                        items: const [
                                          DropdownMenuItem(
                                              value: 'Himeji Castle',
                                              child: Text('Himeji Castle')),
                                          DropdownMenuItem(
                                              value: 'Kyoto',
                                              child: Text('Kyoto'))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(const Color(0xFF28527A)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(360),
                                ))),
                            icon: const Icon(Icons.swap_vert,
                                color: Colors.white),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            surfaceTintColor:
                                MaterialStateProperty.all(Colors.white),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ))),
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_today,
                            color: Color(0xFF28527A)),
                        label: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Mon, 01 April",
                                  style: GoogleFonts.inter(
                                      color: const Color(0xFF141511),
                                      fontSize: 14)),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text("Round-trip?",
                                        style: GoogleFonts.inter(
                                            color: const Color(0xFF8C8D89),
                                            fontSize: 12)),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF3E84A8),
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            style: ButtonStyle(
                                surfaceTintColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ))),
                            onPressed: () {},
                            icon: const Icon(Icons.people,
                                color: Color(0xFF28527A)),
                            label: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text("1 Passenger",
                                  style: GoogleFonts.inter(
                                      color: const Color(0xFF141511),
                                      fontSize: 14)),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                                surfaceTintColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ))),
                            onPressed: () {},
                            icon: const Icon(Icons.event_seat,
                                color: Color(0xFF28527A)),
                            label: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text("Economy",
                                  style: GoogleFonts.inter(
                                      color: const Color(0xFF141511),
                                      fontSize: 14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFF5D161)),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TicketListPage()), // Ganti dengan nama halaman yang sesuai
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(18),
                            child: Text('Search'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.history, size: 24),
                    const SizedBox(width: 8),
                    const Text(
                      'Your Last Search',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Tambahkan aksi untuk tombol "See all" jika diperlukan
                      },
                      child: const Text('See all'),
                    ),
                  ],
                ),
              ), // Menambah jarak antar card
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) => _buildCard()),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Get Attractive Promo!',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        // Tambahkan aksi untuk tombol "See all" jika diperlukan
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) => _buildCardWithImage()),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildCard() {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(left: 24, right: 8),
      child: const Card(
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Kobe", style: TextStyle(fontSize: 14)),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text("Arima Onsen", style: TextStyle(fontSize: 14)),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text("24 Feb 2023 • 1 passenger • Economy",
                  style: TextStyle(color: Color(0xFF8C8D89), fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardWithImage() {
    return Container(
      width: 300,
      height: 150,
      margin: const EdgeInsets.only(left: 24, right: 8),
      child: Card(
        child: _buildImage("https://placehold.jp/300x150.png"),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: 300,
      height: 150,
    );
  }
}
