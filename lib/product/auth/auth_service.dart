import 'package:flutter/cupertino.dart';

class AuthService {
  final String appbarTitle = 'User Info';
  final String saveTitle = 'Save';
  final String printTitle = 'Print To Console';
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> serviceInit() async {}

  Future saveInfosToCache() async {
    await serviceInit();
  }

  Future printCachedItems() async {
    await serviceInit();
  }
}
