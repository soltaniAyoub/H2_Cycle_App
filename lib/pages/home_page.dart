import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../app_state.dart';

// ✅ Carte pour afficher des stats
class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Boutons rapides
class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 173,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.black87),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("H₂ Cycle"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Text(
              "Good Morning, ${state.userName} 🌱",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              StatCard(
                value: "${state.points}",
                label: "Green Points",
                color: Colors.green,
              ),
              const SizedBox(width: 12),
              StatCard(
                value: "${state.hydrogenKg.toStringAsFixed(1)} kg",
                label: "H₂ generated",
                color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _QuickAction(
                icon: Icons.qr_code_2,
                label: "Recycle Now",
                onTap: () => context.go('/recycle'),
              ),
              _QuickAction(
                icon: Icons.place,
                label: "Find a Machine",
                onTap: () => context.go('/map'),
              ),
              _QuickAction(
                icon: Icons.card_giftcard,
                label: "Rewards",
                onTap: () => context.go('/rewards'),
              ),
              _QuickAction(
                icon: Icons.person,
                label: "Profile",
                onTap: () => context.go('/profile'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Lottie.asset(
              "assets/animations/Bottle_power_recycling.json",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}