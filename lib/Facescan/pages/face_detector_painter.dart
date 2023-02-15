
import 'dart:ui';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/coordinates_translator.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.faces, this.absoluteImageSize, this.rotation);

  final List<Face> faces;
  final Size absoluteImageSize;
  final InputImageRotation rotation;

  // @override
  // void paint(Canvas canvas, Size size) {
  //   final Paint paint = Paint()
  //     ..style = PaintingStyle.stroke
  //     ..strokeWidth = 1.0
  //     ..color = Colors.red;
  //
  //   for (final Face face in faces) {
  //     canvas.drawRect(
  //       Rect.fromLTRB(
  //         translateX(face.boundingBox.left, rotation, size, absoluteImageSize),
  //         translateY(face.boundingBox.top, rotation, size, absoluteImageSize),
  //         translateX(face.boundingBox.right, rotation, size, absoluteImageSize),
  //         translateY(face.boundingBox.bottom, rotation, size, absoluteImageSize),
  //       ),
  //       paint,
  //     );
  //
  //     void paintContour(FaceContourType type) {
  //        FaceContour? faceContour= face.getContour(type);
  //       // List<Offset>? faceContour = face.getContour(type)?.positionsList;
  //       print("working1");
  //       // if (faceContour != null) {
  //         for (final Offset point in faceContour!.positionsList) {
  //           print("working");
  //           canvas.drawCircle(
  //               Offset(
  //                 translateX(
  //                     point.dx.toDouble(), rotation, size, absoluteImageSize),
  //                 translateY(
  //                     point.dy.toDouble(), rotation, size, absoluteImageSize),
  //               ),
  //               1,
  //               paint);
  //         // }
  //       }
  //     }
  //
  //     paintContour(FaceContourType.face);
  //     paintContour(FaceContourType.leftEyebrowTop);
  //     paintContour(FaceContourType.leftEyebrowBottom);
  //     paintContour(FaceContourType.rightEyebrowTop);
  //     paintContour(FaceContourType.rightEyebrowBottom);
  //     paintContour(FaceContourType.leftEye);
  //     paintContour(FaceContourType.rightEye);
  //     paintContour(FaceContourType.upperLipTop);
  //     paintContour(FaceContourType.upperLipBottom);
  //     paintContour(FaceContourType.lowerLipTop);
  //     paintContour(FaceContourType.lowerLipBottom);
  //     paintContour(FaceContourType.noseBridge);
  //     paintContour(FaceContourType.noseBottom);
  //     paintContour(FaceContourType.leftCheek);
  //     paintContour(FaceContourType.rightCheek);
  //   }
  // }
  //
  // @override
  // bool shouldRepaint(FaceDetectorPainter oldDelegate) {
  //   return oldDelegate.absoluteImageSize != absoluteImageSize ||
  //       oldDelegate.faces != faces;
  // }

  @override
  void paint(Canvas canvas, Size size) {
    for (Face face in faces) {
      canvas.drawRect(
        face.boundingBox,
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
      );

      // Draw the contour points for the face
      FaceContour? contour = face.getContour(FaceContourType.face);
      List<Offset> points = contour!.positionsList;
      canvas.drawPoints(
        PointMode.points,
        points,
        Paint()
          ..color = Colors.green
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}