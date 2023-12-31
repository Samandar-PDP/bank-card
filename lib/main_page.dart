import 'package:bank_cards/add_page.dart';
import 'package:bank_cards/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bank_card.dart';

/// mananaaaaaaaaaaa
import 'dart:math' as math;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _apiService = ApiService();

  void _deleteCard(int id) {
    _apiService.deleteCard(id).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Deleted"))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("My Cards")),
        body: FutureBuilder(
          future: _apiService.getCards(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data?.isNotEmpty == true) {
              final list = snapshot.data?.reversed.toList();
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (v) {
                        _deleteCard(int.parse(list?[index].id ?? ""));
                      },
                      child: _buildCardItem(list?[index]));
                },
              );
            } else if (snapshot.data?.isEmpty == true) {
              return Center(child: Icon(CupertinoIcons.clock));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddPage())),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }

  Widget _buildCardItem(BankCard? card) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      height: 250,

      /// yozzzz
      width: double.infinity,

      /// yoz
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(card?.bankName ?? "",
              style: const TextStyle(fontSize: 20, color: Colors.white)),
          const SizedBox(height: 15),
          Text(
            card?.number ?? "",
            style: const TextStyle(fontSize: 26, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card?.ownerName ?? "",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                card?.expireDate ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
