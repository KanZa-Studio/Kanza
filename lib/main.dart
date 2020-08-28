import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app.dart';
import './kanza_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = KanzaBlocObserver();
  runApp(KanzaApp());
}
