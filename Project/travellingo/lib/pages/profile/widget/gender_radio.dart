import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/provider/user_detail_provider.dart';
import 'package:travellingo/utils/gender_util.dart';

class GenderRadio extends StatefulWidget {
  final String gender;
  final bool isEditing;
  const GenderRadio({super.key, required this.gender, required this.isEditing});

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
                onChanged: widget.isEditing ? onChangeFunction : null),
            Text("male".getString(context)),
          ],
        ),
        Row(
          children: [
            Radio(
                value: "female",
                groupValue: gender,
                onChanged: widget.isEditing ? onChangeFunction : null),
            Text("female".getString(context)),
          ],
        ),
        Row(
          children: [
            Radio(
                value: "",
                groupValue: gender,
                onChanged: widget.isEditing ? onChangeFunction : null),
            Text("notSet".getString(context)),
          ],
        ),
      ],
    );
  }

  void onChangeFunction(String? value) {
    gender = value!;
    setState(() {});
  }
}
