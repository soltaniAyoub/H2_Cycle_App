import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final name = TextEditingController(text: state.userName);
    final email = TextEditingController(text: state.email);

    return Scaffold(
  appBar: AppBar(
    title: const Text("Edit profile"),
    automaticallyImplyLeading: true, // <-- bouton retour auto
  ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          TextField(controller: name, decoration: const InputDecoration(labelText: "Full name")),
          const SizedBox(height: 16),
          TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              state.setUser(name.text, email.text);
              Navigator.of(context).pop();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
