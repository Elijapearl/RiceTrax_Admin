import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800], // KEEP AppBar colored!
        title: Text('RiceTrax'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),

          // Total Sales
          _buildDashboardCard(title: 'Total Sales Today'),
          SizedBox(height: 16),

          // Total Stock
          _buildDashboardCard(title: 'Total Stock (sacks)'),
          SizedBox(height: 16),

          // Sold Stocks
          _buildDashboardCard(title: 'Sold Stocks (sacks)'),
          SizedBox(height: 16),

          // Low Stocks
          _buildDashboardCard(title: 'Low Stocks'),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // plain card
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300), // subtle border
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}