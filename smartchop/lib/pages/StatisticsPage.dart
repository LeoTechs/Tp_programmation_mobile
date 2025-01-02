import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Statistics Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Add your statistics widgets here
            Text(
              'Total Sales: \$1000',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Total Customers: 150',
              style: TextStyle(fontSize: 18),
            ),
            // Add more statistics as needed
          ],
        ),
      ),
    );
  }
}
