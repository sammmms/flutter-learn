import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:travellingo/pages/profile/widget/privacy_button.dart';

class PrivacySharingPage extends StatelessWidget {
  const PrivacySharingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("privacyNSharing".getString(context)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "manageYourAccountData".getString(context),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                textScaler: const TextScaler.linear(1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "manageYourAccountDataDetail".getString(context),
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(
                height: 20,
              ),
              const PrivacyButton(
                  title: "requestYourPersonalData",
                  description: "requestYourPersonalDataDetail"),
              const SizedBox(
                height: 10,
              ),
              const PrivacyButton(
                  title: "deleteYourAccount",
                  description: "deleteYourAccountDetail"),
            ],
          ),
        ));
  }
}
