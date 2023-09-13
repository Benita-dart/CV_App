import 'package:flutter/material.dart';
import 'edit_cv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserDetails userDetails = UserDetails(
      fullName: 'Benita Ogechi Eze',
      slackUsername: 'Benita Eze',
      githubHandle: 'BenitaR-png',
      bio:
      'As a seasoned Flutter Developer, I specialize in crafting cross-platform mobile applications that set the bar high. My expertise in Dart empowers me to create high-performance apps that seamlessly run on both iOS and Android. I specialize in designing an intuitive UI, optimizing code for peak performance, or implementing cutting-edge features.',
    );

    return MaterialApp(
      home: HomePage(userDetails: userDetails),
      theme: ThemeData(
        primaryColor: Colors.blue, // Set the background color for the app
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final UserDetails userDetails;

  const HomePage({super.key, required this.userDetails});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserDetails _updatedUserDetails;

  @override
  void initState() {
    super.initState();
    // Initialize _updatedUserDetails with the initial user details.
    _updatedUserDetails = widget.userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
      ),
      body: Center(
        child: Container(
          width: 300, // Set a fixed width for the parent container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoContainer(
                'Full Name',
                _updatedUserDetails.fullName,
              ),
              _buildInfoContainer(
                'Slack Username',
                _updatedUserDetails.slackUsername,
              ),
              _buildInfoContainer(
                'GitHub Handle',
                _updatedUserDetails.githubHandle,
              ),
              const SizedBox(height: 20),
              _buildInfoContainer(
                'Brief Bio',
                _updatedUserDetails.bio,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditDetailsPage(
                        userDetails: _updatedUserDetails,
                        onUpdate: (updatedDetails) {
                          setState(() {
                            _updatedUserDetails = updatedDetails;
                          });
                        },
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      _updatedUserDetails = result;
                    });
                  }
                },
                child: const Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String label, String value) {
    return Container(
      width: double.infinity, // Set the width to fill the parent container
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
