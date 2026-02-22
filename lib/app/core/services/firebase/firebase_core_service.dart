import 'package:firebase_core/firebase_core.dart';
import 'package:psc_app/firebase_options.dart';

class FirebaseCoreService {
  static Future<void> init()async{
    
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );


  }
}