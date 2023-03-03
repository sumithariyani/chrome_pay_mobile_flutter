import 'package:camera/camera.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/locator.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/face_detector_painter.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/camera.service.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/face_detector_service.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class CameraDetectionPreview extends StatelessWidget {
  CameraDetectionPreview({Key? key}) : super(key: key);

  final CameraService _cameraService = locator<CameraService>();
  final FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Transform.scale(
      scale: 1.0,
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        child: OverflowBox(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              width: width,
              height: width * 2,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CameraPreview(_cameraService.cameraController!),
                  if (_faceDetectorService.faceDetected)
                    Container(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 150),
                        height: width/1.3,
                        width: width/1.3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.green, width: 2.0)),
                      ),
                    )
                  else
                    Container(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 150),
                        height: width/1.3,
                        width: width/1.3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.red, width: 2.0)),
                      ),
                    ),
                    if (_faceDetectorService.faceDetected)
                    CustomPaint(
                      painter: FaceDetectorPainter(
                          _faceDetectorService.faces,
                          _cameraService.getImageSize(),
                          _cameraService.rotationIntToImageRotation(0)
                      ),
                      // size: Size(200, 200),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}