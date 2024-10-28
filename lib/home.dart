import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:myapp/register.dart'; // Import the Register screen

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);
const Color loginButtonColor = Color(0xFF4CAF50); // Green color
const Color registerButtonColor = Color(0xFF2196F3); // Blue color

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32, // Font size for the heading
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 20, // Size for the subheading
          ),
        ),
      ),
      home: const WelcomeScreen(),
      
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/bike.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Overlay Container for Text and Buttons
          Container(
            color: Colors.black54, // Semi-transparent background for text visibility
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20), // Add some padding around the content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Text
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 400), // Space below the welcome text
                // Login Button
                FilledButton(
                  onPressed: () {
                    // Navigate to Register Screen when Login is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginDN()),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: loginButtonColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 40),
                  ),
                  child: Text('Login'.toUpperCase()),
                ),
                const SizedBox(height: 8), // Space between buttons
                // Register Button
                FilledButton(
                  onPressed: () {
                    // Navigate to Register Screen when Register is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: registerButtonColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 40),
                  ),
                  child: Text('Register'.toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const Home());
}
