import 'package:flutter/material.dart';
import 'package:workshop_dic/src/home/domain/digimon_model.dart';

class DigimonsListItemWidget extends StatelessWidget {
  const DigimonsListItemWidget(
      {super.key, required this.digimon, required this.onTap});
  final DigimonModel digimon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            border: borderByLevel(),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: digimon.name,
                  child: Image.network(digimon.img),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                digimon.name,
                style: TextStyle(fontSize: 20, color: colorByLevel()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Border borderByLevel() {
    switch (digimon.level) {
      case 'Rookie':
        return Border.all(color: Colors.green, width: 1);
      case 'Champion':
        return Border.all(color: Colors.blue, width: 2);
      case 'Ultimate':
        return Border.all(color: Colors.purple, width: 3);
      case 'Mega':
        return Border.all(color: Colors.red, width: 4);
      default:
        return Border.all(color: Colors.grey, width: 1);
    }
  }

  Color colorByLevel() {
    switch (digimon.level) {
      case 'Rookie':
        return Colors.green;
      case 'Champion':
        return Colors.blue;
      case 'Ultimate':
        return Colors.purple;
      case 'Mega':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
