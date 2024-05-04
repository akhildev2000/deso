import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionProvider extends ChangeNotifier {
  bool _isPermissionGranted = false;

  bool get isPermissionGranted => _isPermissionGranted;

  PermissionProvider() {
    _loadPermissionState();
  }

  Future<void> requestPermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      _isPermissionGranted = true;
      _savePermissionState();
      notifyListeners();
    }
  }

  Future<void> _loadPermissionState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isPermissionGranted = prefs.getBool('hasPermission') ?? false;
    notifyListeners();
  }

  Future<void> _savePermissionState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasPermission', _isPermissionGranted);
  }
}
