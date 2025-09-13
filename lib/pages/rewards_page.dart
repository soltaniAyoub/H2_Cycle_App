import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final state = context.watch<AppState>();
    final rewards = [
  {"icon": "assets/images/rewards/coffee_image.jpg", "title": "20% off coffee", "cost": 200},
  {"icon": "assets/images/rewards/bottle_water.jpg", "title": "Reusable bottle", "cost": 2000},
  {"icon": "assets/images/rewards/gift_card_image.jpg", "title": "Gift card", "cost": 1500},
  {"icon": "assets/images/rewards/gift_image.jpg", "title": "Gift donation", "cost": 500},
  {"icon": "assets/images/rewards/bike_image.jpg", "title": "Bike rental", "cost": 2500},
  {"icon": "assets/images/rewards/food_image.jpeg", "title": "Free meal", "cost": 3000},
];


    return Scaffold(
      appBar: AppBar(title: const Text("Rewards"), automaticallyImplyLeading: true),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        childAspectRatio: 0.75, // <-- plus d’espace vertical
        children: rewards.map((r) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      r["icon"] as String,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  r["title"] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${r["cost"]} points",
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 28, // <-- bouton petit
                  child: ElevatedButton(
                    onPressed: () {
                      // logique du redeem
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      textStyle: const TextStyle(fontSize: 11),
                    ),
                    child: const Text("Redeem"),
                  ),
                ),
                const SizedBox(height: 6),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
