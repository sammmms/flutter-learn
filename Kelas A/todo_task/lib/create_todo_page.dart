import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_task/todo_data.dart';

class CreateToDoPage extends StatefulWidget {
  const CreateToDoPage({super.key});

  @override
  State<CreateToDoPage> createState() => _CreateToDoPageState();
}

class _CreateToDoPageState extends State<CreateToDoPage> {
  String dropdownValue = "Routine";
  final kegiatan = TextEditingController();
  final keterangan = TextEditingController();
  final tanggalMulai = TextEditingController();
  final tanggalAkhir = TextEditingController();

  @override
  void initState() {
    tanggalMulai.text = DateTime.now().toString().split(' ')[0];
    tanggalAkhir.text = DateTime.now().toString().split(' ')[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Create ToDo")),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [Icon(Icons.task), Text("Kegiatan")],
                  ),
                  SizedBox(
                      width: 300,
                      child: TextField(
                          decoration:
                              InputDecoration(hintText: "Judul kegiatan"),
                          controller: kegiatan))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Icon(Icons.align_horizontal_left),
                  Text("Keterangan")
                ],
              ),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: keterangan,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(hintText: "Tambah keterangan"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("Tanggal mulai")
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        child: TextField(
                          decoration: InputDecoration(enabled: false),
                          controller: tanggalMulai,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined),
                          Text("Tanggal akhir")
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 20))
                              .then((value) => setState(() {
                                    tanggalAkhir.text =
                                        value.toString().split(' ')[0];
                                  }));
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: TextField(
                            decoration: InputDecoration(enabled: false),
                            controller: tanggalAkhir,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Icon(Icons.shape_line), Text("Kategori")],
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                          value: "Routine", child: Text("Routine")),
                      DropdownMenuItem(
                          value: "Sometime", child: Text("Sometime")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    value: dropdownValue,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Batal"))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                                context,
                                ToDo(
                                    judulKegiatan: kegiatan.text,
                                    keterangan: keterangan.text,
                                    tanggalMulai: tanggalMulai.text,
                                    tanggalAkhir: tanggalAkhir.text,
                                    kategori: dropdownValue));
                          },
                          child: Text("Simpan")))
                ],
              )
            ]),
          ),
        ));
  }
}
