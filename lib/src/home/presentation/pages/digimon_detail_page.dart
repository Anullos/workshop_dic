import 'package:flutter/material.dart';
import 'package:workshop_dic/src/home/domain/digimon_model.dart';

class DigimonDetailPage extends StatelessWidget {
  const DigimonDetailPage({super.key, required this.digimon});
  final DigimonModel digimon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(digimon.name),
      ),
      body: Center(
        child: Hero(
          tag: digimon.name,
          child: Image.network(digimon.img),
        ),
      ),
    );
  }
}
