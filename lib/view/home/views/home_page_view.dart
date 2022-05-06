import 'package:camera/camera.dart';
import 'package:camera_tutorial/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController controller;
  final CameraDescription camera = cameras.first;
  late Future _initializeFutureController;

  @override
  void initState() {
    super.initState();
    controller = CameraController(camera, ResolutionPreset.max);
    _initializeFutureController = controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeFutureController,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(controller);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              await _initializeFutureController;
              final image = await controller.takePicture();
              await Navigator.pushNamed(context, "/second",
                  arguments: image.path);
            } catch (e) {
              print("Error: $e");
            }
          },
          child: const Icon(Icons.camera_alt_rounded),
        ));
      
  }
}
