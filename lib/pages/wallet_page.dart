import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text("My Wallet"),
      automaticallyImplyLeading: true, // <-- bouton retour auto
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text("Green Points"),
              subtitle: Text("${state.points} points"),
              trailing: ElevatedButton(onPressed: () {}, child: const Text("Redeem")),
            ),
          ),
          const SizedBox(height: 16),
          Text("Transaction History", style: Theme.of(context).textTheme.titleLarge),
          for (final t in state.history)
            Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: Text(t.title),
                subtitle: Text("${t.subtitle}\n${DateFormat.yMMMd().format(t.date)}"),
                isThreeLine: true,
              ),
            )
        ],
      ),
    );
  }
}
