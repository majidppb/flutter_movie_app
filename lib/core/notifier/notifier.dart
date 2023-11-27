import 'package:flutter/foundation.dart';

class Notifier extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}
