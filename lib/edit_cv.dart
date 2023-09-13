import 'package:flutter/material.dart';

class EditDetailsPage extends StatefulWidget {
  final UserDetails userDetails;
  final Function(UserDetails) onUpdate;

  const EditDetailsPage({super.key, required this.userDetails, required this.onUpdate});

  @override
  _EditDetailsPageState createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  late TextEditingController fullNameController;
  late TextEditingController slackUsernameController;
  late TextEditingController githubHandleController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();

    // Initialize the text controllers with the existing details.
    fullNameController =
        TextEditingController(text: widget.userDetails.fullName);
    slackUsernameController =
        TextEditingController(text: widget.userDetails.slackUsername);
    githubHandleController =
        TextEditingController(text: widget.userDetails.githubHandle);
    bioController = TextEditingController(text: widget.userDetails.bio);
  }

  @override
  void dispose() {
    // Dispose of the controllers to prevent memory leaks.
    fullNameController.dispose();
    slackUsernameController.dispose();
    githubHandleController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextFormField(
              controller: slackUsernameController,
              decoration: InputDecoration(labelText: 'Slack Username'),
            ),
            TextFormField(
              controller: githubHandleController,
              decoration: InputDecoration(labelText: 'GitHub Handle'),
            ),
            TextFormField(
              controller: bioController,
              decoration: InputDecoration(labelText: 'Brief Bio'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the edited details.
                final updatedUserDetails = UserDetails(
                  fullName: fullNameController.text,
                  slackUsername: slackUsernameController.text,
                  githubHandle: githubHandleController.text,
                  bio: bioController.text,
                );

                // Update the details on the home screen by calling the callback function.
                widget.onUpdate(updatedUserDetails);

                // Return the updated details to the home screen using Navigator.pop.
                Navigator.pop(context, updatedUserDetails);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  String fullName;
  String slackUsername;
  String githubHandle;
  String bio;

  UserDetails({
    required this.fullName,
    required this.slackUsername,
    required this.githubHandle,
    required this.bio,
  });
}