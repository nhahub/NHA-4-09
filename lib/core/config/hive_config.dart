import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../features/meditations/data/models/article_model_adapter.dart';
import '../../features/meditations/data/models/book_model_adapter.dart';
import '../constants/constants.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Recommended books
    Hive.registerAdapter(BookModelAdapter());
    await Hive.openBox(kRecommendedBooksBox);
    
    // Recommended articles
    Hive.registerAdapter(ArticleModelAdapter());
    await Hive.openBox(kRecommendedArticlesBox);
  }
}
