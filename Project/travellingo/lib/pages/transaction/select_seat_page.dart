import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellingo/component/success_dialog_component.dart';

class SelectSeatPage extends StatefulWidget {
  const SelectSeatPage({super.key});
  @override
  State<SelectSeatPage> createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> occupiedSeats = [
    '8D',
    '1C',
    '2A',
    '3D',
    '3E',
    '3F',
    '5C',
    '6A',
    '6F',
    '9A',
    '9C',
    '9F',
    '4B',
    '3B'
  ]; // Contoh kursi yang terisi
  List<String> selectedSeats = [];

  // Contoh kursi terpilih
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
          'Select Seat',
          style: GoogleFonts.dmSans(
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
          _buildTimer(context),
          _buildBookingInfo(context),
          _buildSeatLegend(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSeatGrid(context),
            ),
          ),
          _buildContinueButton(context),
        ],
      ),
    );
  }

  Widget _buildTimer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDE6EB), // Warna latar belakang baru
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time, // Icon jam
            color: Color(0xFFEE3D60), // Warna icon
          ),
          SizedBox(width: 8.0), // Jarak antara icon dan teks (8.0 px
          Expanded(
            child: Text(
              'The remaining time of order',
              style: TextStyle(color: Color(0xFFEE3D60)), // Warna teks baru
            ),
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
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color(0xFF28527A), width: 1.0), // Garis outline
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Padding(
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
                  Row(
                    children: [
                      Text(
                        "Economy",
                        style: TextStyle(
                            color: Color(0xFF8C8D89),
                            fontSize: 14,
                            fontFamily: 'Inter'),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.circle, color: Color(0xFF8C8D89), size: 8),
                      SizedBox(width: 16),
                      Text(
                        "8D",
                        style: TextStyle(
                            color: Color(0xFF8C8D89),
                            fontSize: 14,
                            fontFamily: 'Inter'),
                      ),
                    ],
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
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _legendItem(context, Colors.grey, 'Available'),
          _legendItem(context, const Color(0xFF57A3BB),
              'Selected'), // Warna Selected diperbarui
          _legendItem(context, const Color(0xFF28527A),
              'Filled'), // Warna Filled diperbarui
        ],
      ),
    );
  }

  Widget _legendItem(BuildContext context, Color color, String text) {
    return Row(
      children: [
        Icon(Icons.chair_rounded, color: color),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  Widget _buildSeatGrid(BuildContext context) {
    const Color selectedColor = Color(0xFF57A3BB); // Warna kursi yang dipilih
    const Color occupiedColor = Color(0xFF28527A); // Warna kursi yang terisi
    const Color availableColor = Colors.grey; // Warna kursi yang tersedia

    // Membuat baris header untuk label kursi
    List<Widget> seatHeader = [
      ...['A', 'B', 'C'].map((label) => _buildSeatLabel(label)),
      const Spacer(), // Spacer untuk tengah
      ...['D', 'E', 'F'].map((label) => _buildSeatLabel(label)),
    ];

    List<Widget> gridRows = [
      Row(children: seatHeader)
    ]; // Menambahkan header sebagai baris pertama

    // Membangun baris kursi dengan angka
    for (var i = 1; i <= 9; i++) {
      List<Widget> rowItems = [];
      for (var j = 0; j < 3; j++) {
        // Kursi A-C
        String seatNumber = '$i${String.fromCharCode('A'.codeUnitAt(0) + j)}';
        rowItems.add(_buildSeatItem(
          context,
          occupiedSeats.contains(seatNumber),
          selectedSeats.contains(seatNumber),
          availableColor,
          occupiedColor,
          selectedColor,
          seatNumber,
        ));
      }
      rowItems.add(_buildMiddleNumber(i.toString())); // Angka di tengah

      for (var j = 0; j < 3; j++) {
        // Kursi D-F
        String seatNumber = '$i${String.fromCharCode('D'.codeUnitAt(0) + j)}';
        rowItems.add(_buildSeatItem(
          context,
          occupiedSeats.contains(seatNumber),
          selectedSeats.contains(seatNumber),
          availableColor,
          occupiedColor,
          selectedColor,
          seatNumber,
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
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
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
    String seatNumber,
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
        child: InkWell(
          onTap: () {
            // Memperbarui state ketika item kursi ditekan
            setState(() {
              if (isOccupied) {
                return; // Jangan lakukan apa pun jika kursi terisi
              }

              if (selectedSeats.contains(seatNumber)) {
                selectedSeats.remove(seatNumber);
              } else {
                selectedSeats.add(seatNumber);
              }
            });
          },
          child: Icon(
            Icons.chair_rounded,
            color: seatColor,
          ),
        ),
      ),
    );
  }

// Membangun pemisah dengan angka di tengah
  Widget _buildMiddleNumber(String number) {
    return Expanded(
      child: Center(
        child:
            Text(number, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          showSuccessDialog(context, "Successfully added to cart!",
              onClose: () {
            // pop 3 kali untuk kembali ke halaman sebelumnya
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF5D161), // Diganti dari 'primary'
          foregroundColor: Colors.white, // Diganti dari 'onPrimary'
          minimumSize: const Size.fromHeight(50), // Taller button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Add to Cart', style: TextStyle(fontSize: 16.0)),
        ),
      ),
    );
  }
}
