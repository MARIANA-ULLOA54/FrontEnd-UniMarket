// lib/data/models/recommended_product_model.dart
//
// Mapea 1:1 el dict que produce RankedProduct.to_dict() en el backend:
// {
//   "product_id": ..., "name": ..., "category": ..., "price": ...,
//   "stock": ..., "status": ..., "relevance": ..., "pareto_rank": ...,
//   "pareto_front": ...
// }
import '../../domain/entities/recommended_product_entity.dart';

class RecommendedProductModel {
  final String productId;
  final String name;
  final String category;
  final double price;
  final int stock;
  final String status;
  final double relevance;
  final int paretoRank;
  final bool paretoFront;

  RecommendedProductModel({
    required this.productId,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.status,
    required this.relevance,
    required this.paretoRank,
    required this.paretoFront,
  });

  factory RecommendedProductModel.fromJson(Map<String, dynamic> json) {
    return RecommendedProductModel(
      productId: json['product_id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      status: json['status'] as String,
      relevance: (json['relevance'] as num).toDouble(),
      paretoRank: json['pareto_rank'] as int,
      paretoFront: json['pareto_front'] as bool,
    );
  }

  RecommendedProductEntity toEntity() {
    return RecommendedProductEntity(
      productId: productId,
      name: name,
      category: category,
      price: price,
      stock: stock,
      status: status,
      relevanceScore: relevance,
      paretoRank: paretoRank,
      isParetoFront: paretoFront,
    );
  }
}

/// Mapea la respuesta completa del endpoint
/// (schemas.RecommendationResponse: user_id, count, products, pareto_front_n).
class RecommendationResponseModel {
  final String userId;
  final int count;
  final List<RecommendedProductModel> products;
  final int paretoFrontN;

  RecommendationResponseModel({
    required this.userId,
    required this.count,
    required this.products,
    required this.paretoFrontN,
  });

  factory RecommendationResponseModel.fromJson(Map<String, dynamic> json) {
    return RecommendationResponseModel(
      userId: json['user_id'] as String,
      count: json['count'] as int,
      products: (json['products'] as List)
          .map((e) => RecommendedProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paretoFrontN: json['pareto_front_n'] as int,
    );
  }
}
