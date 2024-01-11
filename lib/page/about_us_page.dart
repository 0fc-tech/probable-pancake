import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final _controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _controller,
        options: const MapOptions(
            initialCenter: LatLng(47.2061507269755, -1.5394112547796752),
            initialZoom: 20),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          const MarkerLayer(markers: [
            Marker(
                alignment: Alignment.center,
                point: LatLng(47.2061507269755, -1.5394112547796752),
                child: Icon(
                  Icons.school,
                  size: 64,
                ))
          ])
        ],
      ),
    );
  }
}
