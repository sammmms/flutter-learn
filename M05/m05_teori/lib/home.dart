import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:m05_teori/provider.dart';
import 'package:provider/provider.dart';
>>>>>>> f3a06f7f793521016d6d412f44868805f6227b30

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
<<<<<<< HEAD
  var valueCheckbox = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oh yes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: "Halo", 
                groupValue: valueCheckbox, 
                onChanged: (value){
                  setState(() {
                    valueCheckbox = value!;
                  });
                }),
                Text("Halo")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: "Hi", 
                groupValue: valueCheckbox, 
                onChanged: (value){
                  setState(() {
                    valueCheckbox = value!;
                  });
                }),
                Text("Hi")
            ],
          ),
          Text(valueCheckbox)
          ]
    ));
  }
}
=======
  final jenisLelaki = {
    "Pemeluk": 0.25,
    "Peak": 0.10,
    "Penyayang": 0.32,
    "Peka": 0.40,
    "Penyium": 0.41
  };
  final tipeLelaki = {"Standar indo": 0.30, "Standar kpop": 0.50};
  Set<String> selectedJenis = {};
  String selectedTipe = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "orangganteng.jpg",
            width: 600,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Lelaki Muda",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  Text(
                      '\$${Provider.of<PriceProvider>(context).currentPrice.toStringAsPrecision(3)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30))
                ]),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(
                    width: 10,
                  ),
                  Text("5.0 (19k reviews)")
                ],
              )),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                  "Siapkan hatimu untuk merasakan nikmatnya pelukan seorang lelaki yang dapat memikat hatimu, bahkan ketika kau tak punya hati. (hanya ditujukan kepada perempuan yang jomblo)")),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Jenis Lelaki",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 50,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  ChoiceChip(
                    label: const Text("Pemeluk"),
                    selected: selectedJenis.contains("Pemeluk"),
                    onSelected: (value) {
                      setState(() {
                        value
                            ? selectedJenis.add("Pemeluk")
                            : selectedJenis.remove("Pemeluk");
                        value
                            ? Provider.of<PriceProvider>(context, listen: false)
                                .addPrice(jenisLelaki["Pemeluk"])
                            : Provider.of<PriceProvider>(context, listen: false)
                                .removePrice(jenisLelaki["Pemeluk"]);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ChoiceChip(
                    label: const Text("Peak"),
                    selected: selectedJenis.contains("Peak"),
                    onSelected: (value) {
                      setState(() {
                        value
                            ? selectedJenis.add("Peak")
                            : selectedJenis.remove("Peak");
                        value
                            ? Provider.of<PriceProvider>(context, listen: false)
                                .addPrice(jenisLelaki["Peak"])
                            : Provider.of<PriceProvider>(context, listen: false)
                                .removePrice(jenisLelaki["Peak"]);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ChoiceChip(
                    label: const Text("Penyayang"),
                    selected: selectedJenis.contains("Penyayang"),
                    onSelected: (value) {
                      setState(() {
                        value
                            ? selectedJenis.add("Penyayang")
                            : selectedJenis.remove("Penyayang");
                        value
                            ? Provider.of<PriceProvider>(context, listen: false)
                                .addPrice(jenisLelaki["Penyayang"])
                            : Provider.of<PriceProvider>(context, listen: false)
                                .removePrice(jenisLelaki["Penyayang"]);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ChoiceChip(
                    label: const Text("Peka"),
                    selected: selectedJenis.contains("Peka"),
                    onSelected: (value) {
                      setState(() {
                        value
                            ? selectedJenis.add("Peka")
                            : selectedJenis.remove("Peka");
                        value
                            ? Provider.of<PriceProvider>(context, listen: false)
                                .addPrice(jenisLelaki["Peka"])
                            : Provider.of<PriceProvider>(context, listen: false)
                                .removePrice(jenisLelaki["Peka"]);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ChoiceChip(
                    label: const Text("Penyium"),
                    selected: selectedJenis.contains("Penyium"),
                    onSelected: (value) {
                      setState(() {
                        value
                            ? selectedJenis.add("Penyium")
                            : selectedJenis.remove("Penyium");
                        value
                            ? Provider.of<PriceProvider>(context, listen: false)
                                .addPrice(jenisLelaki["Penyium"])
                            : Provider.of<PriceProvider>(context, listen: false)
                                .removePrice(jenisLelaki["Penyium"]);
                      });
                    },
                  )
                ]),
              )),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Tipe Lelaki",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 50,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  ChoiceChip(
                    label: const Text("Standar indo"),
                    selected: selectedTipe == "Standar indo",
                    onSelected: (value) {
                      setState(() {
                        if (selectedTipe == "Standar kpop") {
                          Provider.of<PriceProvider>(context, listen: false)
                              .removePrice(tipeLelaki["Standar kpop"]);
                        }
                        if (selectedTipe == "Standar indo") {
                          Provider.of<PriceProvider>(context, listen: false)
                              .removePrice(tipeLelaki["Standar indo"]);
                          selectedTipe = "";
                          return;
                        }
                        Provider.of<PriceProvider>(context, listen: false)
                            .addPrice(tipeLelaki["Standar indo"]);
                        selectedTipe = "Standar indo";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ChoiceChip(
                    label: const Text("Standar kpop"),
                    selected: selectedTipe == "Standar kpop",
                    onSelected: (value) {
                      setState(() {
                        if (selectedTipe == "Standar indo") {
                          Provider.of<PriceProvider>(context, listen: false)
                              .removePrice(tipeLelaki["Standar indo"]);
                        }
                        if (selectedTipe == "Standar kpop") {
                          Provider.of<PriceProvider>(context, listen: false)
                              .removePrice(tipeLelaki["Standar kpop"]);
                          selectedTipe = "";
                          return;
                        }
                        Provider.of<PriceProvider>(context, listen: false)
                            .addPrice(tipeLelaki["Standar kpop"]);
                        selectedTipe = "Standar kpop";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ]),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.redAccent)),
                    onPressed: () {},
                    child: const Text(
                      "Pay",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
>>>>>>> f3a06f7f793521016d6d412f44868805f6227b30