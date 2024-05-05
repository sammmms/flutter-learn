import 'package:flutter/material.dart';
import 'transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final List<Map<String, dynamic>> transactions = [
    {
      "name": "Himeji Castle",
      "ticket": 1,
      "date": "18 Oct 22",
      "time": "19:00",
      "price": 25.00,
      "status": false,
      "image": "https://placehold.jp/150x150.png"
    },
    {
      "name": "Cherry Blossom",
      "ticket": 1,
      "date": "18 Oct 22",
      "time": "19:00",
      "price": 25.00,
      "status": true,
      "image": "https://placehold.jp/150x150.png"
    },
    {
      "name": "Earthquake Museum",
      "ticket": 1,
      "date": "18 Oct 22",
      "time": "19:00",
      "price": 25.00,
      "status": false,
      "image": "https://placehold.jp/150x150.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFF5D161)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          height: 36,
          width: MediaQuery.of(context).size.width - 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Color(0xFFF5D161)),
              hintText: "Explore something fun",
              border: InputBorder.none,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xFF3E83A8)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return TransactionCard(data: transactions[index]);
        },
      ),
    );
  }
}
