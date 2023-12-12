import 'package:bank_cards/api_service.dart';
import 'package:bank_cards/number_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  final _apiService = ApiService();
  bool _isLoading = false;
  final _cardNumber = TextEditingController();
  final _name = TextEditingController();
  final _expire = TextEditingController();
  final _bankName = TextEditingController();

  late Color color;

  @override
  void initState() {
    color = _generateColor();
    super.initState();
  }

  _generateColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Card"),actions: [
        _isLoading ? const CircularProgressIndicator() :
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.check_mark))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
        Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.all(8),
        height: 250, /// yozzzz
        width: double.infinity,/// yoz
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(_bankName.text, style: const TextStyle(fontSize: 20,color: Colors.white)),
            const SizedBox(height:15),
            Text(_cardNumber.text, style: const TextStyle(fontSize: 26,color: Colors.white),),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_name.text,style: TextStyle(color: Colors.white),),
                Text(_expire.text,style: TextStyle(color: Colors.white),),
              ],
            )
          ],
        ),
      ),
            const SizedBox(height: 10),
            TextField(
              controller: _bankName,
              onChanged: (v) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Bank Name',
                border: InputBorder.none,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                fillColor: Colors.white70,
                filled: true
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _cardNumber,
              onChanged: (v) => setState(() {}),
              keyboardType: TextInputType.number,
              inputFormatters: [
                CardNumberInputFormatter(4, ' '),
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16)
              ],
              decoration: InputDecoration(
                  hintText: '0000 0000 0000 0000',
                  border: InputBorder.none,
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  fillColor: Colors.white70,
                  filled: true
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: TextField(
                  controller: _name,
                  onChanged: (v) => setState(() {}),
                  decoration: InputDecoration(
                      hintText: 'Owner name',
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      fillColor: Colors.white70,
                      filled: true
                  ),
                )),
                const SizedBox(width: 10,),
                Expanded(child: TextField(
                  controller: _expire,
                  onChanged: (v) => setState(() {}),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4)
                  ],
                  decoration: InputDecoration(
                      hintText: 'Expire date',
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      fillColor: Colors.white70,
                      filled: true
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
