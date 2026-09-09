// lib/presentation/viewmodels/recommendation/recommendation_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_recommendations_usecase.dart';
import 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final GetRecommendationsUseCase getRecommendationsUseCase;

  RecommendationCubit(this.getRecommendationsUseCase)
      : super(RecommendationInitial());

  Future<void> loadRecommendations(String userId, {int maxResults = 10}) async {
    emit(RecommendationLoading());

    final result = await getRecommendationsUseCase(
      userId: userId,
      maxResults: maxResults,
    );

    result.fold(
      (failure) => emit(RecommendationError(failure.toString())),
      (products) {
        if (products.isEmpty) {
          emit(RecommendationEmpty());
        } else {
          final paretoFrontN =
              products.where((p) => p.isParetoFront).length;
          emit(RecommendationLoaded(products, paretoFrontN: paretoFrontN));
        }
      },
    );
  }
}
