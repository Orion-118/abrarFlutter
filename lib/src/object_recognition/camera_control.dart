import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_cycle/src/utils/snackbars_alerts.dart';

class CameraControl extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraControl({super.key, required this.cameras});

  @override
  State<CameraControl> createState() => _CameraControlState();
}

class _CameraControlState extends State<CameraControl> {
  late CameraController controller;
  late XFile? imageFile;
  int currentCamera = 0;

  @override
  void initState() {
    super.initState();
    controller =
        CameraController(widget.cameras[currentCamera], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((error) {
      if (error is CameraException) {
        _showErrorDialog(context, error.code);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (!controller.value.isInitialized)
            ? Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: const CircularProgressIndicator(),
              )
            : Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CameraPreview(controller),
                  AnimatedPositioned(
                    top: MediaQuery.of(context).size.height / 15,
                    left: MediaQuery.of(context).size.width / 2 - 150,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          returnBackButton(context),
                          const SizedBox(width: 30),
                          const Text(
                            "Scan an object",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Icon(
                            Icons.recycling,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        floatingActionButton: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              returnIconButton(
                  context,
                  const Icon(
                    Icons.collections,
                  )),
              const SizedBox(width: 20),
              returnFloatingActionButton(context),
              const SizedBox(width: 20),
              returnIconButton(
                  context,
                  const Icon(
                    Icons.loop,
                  )),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String errorCode) {
    String message;
    switch (errorCode) {
      case "CameraAccessDenied":
        message = "Access to the camera is denied";
        break;
      case "CameraAccessRestricted":
        message = "Access to the camera is restricted";
        break;
      case "CameraAccessError":
        message = "An error occurred while accessing the camera";
        break;
      case "CameraAccessUnknown":
        message = "An unknown error occurred while accessing the camera";
        break;
      default:
        message = "An error occurred while taking the picture";
        break;
    }

    createQuickAlert(context: context, title: "Camera Error", message: message, type: "error");
  }

  Widget returnBackButton(BuildContext context) {
    return BackButton(
      color: Colors.white,
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          context.go('/home');
        }
      },
    );
  }

  Widget returnIconButton(BuildContext context, Widget icon) {
    return IconButton(
      style: IconButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onError,
        backgroundColor: Colors.white24,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        elevation: 6,
      ),
      onPressed: () {
        setState(() {
          currentCamera = (currentCamera + 1) % widget.cameras.length;
          controller = CameraController(
              widget.cameras[currentCamera], ResolutionPreset.max);
          controller.initialize().then((_) {
            if (!mounted) {
              return;
            }
            setState(() {});
          }).catchError((error) {
            if (error is CameraException) {
              _showErrorDialog(context, error.code);
            }
          });
        });
      },
      icon: icon,
      iconSize: 30,
    );
  }

  Widget returnFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Theme.of(context).colorScheme.onError,
      backgroundColor: Colors.white,
      onPressed: () async {
        try {
          final XFile file = await controller.takePicture();
          setState(() {
            imageFile = file;
          });

          if (context.mounted) {
            context.goNamed("image-preview", pathParameters: {
              "imagePath": imageFile!.path,
            });
          }
        } catch (e) {
          if (context.mounted) {
            _showErrorDialog(context, e.toString());
          }
        }
      },
      child: const Icon(Icons.camera_alt, size: 30, color: Colors.black),
    );
  }
}
