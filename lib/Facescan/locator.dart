
import 'package:chrome_pay_mobile_flutter/Facescan/services/camera.service.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/face_detector_service.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/ml_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator.registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
  locator.registerLazySingleton<MLService>(() => MLService());
}