import 'package:flutter/material.dart';
import 'package:workshop_dic/src/home/presentation/widgets/digimon_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                      'https://i.pinimg.com/originals/ca/5b/a7/ca5ba7d121989a03a9e22518a3ccaab1.png'),
                ),
              ),
            ),
            const DigimonListWidget(),
          ],
        ),
      ),
    );
  }
}
