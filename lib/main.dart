import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  incrementCounter() async {
    var url = Uri.https('apiv2stg.promilo.com', 'user/oauth/token');
    var response = await http.post(url, headers: {
      "Authorization" : "Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=="
    }, body: {
      "Email" : "test45@yopmail.com",
      "password" : "8776f108e247ab1e2b323042c049c266407c81fbad41bde1e8dfc1bb66fd267e",
      "grant_type" : "password"
    });
    print("response");
    print(response.statusCode);
    print("responseData");
    print(response.body);
    responseData = cardsListFromJson(response.body);
    return responseData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            incrementCounter();
          },
          child: Text('Submit the file'),
        ),
      ),
    );
  }
}
