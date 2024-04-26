import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/provider/user_detail_provider.dart';
import 'package:travellingo/utils/locales/gender_util.dart';

class GenderRadio extends StatefulWidget {
  final String gender;
  const GenderRadio({super.key, required this.gender});

  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  late String gender;
  @override
  void initState() {
    gender = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio(
                value: "male",
                groupValue: gender,
                onChanged: (value) {
                  gender = value!;
                  setState(() {});
                }),
            Text("male".getString(context)),
          ],
        ),
        Row(
          children: [
            Radio(
                value: "female",
                groupValue: gender,
                onChanged: (value) {
                  gender = value!;
                  setState(() {});
                }),
            Text("female".getString(context)),
          ],
        ),
        Row(
          children: [
            Radio(
                value: "",
                groupValue: gender,
                onChanged: (value) {
                  gender = value!;
                  setState(() {});
                }),
            Text("notSet".getString(context)),
          ],
        ),
      ],
    );
  }
}
