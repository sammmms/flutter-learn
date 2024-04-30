import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:travellingo/utils/country_code_list.dart';

class RequestPersonalPage extends StatelessWidget {
  const RequestPersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("requestPersonalData".getString(context)),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: 500,
          child: Form(
            child: Column(
              children: [
                Text(
                  "requestPersonalDataDetail".getString(context),
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  child: Stack(
                    children: [
                      Text("whereDoYouLive".getString(context)),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: true,
                            menuMaxHeight: 400,
                            borderRadius: BorderRadius.circular(16),
                            items: countries
                                .map((country) => DropdownMenuItem(
                                    value: country.toLowerCase(),
                                    child: Text(country)))
                                .toList(),
                            onChanged: (value) {}),
                      )
                    ],
                  ),
                ),
                Text("whyAreYouRequestingYourData".getString(context)),
                SizedBox(
                    height: 150,
                    child: TextFormField(
                      maxLength: 150,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                    )),
                OutlinedButton(onPressed: () {}, child: Text("Request data"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
