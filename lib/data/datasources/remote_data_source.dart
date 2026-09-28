// lib/data/datasources/recommendation_remote_data_source.dart
import 'package:dio/dio.dart';

import '../models/recommended_product_model.dart';

abstract class RecommendationRemoteDataSource {
  Future<RecommendationResponseModel> getRecommendations({
    required String userId,
    int maxResults = 10,
  });
}

class RecommendationRemoteDataSourceImpl implements RecommendationRemoteDataSource {
  final Dio dio;

  RecommendationRemoteDataSourceImpl({required this.dio});

  @override
  Future<RecommendationResponseModel> getRecommendations({
    required String userId,
    int maxResults = 10,
  }) async {
    try {
      // Dio.baseUrl ya debe incluir el prefijo /api/v1 (ver AppConstants).
      // Ruta real en el backend: GET /api/v1/recommendations/{user_id}
      final response = await dio.get(
        '/recommendations/$userId',
        queryParameters: {'max_results': maxResults},
      );
      return RecommendationResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw Exception('Error fetching recommendations: ${e.message}');
    }
  }
}