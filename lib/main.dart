import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/CustomListTile.dart';
import 'package:flutter_app/WidgetsList.dart';
import 'package:flutter_app/CellListTile.dart';
import 'package:flutter_app/ExpansionTile.dart';
import 'package:flutter_app/CustomListTile.dart';
import 'package:flutter_app/BlocDemo.dart';
import 'package:flutter_app/GestureDemo.dart';
import 'package:flutter_app/StateManagement.dart';
import 'package:flutter_app/APIDemo.dart';
import 'package:flutter_app/MapDemo.dart';
import 'package:flutter_app/CameraDemo.dart';
import 'package:flutter_app/CupertinoDemo.dart';
import 'package:flutter_app/SQLiteDemo.dart';

Future<void> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

//Future<void> main() async {
//  // Obtain a list of the available cameras on the device.
//  final cameras = await availableCameras();
//
//  // Get a specific camera from the list of available cameras.
//  final firstCamera = cameras.first;
//
//  runApp(
//    MaterialApp(
//      theme: ThemeData.dark(),
//      home: TakePictureScreen(
//        // Pass the appropriate camera to the TakePictureScreen widget.
//        camera: firstCamera,
//      ),
//    ),
//  );
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Fultter Demo";

    final array = ["Widgets", "Cell List Tile", "Expansion tile", "Custom list", "Bloc Architecture",
      "Gesture", "State Management", "API and JSON Demo", "MAP Demo", "Cupertino Demo", "SQLite Demo",
      "Parse Data to Widgets"];

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: array.length,
            itemBuilder: (context, index){
          return ListTile(
            title: Text(array[index]),
            onTap: () {
              if(index == 0){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WidgetsList()
                    )
                );
              }
              else if(index == 1){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CellListTile()
                    )
                );
              }
              else if(index == 2){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpansionListTile()
                    )
                );
              }
              else if(index == 3){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomListTile()
                    )
                );
              }
              else if(index == 4){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocDemo()
                    )
                );
              }
              else if(index == 5){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GesturePage()
                    )
                );
              }
              else if(index == 6){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StateManagementDemo()
                    )
                );
              }
              else if(index == 7){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => APIPage()
                    )
                );
              }
              else if(index == 8){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapDemo()
                    )
                );
              }
              else if(index == 9){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CupertinoDemo()
                    )
                );
              }
              else if(index == 10){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SQLiteDemo()
                    )
                );
              }
              else if(index == 11){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SQLiteDemo()
                    )
                );
              }
            },
          );
        })
      ),
    );
  }
}






// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the
            // pattern package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);

            // If the picture was taken, display it on a new screen.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}