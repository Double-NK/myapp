import 'package:flutter/material.dart';
import 'package:myapp/browse.dart';
import 'package:myapp/browse1.dart';
import 'package:myapp/browse2.dart';
// Adjust this import based on your actual file structure

final Map<String, String> registeredUsers = {}; // Store registered users

void main() {
  runApp(const LoginDN());
}

class LoginDN extends StatelessWidget {
  const LoginDN({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String backgroundImageUrl = 'assets/bike.jpg';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImageUrl,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.black12,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.black12,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        final email = emailController.text;
                        final password = passwordController.text;

                        // Check credentials for predefined users
                        if (email == 'user@gmail.com' && password == 'user') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Browse()),
                          );
                        } else if (email == 'lender@gmail.com' && password == 'lender') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => browse()),
                          );
                        } else if (email == 'staff@gmail.com' && password == 'staff') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => browse2()),
                          );
                        } else if (registeredUsers.containsKey(email) && registeredUsers[email] == password) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Browse()),
                          );
                        } else {
                          // Show error message if credentials are incorrect
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid email or password.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(size.width, 50),
                      ),
                      child: const Text("Log In", style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
