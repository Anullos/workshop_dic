import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/digimon_model.dart';
import '../pages/digimon_detail_page.dart';
import 'digimon_list_item_widget.dart';

class DigimonListWidget extends StatelessWidget {
  const DigimonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DigimonModel>>(
      future: getMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final digimon = snapshot.data![index];
                return DigimonsListItemWidget(
                  digimon: digimon,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DigimonDetailPage(digimon: digimon),
                    ),
                  ),
                );
              },
              childCount: snapshot.data!.length,
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<List<DigimonModel>> getMovies() async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final url = Uri.parse('https://digimon-api.vercel.app/api/digimon');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body) as List;
        final digimons = List<DigimonModel>.from(
            responseJson.map((e) => DigimonModel.fromMap(e))).toList();
        return digimons;
      }

      return [];
    } catch (e) {
      debugPrint('error: $e');
      return [];
    }
  }
}
