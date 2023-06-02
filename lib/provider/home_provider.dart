import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Future<void> putToBox() async {
    Box<dynamic> registerBox = Hive.box("register");
    await registerBox.put("name", nameController.text);
    await registerBox.put("lastName", lastNameController.text);
    await registerBox.put("age", ageController.text);
    notifyListeners();
  }
}
