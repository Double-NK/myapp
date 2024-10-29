import 'package:flutter/material.dart';

void main() {
  runApp(Historylander());
}

class Historylander extends StatefulWidget {
  const Historylander({super.key});

  @override
  State<Historylander> createState() => _HistorylanderState();
}

class _HistorylanderState extends State<Historylander> {
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
      borrowerName: "Student A",
      approvalRequestDate: "20/10/2024",
      returnDate: "21/10/2024",
      approvalDate: "20/10/2024",
      status: "Approved",
      imagePath: "assets/mountain_bike.png",
    ),
    BikeHistory(
      type: "Couple Bicycle",
      borrowerName: "Student B",
      approvalRequestDate: "20/10/2024",
      returnDate: "21/10/2024",
      approvalDate: "20/10/2024",
      status: "Disapproved",
      imagePath: "assets/couple_bike.png",
    ),
    BikeHistory(
      type: "Electric Bike",
      borrowerName: "Student C",
      approvalRequestDate: "20/10/2024",
      returnDate: "22/10/2024",
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
  final String borrowerName;
  final String approvalRequestDate;
  final String returnDate;
  final String approvalDate;
  final String status;
  final String imagePath;

  BikeHistory({
    required this.type,
    required this.borrowerName,
    required this.approvalRequestDate,
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
                      Text("Borrower Name: ${bikeHistory.borrowerName}"),
                      Text("Approval Request Date: ${bikeHistory.approvalRequestDate}"),
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