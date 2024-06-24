import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PaymentScreen(),
    );
  }
}


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}


class _PaymentScreenState extends State<PaymentScreen> {
  final Map<String, dynamic> paymentObject = {
    "sandbox": false,                 // true if using Sandbox Merchant ID
    "merchant_id": "xxxxxx",        // Replace your Merchant ID
    "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
    "order_id": "ItemNo12345",
    "items": "Hello from Flutter!",
    "amount": 30.00,
    // "recurrence": "1 Month",        // Recurring payment frequency
    // "duration": "1 Year",           // Recurring payment duration
    "currency": "LKR",
    "first_name": "Saman",
    "last_name": "Perera",
    "email": "samanp@gmail.com",
    "phone": "0771234567",
    "address": "No.1, Galle Road",
    "city": "Colombo",
    "country": "Sri Lanka",
    "delivery_address": "No. 46, Galle road, Kalutara South",
    "delivery_city": "Kalutara",
    "delivery_country": "Sri Lanka",
    "custom_1": "",
    "custom_2": ""
  };

  void startPayment() {
    PayHere.startPayment(
      paymentObject, 
      (paymentId) {
        print("Recurring Payment Success. Payment Id: $paymentId");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful! Payment Id: $paymentId")));
      }, 
      (error) { 
        print("Recurring Payment Failed. Error: $error");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed! Error: $error")));
      }, 
      () { 
        print("Recurring Payment Dismissed");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Dismissed")));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayHere Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: startPayment,
          child: Text('Pay'),
        ),
      ),
    );
  }

}
