// lib/domain/usecases/get_recommendations_usecase.dart
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/recommended_product_entity.dart';
import '../repositories/recommendation_repository.dart';

class GetRecommendationsUseCase {
  final RecommendationRepository repository;

  GetRecommendationsUseCase(this.repository);

  Future<Either<Failure, List<RecommendedProductEntity>>> call({
    required String userId,
    int maxResults = 10,
  }) {
    return repository.getRecommendations(
      userId: userId,
      maxResults: maxResults,
    );
  }
}
