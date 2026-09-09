// lib/domain/repositories/recommendation_repository.dart
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/recommended_product_entity.dart';

abstract class RecommendationRepository {
  /// Recomendaciones personalizadas para [userId], equivalente a
  /// GET /api/v1/recommendations/{user_id}?max_results=... en el backend.
  Future<Either<Failure, List<RecommendedProductEntity>>> getRecommendations({
    required String userId,
    int maxResults = 10,
  });
}
