import 'package:flutter/material.dart';
// Import each of the other Dart files for navigation
// import 'package:myapp/dashboard.dart';
// import 'status.dart';
// import 'history.dart';
// import 'profile.dart';

class browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<browse> {
  final List<Bike> _bikes = [
    Bike(name: 'Mountain Bicycle', imagePath: 'assets/mountain_bike.png'),
    Bike(name: 'Couple Bicycle', imagePath: 'assets/couple_bike.png'),
    Bike(name: 'Electric Bike', imagePath: 'assets/electric_bike.png'),
    Bike(name: 'Road Bike', imagePath: 'assets/road_bike.png'),
    Bike(name: 'E-Scooter', imagePath: 'assets/E_scooter.png'),
  ];

  String _searchText = '';
  int _selectedIndex = 1; // Set Home as the initial tab (index 1)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the respective screen based on the selected index
    switch (index) {
      case 0:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => Dashboard()),
        // );
        // break;
      case 1:
        // Home tab - stay on the current screen
        break;
      // case 2:
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => Status()),
      //   );
      //   break;
      // case 3:
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => History()),
      //   );
      //   break;
      // case 4:
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => Profile()),
      //   );
        // break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Bike> filteredBikes = _bikes
        .where((bike) => bike.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bike Rental'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _buildBody(filteredBikes),
      bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildBody(List<Bike> filteredBikes) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: 'Available',
                items: <String>['Available', 'Unavailable']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      _searchText = text;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredBikes.length,
            itemBuilder: (context, index) {
              return BikeItem(
                name: filteredBikes[index].name,
                imagePath: filteredBikes[index].imagePath,
              );
            },
          ),
        ),
      ],
    );
  }
}

class Bike {
  final String name;
  final String imagePath;

  Bike({required this.name, required this.imagePath});
}

class BikeItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const BikeItem({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text("Status: Available",
                    style: TextStyle(color: Colors.green)),
                const Text("Condition: Good", style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
