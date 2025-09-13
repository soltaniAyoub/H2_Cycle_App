import 'package:flutter/material.dart';

class TransactionItem {
  final String title;
  final String subtitle;
  final DateTime date;

  TransactionItem({required this.title, required this.subtitle, required this.date});
}

class AppState extends ChangeNotifier {
  String userName = "Ayoub";
  String email = "ayoub@example.com";
  int points = 1200;
  double hydrogenKg = 2.3;

  List<TransactionItem> history = [
    TransactionItem(title: "Recycled 3 bottles", subtitle: "Machine #TN-001", date: DateTime.now().subtract(const Duration(days: 1))),
    TransactionItem(title: "Reward redeemed", subtitle: "Free coffee", date: DateTime.now().subtract(const Duration(days: 2))),
  ];

  void addPoints(int pts, double h2) {
    points += pts;
    hydrogenKg += h2;
    history.insert(0, TransactionItem(title: "Recycled bottles", subtitle: "Earned $pts pts", date: DateTime.now()));
    notifyListeners();
  }

  void redeemPoints(int cost) {
    if (points >= cost) {
      points -= cost;
      history.insert(0, TransactionItem(title: "Reward redeemed", subtitle: "$cost pts used", date: DateTime.now()));
      notifyListeners();
    }
  }

  void setUser(String name, String mail) {
    userName = name;
    email = mail;
    notifyListeners();
  }
}
