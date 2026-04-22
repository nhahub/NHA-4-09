import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/book_model.dart';

part 'recommended_books_remote_service.g.dart';

@RestApi(baseUrl: ApiConstants.googleBooksBaseUrl)
abstract class RecommendedBooksRemoteService {
  factory RecommendedBooksRemoteService(Dio dio) =
      _RecommendedBooksRemoteService;

  @GET(ApiConstants.getRecommendedBooks)
  Future<BooksResponse> getRecommendedBooks({
    @Path('subject') required String subject,
    @Path('maxResults') required int maxResults,
    @Path('key') required String key,
  });
}
