import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psc_app/screens/cee_screens/cee_discussion_screen.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CeeDiscussionScreen(
      roomId: 'room1',
      currentUserId: FirebaseAuth.instance.currentUser!.uid,
    );
  }
}
