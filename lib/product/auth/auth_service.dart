import 'package:flutter/cupertino.dart';
import 'package:zemin_istanbul_hive_app/core/service/cache/base_cache_manager.dart';
import 'package:zemin_istanbul_hive_app/core/service/cache/cache_box_names.dart';

class AuthService {
  final String appbarTitle = 'User Info';
  final String saveTitle = 'Save';
  final String printTitle = 'Print To Console';
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final BaseCacheManager<String> _manager = BaseCacheManager<String>(CacheBoxNames.auth);

  Future<void> serviceInit() async {
    _manager.openBox();
  }

  updateItem(dynamic key, String val) async {}

  Future saveInfosToCache() async {
    await serviceInit();
    await _manager.updateItem('username', usernameController.text);
    await _manager.updateItem('phone', phoneController.text);
  }

  Future printCachedItems() async {
    await serviceInit();
    debugPrint(_manager.getItem('username'));
    debugPrint(_manager.getItem('phone'));
  }
}
