import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './tiketlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          // Simulasi AppBar menggunakan Container
          Container(
            height: 150, // Tinggi simulasi AppBar
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://placehold.jp/150x150.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text('Flight',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                        width:
                            48), // Menjaga space untuk ikon di kanan jika ada
                  ],
                ),
              ),
            ),
          ),
          // Konten yang menindih bagian dari simulasi AppBar
          Container(
            padding:
                EdgeInsets.only(top: 120), // Penyesuaian padding untuk menindih
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.airplane_ticket,
                                          color: Color(0xFF3E84A8)),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: 'Kobe',
                                          onChanged: (String? newValue) {},
                                          items: [
                                            DropdownMenuItem(
                                                value: 'Kobe',
                                                child: Text('Kobe')),
                                            DropdownMenuItem(
                                                value: 'Osaka',
                                                child: Text('Osaka'))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: Color(0xFF3E84A8)),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: 'Himeji Castle',
                                          onChanged: (String? newValue) {},
                                          items: [
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
                            IconButton(
                              icon: Icon(Icons.swap_vert,
                                  color: Color(0xFF28527A)),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today,
                                      color: Color(0xFF28527A)),
                                  SizedBox(width: 8),
                                  Text("Mon, 01 April",
                                      style: GoogleFonts.inter(
                                          color: Color(0xFF141511),
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                            Text("Round-trip?",
                                style: GoogleFonts.inter(
                                    color: Color(0xFF8C8D89), fontSize: 12)),
                            SizedBox(width: 8),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Color(0xFF3E84A8),
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.people, color: Color(0xFF28527A)),
                                  SizedBox(width: 8),
                                  Text("1 Passenger",
                                      style: GoogleFonts.inter(
                                          color: Color(0xFF141511),
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.event_seat,
                                    color: Color(0xFF28527A)),
                                SizedBox(width: 8),
                                Text("Economy",
                                    style: GoogleFonts.inter(
                                        color: Color(0xFF141511),
                                        fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFF5D161)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TicketListPage()), // Ganti dengan nama halaman yang sesuai
                          );
                        },
                        child: Text('Search'),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Last Search',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tambahkan aksi untuk tombol "See all" jika diperlukan
                        },
                        child: Text('See all'),
                      ),
                    ],
                  ),
                ), // Menambah jarak antar card
                Container(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(3, (index) => _buildCard()),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Get Attractive Promo!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tambahkan aksi untuk tombol "See all" jika diperlukan
                        },
                        child: Text('See all'),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        List.generate(3, (index) => _buildCardWithImage()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildCard() {
    return Container(
      width: 260,
      margin: EdgeInsets.only(left: 24, right: 8),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kobe", style: TextStyle(fontSize: 14)),
                  Icon(Icons.arrow_forward, size: 14),
                  Text("Arima Onsen", style: TextStyle(fontSize: 14)),
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
      width: 310,
      height: 130,
      margin: EdgeInsets.only(left: 24, right: 8),
      child: Card(
        child: _buildImage("https://placehold.jp/150x150.png"),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: 310,
      height: 130,
    );
  }
}
