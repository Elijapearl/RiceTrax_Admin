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
              color: Colors.black, // plain text color
            ),
          ),
          SizedBox(height: 16),

          // Total Sales
          _buildDashboardCard(
            icon: Icons.attach_money,
            title: 'Total Sales Today',
            value: '₱ 15,400',
          ),
          SizedBox(height: 16),

          // Total Stock
          _buildDashboardCard(
            icon: Icons.inventory_2,
            title: 'Total Stock (sacks)',
            value: '930',
          ),
          SizedBox(height: 16),

          // Sold Stocks
          _buildDashboardCard(
            icon: Icons.shopping_cart,
            title: 'Sold Stocks (sacks)',
            value: '250',
          ),
          SizedBox(height: 16),

          // Low Stocks
          _buildDashboardCard(
            icon: Icons.warning,
            title: 'Low Stocks',
            value: '1 item',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // plain card
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300), // subtle border
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // neutral icon background
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.black87, size: 28),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, color: Colors.black)),
                SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}