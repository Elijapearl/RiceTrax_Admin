import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'RiceStock.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  final List<Map<String, dynamic>> riceData = [
    {'name': 'Dinorado', 'stock': 50},
    {'name': 'Sinandomeng', 'stock': 30},
    {'name': 'Jasmine', 'stock': 20},
    {'name': 'Well-Milled', 'stock': 45},
    {'name': 'Premium', 'stock': 60},
    {'name': 'Brown Rice', 'stock': 25},
    {'name': 'Red Rice', 'stock': 15},
    {'name': 'Glutinous', 'stock': 10},
    {'name': 'Extra Brand', 'stock': 5},
  ];

  String getStatus(int stock) {
    if (stock <= 10) return 'Out of Stock';
    if (stock <= 25) return 'Low Stock';
    return 'In Stock';
  }

  Color getBadgeColor(String status) {
    switch (status) {
      case 'In Stock':
        return Colors.green.shade200;
      case 'Low Stock':
        return Colors.yellow.shade600;
      case 'Out of Stock':
        return Colors.red.shade300;
      default:
        return Colors.grey;
    }
  }

  Icon getIcon() {
    return Icon(Icons.warehouse, color: Colors.green[800], size: 28);
  }

  void _showAddBrandDialog() {
    final TextEditingController _brandNameController = TextEditingController();
    final TextEditingController _stockController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('Add New Brand'),
        content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Brand Name', style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        TextField(
        controller: _brandNameController,
        decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        ),
        ),
        ),
        SizedBox(height: 16),
        Text('Stock', style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        TextField(
        controller: _stockController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        ),
        ),
        ),
        ],
        ),
        actions: [
        TextButton(
        onPressed: () => Navigator.of(context).pop(),
        style: TextButton.styleFrom(
        side: BorderSide(color: Colors.black),
        ),
        child: Text('Cancel', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
        onPressed: () {
        final brandName = _brandNameController.text.trim();
        final stockText = _stockController.text.trim();
        if (brandName.isNotEmpty && stockText.isNotEmpty) {
        final stock = int.tryParse(stockText);
        if (stock != null) {
        setState(() {
        riceData.add({'name': brandName, 'stock': stock});
        });
        Navigator.of(context).pop();
        }
        }
        },
        style: TextButton.styleFrom(
        side: BorderSide(color: Colors.black),
        ),
        child: Text('Add', style: TextStyle(color: Colors.black)),
        ),
        ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.green[800],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green[900]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('RiceTrax',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    Icon(Icons.menu, color: Colors.white),
                  ],
                ),
              ),
              _buildDrawerItem(icon: Icons.dashboard, title: 'Dashboard', context: context, onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
              }),
              _buildDrawerItem(icon: Icons.inventory, title: 'Rice Inventory Stock', context: context, onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RiceStock()));
              }),
              _buildDrawerItem(icon: Icons.list_alt, title: 'Inventory', context: context),
              _buildDrawerItem(icon: Icons.attach_money, title: 'Sales', context: context),
              _buildDrawerItem(icon: Icons.notifications, title: 'Notifications', context: context),
              _buildDrawerItem(icon: Icons.settings, title: 'Settings', context: context),
              _buildDrawerItem(icon: Icons.logout, title: 'Logout', context: context),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('RiceTrax', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inventory', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: riceData.length,
                itemBuilder: (context, index) {
                  final item = riceData[index];
                  final status = getStatus(item['stock']);
                  return GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: getIcon(),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(item['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('${item['stock']} sacks', style: TextStyle(fontSize: 14)),
                              SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: getBadgeColor(status),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    status,
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ],
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: Colors.green)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Colors.redAccent)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => _showAddBrandDialog(),
                style: TextButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text('+ Add Brand', style: TextStyle(fontSize: 16, color: Colors.green)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required BuildContext context,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: onTap,
    );
  }
}
