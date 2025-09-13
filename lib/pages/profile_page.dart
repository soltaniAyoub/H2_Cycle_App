import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Profil"),
      automaticallyImplyLeading: true), // <-- bouton retour auto,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 12),
          Center(child: Text(state.userName, style: Theme.of(context).textTheme.titleLarge)),
          Center(child: Text(state.email, style: const TextStyle(color: Colors.black54))),
          const SizedBox(height: 20),
          Card(child: ListTile(title: const Text("Edit profile"), onTap: () => context.push('/edit-profile'))),
          Card(child: ListTile(title: const Text("My wallet"), onTap: () => context.push('/wallet'))),
          Card(child: ListTile(title: const Text("Logout"), onTap: () => context.push('/login'))),
          // ✅ Bottom Navigation Bar ajoutée
          
        ],
      ),
    );
  }
}
