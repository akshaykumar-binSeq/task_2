import 'package:dartz/dartz.dart';
import 'package:task_2/domain/core/app_failures.dart';

abstract class INotificationRepository {
  Future<Either<AppFailures, dynamic>> registerDeviceNotification(
      String platform);
  Future<bool> sendFCMMessage(String tite, String message);
}
