import 'package:flutter/material.dart';
import 'package:kanza/presentation/pages/home/home_page.dart';

import '../../values/colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntrinsicWidth(
        stepWidth: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Kanza',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kanza is to create list of\nthings to do ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 72,
                    right: 72,
                    top: 54,
                    bottom: 28,
                  ),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: textFieldHintColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(26),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => HomePage(),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(26),
                    child: SizedBox(
                      width: 144,
                      height: 42,
                      child: Center(
                        child: Text(
                          'Continue',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
