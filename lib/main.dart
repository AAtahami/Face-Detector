import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'vision_detector_view/face_detector_view.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google ML Kit Demo App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaceDetectorView(),
                  ));
              //FaceDetectorView();
            },
            color: Colors.blue,
            height: 50,
            textColor: Colors.white,
            minWidth: MediaQuery.of(context).size.width,
            child: const Text(
              "Face Detection",
              style: TextStyle(fontSize: 30),
            ),
          ),

          // child: SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     child: Column(
          //       children: [
          //         CustomCard('Face Detection', FaceDetectorView()),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         // ExpansionTile(
          //         //   title: const Text('Natural Language APIs'),
          //         //   children: [
          //         //     CustomCard('Language ID', LanguageIdentifierView()),
          //         //     CustomCard(
          //         //         'On-device Translation', LanguageTranslatorView()),
          //         //     CustomCard('Smart Reply', SmartReplyView()),
          //         //     CustomCard('Entity Extraction', EntityExtractionView()),
          //         //   ],
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
