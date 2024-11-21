import 'package:flutter_dotenv/flutter_dotenv.dart';

const String newApiBaseUrl = 'https://newsapi.org/v2';
final String apiKey = dotenv.get('API_KEY', fallback: '');
const String country = 'us';
const String category = 'general';
