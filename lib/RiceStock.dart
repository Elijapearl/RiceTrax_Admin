import 'package:flutter/material.dart';

class RiceStock extends StatelessWidget {
  final List<List<String>> data = [
    ['Name', 'Stock', 'Sold', 'Price', 'Status'],
    ['Maharlika', '54', '15', '₱58', 'In Stock'],
    ['Dinorado', '45', '10', '₱59', 'In Stock'],
    ['Jasmin', '40', '10', '₱55', 'In Stock'],
    ['Angelika', '30', '10', '₱56', 'Low Stock'],
    ['Sinandomeng', '0', '9', '₱54', 'Out of Stock'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Center(
          child: Text(
            'Rice Inventory Stock',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 1),
            defaultColumnWidth: FixedColumnWidth(120),
            children: data.map((row) {
              bool isHeader = row == data.first;
              return TableRow(
                decoration: BoxDecoration(
                  color: isHeader ? Colors.grey[300] : Colors.white,
                ),
                children: row.map((cell) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cell,
                      style: TextStyle(
                        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}