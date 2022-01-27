import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/constants/errors.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Init .env variables, Hive, and Stripe. Should throw error if critical
/// environment variables are missing.
Future<void> initTasks() async {
  try {
    final List<String> vars = ['STRIPE_PUBLISHABLE_KEY', 'GRPC_HOST'];
    await dotenv.load(fileName: '.env');

    if (!dotenv.isEveryDefined(vars)) {
      throw ErrorMessage.missingEnv;
    }

    Stripe.publishableKey = dotenv.get('STRIPE_PUBLISHABLE_KEY');
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';

    await Stripe.instance.applySettings();
    await Hive.initFlutter();
    await Hive.openBox('doge');
  } catch (error) {
    rethrow;
  }
}
