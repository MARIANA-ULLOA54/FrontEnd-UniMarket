// lib/presentation/viewmodels/recommendation/recommendation_state.dart
import '../../../domain/entities/recommended_product_entity.dart';

abstract class RecommendationState {
  const RecommendationState();
}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationLoaded extends RecommendationState {
  final List<RecommendedProductEntity> products;
  final int paretoFrontN;

  const RecommendationLoaded(this.products, {this.paretoFrontN = 0});
}

class RecommendationEmpty extends RecommendationState {}

class RecommendationError extends RecommendationState {
  final String message;

  const RecommendationError(this.message);
}
