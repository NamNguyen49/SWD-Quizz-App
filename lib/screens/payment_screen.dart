import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Color.fromARGB(255, 68, 103, 119),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 103, 119),
              Color.fromARGB(255, 144, 191, 230),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose your payment method',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Pay with MOMO'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Thay đổi màu nền cho nút MOMO ở đây
                ),
                onPressed: () {
                  // TODO: Handle payment logic with MOMO
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Pay with Banking'),
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.green, // Thay đổi màu nền cho nút Banking ở đây
                ),
                onPressed: () {
                  // TODO: Handle payment logic with Banking
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
