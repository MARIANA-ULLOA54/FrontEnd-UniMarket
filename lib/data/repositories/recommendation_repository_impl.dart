// lib/data/repositories/recommendation_repository_impl.dart
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/recommended_product_entity.dart';
import '../../domain/repositories/recommendation_repository.dart';
import '../datasources/recommendation_remote_data_source.dart';

class RecommendationRepositoryImpl implements RecommendationRepository {
  final RecommendationRemoteDataSource remoteDataSource;

  RecommendationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<RecommendedProductEntity>>> getRecommendations({
    required String userId,
    int maxResults = 10,
  }) async {
    try {
      final response = await remoteDataSource.getRecommendations(
        userId: userId,
        maxResults: maxResults,
      );
      final entities = response.products.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure('Error al obtener recomendaciones: $e'));
    }
  }
}
