import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/top_bar.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              title: AppLocalizations.of(context).about,
              leadingIcon: Icons.arrow_back,
              centerTitle: false,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 86),
            Expanded(
              child: ListView(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          AppLocalizations.of(context).aboutTheKanza('v0.0.4'),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context).appDescription,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).team,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).zahir,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).zahirDescription,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).zahirAccount,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).kanan,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).kananDescription,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).kananAccount,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
