import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class PrivacySharingPage extends StatelessWidget {
  const PrivacySharingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("privacyNSharing".getString(context)),
        ),
        body: Column(
          children: [
            Text("manageYourAccountData".getString(context)),
            Text("manageYourAccountDataDetail".getString(context)),
            OutlinedButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Text("requestYourPersonalData".getString(context)),
                    Text("requestYourPersonalData".getString(context))
                  ],
                ))
          ],
        ));
  }
}
