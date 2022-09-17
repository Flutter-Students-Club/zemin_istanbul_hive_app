import 'package:flutter/material.dart';
import 'auth_service.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_service.appbarTitle), centerTitle: true, backgroundColor: Colors.blueGrey),
      body: Form(
        key: _service.key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: _service.usernameController, keyboardType: TextInputType.name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: _service.phoneController, keyboardType: TextInputType.phone),
            ),
            ElevatedButton(onPressed: () async => await _service.saveInfosToCache(), child: Text(_service.saveTitle)),
            const SizedBox(height: 10.0),
            ElevatedButton(onPressed: () async => await _service.printCachedItems(), child: Text(_service.printTitle)),
          ],
        ),
      ),
    );
  }
}
