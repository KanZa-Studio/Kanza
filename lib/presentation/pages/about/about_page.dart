import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/extensions/theme_extension.dart';
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
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context).appDescription,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color:
                                    Theme.of(context).appDescriptionTextColor,
                              ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).team,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).zahir,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).zahirDescription,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color:
                                    Theme.of(context).appDescriptionTextColor,
                              ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).zahirAccount,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontSize: 12,
                              ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).kanan,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).kananDescription,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color:
                                    Theme.of(context).appDescriptionTextColor,
                              ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).kananAccount,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontSize: 12,
                              ),
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
