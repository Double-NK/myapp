import 'package:flutter/material.dart';
void main() {
  runApp(Historystaff());
}

class Historystaff extends StatefulWidget {
  const Historystaff({super.key});

  @override
  State<Historystaff> createState() => _HistorystaffState();
}

class _HistorystaffState extends State<Historystaff> {
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bicycle Borrow History'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          onTap: (index) {},
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.pending), label: 'Status'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              BicycleCard(
                bicycleType: 'Mountain Bicycle',
                borrowerName: 'Student A',
                approvalRequestDate: '20/10/2024',
                returnDate: '21/10/2024',
                approvalDate: '20/10/2024',
                approvedBy: 'Lecturer A',
                returnedBy: 'Staff A',
                status: 'Approved',
                image: 'assets/mountain_bike.png',
                statusColor: Colors.green,
              ),
              BicycleCard(
                bicycleType: 'Couple Bicycle',
                borrowerName: 'Student B',
                approvalRequestDate: '22/10/2024',
                returnDate: '24/10/2024',
                approvalDate: '20/10/2024',
                approvedBy: 'Lecturer A',
                returnedBy: null,
                status: 'Disapproved',
                image: 'assets/couple_bike.png',
                statusColor: Colors.red,
              ),
              BicycleCard(
                bicycleType: 'Electric Bike',
                borrowerName: 'Student C',
                approvalRequestDate: '21/10/2024',
                returnDate: '25/10/2024',
                approvalDate: '21/10/2024',
                approvedBy: 'Lecturer B',
                returnedBy: 'Staff B',
                status: 'Approved',
                image: 'assets/electric_bike.png',
                statusColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BicycleCard extends StatelessWidget {
  final String bicycleType;
  final String borrowerName;
  final String approvalRequestDate;
  final String returnDate;
  final String approvalDate;
  final String approvedBy;
  final String? returnedBy;
  final String status;
  final String image;
  final Color statusColor;

  BicycleCard({
    required this.bicycleType,
    required this.borrowerName,
    required this.approvalRequestDate,
    required this.returnDate,
    required this.approvalDate,
    required this.approvedBy,
    this.returnedBy,
    required this.status,
    required this.image,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 15),
                Text(
                  bicycleType,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            InfoRow(label: 'Borrower Name', value: borrowerName),
            InfoRow(label: 'Approval Request Date', value: approvalRequestDate),
            InfoRow(label: 'Return Date', value: returnDate),
            InfoRow(label: 'Approval Date', value: approvalDate),
            InfoRow(label: 'Approved By', value: approvedBy),
            if (returnedBy != null)
              InfoRow(label: 'Returned By', value: returnedBy!),
            SizedBox(height: 10),
            Text(
              'Status: $status',
              style: TextStyle(
                fontSize: 16,
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}