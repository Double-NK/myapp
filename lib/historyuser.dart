import 'package:flutter/material.dart';

void main() {
  runApp(Historyuser());
}

class Historyuser extends StatefulWidget {
  const Historyuser({super.key});

  @override
  State<Historyuser> createState() => _HistoryuserState();
}

class _HistoryuserState extends State<Historyuser> {
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bicycle History',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HistoryScreen(),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  final List<BikeHistory> historyList = [
    BikeHistory(
      type: "Mountain Bicycle",
      borrowDate: "20/10/2024",
      returnDate: "21/10/2024",
      approvalDate: "20/10/2024",
      status: "Approved",
      imagePath: "assets/mountain_bike.png", 
    ),
    BikeHistory(
      type: "Couple Bicycle",
      borrowDate: "22/10/2024",
      returnDate: "23/10/2024",
      approvalDate: "22/10/2024",
      status: "Disapproved",
      imagePath: "assets/couple_bike.png",
    ),
    BikeHistory(
      type: "Electric Bike",
      borrowDate: "20/10/2024",
      returnDate: "21/10/2024",
      approvalDate: "20/10/2024",
      status: "Approved",
      imagePath: "assets/electric_bike.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          onTap: (index) {},
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.pending), label: 'Status'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          return BikeHistoryCard(bikeHistory: historyList[index]);
        },
      ),
    );
  }
}

class BikeHistory {
  final String type;
  final String borrowDate;
  final String returnDate;
  final String approvalDate;
  final String status;
  final String imagePath;

  BikeHistory({
    required this.type,
    required this.borrowDate,
    required this.returnDate,
    required this.approvalDate,
    required this.status,
    required this.imagePath,
  });
}

class BikeHistoryCard extends StatelessWidget {
  final BikeHistory bikeHistory;

  const BikeHistoryCard({required this.bikeHistory});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bikeHistory.type,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  bikeHistory.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Borrow Date: ${bikeHistory.borrowDate}"),
                      Text("Return Date: ${bikeHistory.returnDate}"),
                      Text("Approval Date: ${bikeHistory.approvalDate}"),
                      SizedBox(height: 8),
                      Text(
                        "Status: ${bikeHistory.status}",
                        style: TextStyle(
                          color: bikeHistory.status == "Approved" ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}