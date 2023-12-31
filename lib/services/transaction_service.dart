import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class TransactionService {
  // RJN BASE URL
  // String baseUrl = 'http://192.168.1.4/api';

  //rio BASE URL
  // String baseUrl = 'http://172.24.0.1/api';

  //ALIF BASE URL
  // String baseUrl = 'http://192.168.1.20/api';

  //Myud BASE URL
  // String baseUrl = 'http://192.168.0.186/api';

  //Hosted BASE URL
  String baseUrl = 'https://xplorebromo.ceban-app.com/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'address': 'Marsemoon',
        'items': carts
            .map(
              (cart) => {
                'id': cart.product!.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': "PENDING",
        'total_price': totalPrice,
        'shipping_price': 0,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Checkout Failed!');
    }
  }
}
