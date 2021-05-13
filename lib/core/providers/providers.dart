import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youplanner/services/services.dart';

// final analyticsProvider = Provider((ref) => FirebaseAnalytics());
// final pnProvider = Provider((ref) => PushNotificationService());

final userRepoProvider = ChangeNotifierProvider<AuthServices>((ref) {
  // final notifService = ref.watch(pnProvider);
  // return AuthServices.instance(notifService);
});
// final configProvider = Provider<AppConfig>((ref) => AppConfig(
//   appTitle: AppConstants.appName,
//   buildFlavor: AppFlavor.prod,
// ));
