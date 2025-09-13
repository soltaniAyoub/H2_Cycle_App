import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final center = LatLng(36.8065, 10.1815); // Tunis
    final machines = [
      LatLng(36.8065, 10.1815),
      LatLng(36.853, 10.206),
      LatLng(36.81897, 10.16579), 
      LatLng(36.752778, 10.312222), 
      LatLng(36.725, 10.22), 
      LatLng(36.802778, 10.179444), 
      LatLng(36.835278, 10.134167), 
      LatLng(36.808056, 10.0975),  
      LatLng(36.768889, 10.275833), 
      LatLng(36.768056, 10.22),     
      LatLng(36.9, 10.1),           
      LatLng(36.670833, 10.164722), 
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Find a Machine"),
      automaticallyImplyLeading: true), // <-- bouton retour auto
      body: FlutterMap(
        options: MapOptions(initialCenter: center, initialZoom: 14),
        children: [
          TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
          MarkerLayer(markers: [
            for (final m in machines)
              Marker(
                point: m,
                width: 40,
                height: 40,
                child: const Icon(Icons.recycling, color: Colors.green, size: 32),
              ),
          ]),
        ],
      ),
    );
  }
}
