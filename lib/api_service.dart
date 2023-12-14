import 'package:bank_cards/bank_card.dart';
import 'package:http/http.dart' as http; /// yoz
import 'dart:convert'; /// yoz!!!

const baseUrl = 'https://657836d0f08799dc80449136.mockapi.io/cards';

class ApiService {
  Future<List<BankCard>> getCards() async {
    final response = await http.get(Uri.parse('$baseUrl/cards'));
    List<BankCard> cardList = [];
    if(response.statusCode == 200) {
      final decode = json.decode(response.body) as List;
      cardList = decode.map((e) => BankCard.fromJson(e)).toList();
    }
    return cardList;
  }
  Future<bool> createBankCard(BankCard card) async {
    final response = await http.post(Uri.parse('$baseUrl/cards'), body: card.toJson());
    return response.statusCode == 201;
  }
  Future<bool> deleteCard(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/cards/$id'));
    return response.statusCode == 200;
  }
}