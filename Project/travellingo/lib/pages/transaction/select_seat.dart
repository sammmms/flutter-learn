import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/pages/transaction/basket/basket_page.dart';

class SelectSeatPage extends StatelessWidget {
  final String selectedSeat = '8D'; // Contoh kursi terpilih

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
          'Select Seat',
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
          _buildTimer(context),
          _buildBookingInfo(context),
          _buildSeatLegend(context),
          Expanded(
            child: _buildSeatGrid(context),
          ),
          _buildContinueButton(context),
        ],
      ),
    );
  }

  Widget _buildTimer(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFFDE6EB), // Warna latar belakang baru
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              'The remaining time of order',
              style: TextStyle(color: Color(0xFFEE3D60)), // Warna teks baru
            ),
          ),
          Icon(
            Icons.access_time, // Icon jam
            color: Color(0xFFEE3D60), // Warna icon
          ),
          SizedBox(width: 4.0), // Jarak antara teks dan icon
          Text(
            '00:07:20',
            style: TextStyle(
              color: Color(0xFFEE3D60), // Warna teks
              fontWeight: FontWeight.bold, // Membuat teks menjadi bold
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingInfo(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFF28527A), width: 1.0), // Garis outline
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Luaman Guaamin',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500, // Medium weight
                      fontFamily: 'Inter', // Pastikan font Inter tersedia
                    ),
                  ),
                  SizedBox(height: 4.0),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF8C8D89),
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                      children: [
                        TextSpan(text: 'Economy '),
                        WidgetSpan(
                          child: Container(
                            width: 4.0,
                            height: 4.0,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF8C8D89),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        TextSpan(text: '8D'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.check_circle, color: Color(0xFF57A3BB), size: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatLegend(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _legendItem(context, Colors.grey, 'Available'),
          _legendItem(context, Color(0xFF57A3BB),
              'Selected'), // Warna Selected diperbarui
          _legendItem(
              context, Color(0xFF28527A), 'Filled'), // Warna Filled diperbarui
        ],
      ),
    );
  }

  Widget _legendItem(BuildContext context, Color color, String text) {
    return Row(
      children: [
        Icon(Icons.event_seat, color: color),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  Widget _buildSeatGrid(BuildContext context) {
    final Color selectedColor = Color(0xFF57A3BB); // Warna kursi yang dipilih
    final Color occupiedColor = Color(0xFF28527A); // Warna kursi yang terisi
    final Color availableColor = Colors.grey; // Warna kursi yang tersedia
    List<String> occupiedSeats = ['8D']; // Contoh kursi yang terisi
    String selectedSeat = '8D'; // Contoh kursi yang dipilih

    // Membuat baris header untuk label kursi
    List<Widget> seatHeader = [
      ...['A', 'B', 'C'].map((label) => _buildSeatLabel(label)).toList(),
      Spacer(), // Spacer untuk tengah
      ...['D', 'E', 'F'].map((label) => _buildSeatLabel(label)).toList(),
    ];

    List<Widget> gridRows = [
      Row(children: seatHeader)
    ]; // Menambahkan header sebagai baris pertama

    // Membangun baris kursi dengan angka
    for (var i = 1; i <= 9; i++) {
      List<Widget> rowItems = [];
      for (var j = 0; j < 3; j++) {
        // Kursi A-C
        String seatNumber = '${i}${String.fromCharCode('A'.codeUnitAt(0) + j)}';
        rowItems.add(_buildSeatItem(
          context,
          occupiedSeats.contains(seatNumber),
          seatNumber == selectedSeat,
          availableColor,
          occupiedColor,
          selectedColor,
        ));
      }
      rowItems.add(_buildMiddleNumber(i.toString())); // Angka di tengah

      for (var j = 0; j < 3; j++) {
        // Kursi D-F
        String seatNumber = '${i}${String.fromCharCode('D'.codeUnitAt(0) + j)}';
        rowItems.add(_buildSeatItem(
          context,
          occupiedSeats.contains(seatNumber),
          seatNumber == selectedSeat,
          availableColor,
          occupiedColor,
          selectedColor,
        ));
      }

      gridRows.add(Row(children: rowItems));
    }

    return SingleChildScrollView(
      child: Column(
        children: gridRows,
      ),
    );
  }

// Membangun label untuk setiap kursi
  Widget _buildSeatLabel(String label) {
    return Expanded(
      child: Center(
        child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

// Membangun item kursi dengan warna sesuai kondisi
  Widget _buildSeatItem(
    BuildContext context,
    bool isOccupied,
    bool isSelected,
    Color availableColor,
    Color occupiedColor,
    Color selectedColor,
  ) {
    Color seatColor;
    if (isSelected) {
      seatColor = selectedColor;
    } else if (isOccupied) {
      seatColor = occupiedColor;
    } else {
      seatColor = availableColor;
    }

    // Menggunakan AspectRatio untuk memastikan bahwa item kursi persegi
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1, // Aspek rasio 1:1 untuk membuatnya persegi
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: seatColor,
          ),
          child: Icon(
            Icons.event_seat,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

// Membangun pemisah dengan angka di tengah
  Widget _buildMiddleNumber(String number) {
    return Expanded(
      child: Center(
        child: Text(number, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: ElevatedButton(
        child: Text('Continue', style: TextStyle(fontSize: 16.0)),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  BasketPage(), // Asumsi ada constructor yang menerima data
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF5D161), // Diganti dari 'primary'
          foregroundColor: Colors.white, // Diganti dari 'onPrimary'
          minimumSize: Size.fromHeight(50), // Taller button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
