import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class RequestPersonalPage extends StatelessWidget {
  const RequestPersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("requestPersonalData".getString(context)),
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Form(
            child: Column(
              children: [
                Text("requestPersonalDataDetail".getString(context)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "whereDoYouLive".getString(context)),
                ),
                Text("whyAreYouRequestingYourData".getString(context)),
                SizedBox(
                    height: 150,
                    child: TextFormField(
                      maxLength: 150,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
