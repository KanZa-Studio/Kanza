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
              title: AppLocalizations.of(context).save,
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
                      text: 'About the Kanza\n v0.0.4\n\n',
                      children: [
                        TextSpan(
                          text: '\“Kanza\” is designed to create\na to-do-list.'
                              'The mobile application\nhas many features\n\n\n\n',
                        ),
                        TextSpan(
                          text: 'Team\n\n\n',
                        ),
                        TextSpan(
                          text: 'Zahir Mirzamammadli\n\n',
                        ),
                        TextSpan(
                          text: 'UI/UX DESIGNER\n\n',
                        ),
                        TextSpan(
                          text: 'I am Zahir Mirzamammadli,\n'
                              'Front End Developer and\nUI/UX Designer.\n\n',
                        ),
                        TextSpan(
                          text: 'https://www.linkedin.com/in/'
                              'zahir-mirzamammadli\n\n\n',
                        ),
                        TextSpan(
                          text: 'Kanan Yusubov\n\n',
                        ),
                        TextSpan(
                          text: 'I am Kanan Yusubov,\nMid-level '
                              'Flutter Developer.\n\n',
                        ),
                        TextSpan(
                          text:
                              'https://www.linkedin.com/in/kananyusubov\n\n\n',
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
