import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
}

// Padding and spacing constants
const double kAppHorizontalPadding = 26.72;
const double kAppVerticalPadding = 26.72;
const double kAppSectionSpacing = 21.0;

// Local Storage Keys
const String kUserData = "userData";
const String kHasSeenOnboarding = "hasSeenOnboarding";

const String kHasSelectedDailyMood = "hasSelectedDailyMood";
const String kSelectedDailyMood = "selectedDailyMood";

const String kDailyWaterCups = 'daily_water_cups';
const String kLastWaterDate = 'last_water_date';
const int kMaxCups = 8;

// Tables
const String kQuestionnaireAnswersTable = "questionnaire_answers";
const String kMoodTable = "moods";
