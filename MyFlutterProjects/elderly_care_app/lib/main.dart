import 'package:flutter/material.dart'; // package that adds buttons functions
import 'login.dart';
import 'register.dart';

void main() {
  runApp(ElderlyCareApp());
}

/// Home Page

class ElderlyCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'ElderNest App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),

      /// Routes 
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => BottomTabScreen(),
        '/register': (context) => RegisterScreen(),
        '/menu': (context) => MenuTab(), 
      },
    );
  }
}



/// Bottom Panel 

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomeTab(), MedicineTab(), ProfileTab(),MenuTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medication),label: 'Medicine',),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],

      ),
    );
  }
}



// /// Home Tab 

// class HomeTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('🏠 Home')),
//       body: Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(
//         'Welcome',
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.teal,
//         ),
//       ),
//       SizedBox(height: 16),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Text(
//           'Your one-stop solution for managing elderly care with compassion. Stay connected, organized, and supportive for your loved ones—all in one app.',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     ],
//   ),
// ),

//     );
//   }
// }




/// Home Tab


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🏠 Home'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.volunteer_activism, size: 80, color: Colors.teal),
            SizedBox(height: 24),
            Text(
              'Welcome to ElderNest',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Your one-stop solution for managing elderly care with compassion. Stay connected, organized, and supportive for your loved ones—all in one app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate or show a message
              },
              icon: Icon(Icons.medical_services),
              label: Text("View Care Plans"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// Medicine Tab


class MedicineTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('💊 Medicine'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medication_liquid, size: 80, color: Colors.teal),
            SizedBox(height: 24),
            Text(
              'Medicine Management',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Keep track of your prescriptions, doses, and medicine reminders to stay on top of your health needs.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to add/view medicines page
              },
              icon: Icon(Icons.add_alarm),
              label: Text("Set Reminder"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/// Profile Tab


class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('👤 Profile')),
      body: Center(
        child: Text(
          'View and edit your profile.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('📝 Menu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Menu',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                // Navigate to login screen and remove previous routes
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login', // login route
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


