// lib/domain/entities/recommended_product_entity.dart
//
// Representa un producto tal como lo devuelve el motor de recomendación
// del backend (RankedProduct.to_dict() en services/recommendation.py):
// no es lo mismo que ProductEntity (que usan Products/Home con datos mock),
// porque trae campos propios del ranking: relevancia y posición en el
// frente de Pareto.
import 'package:equatable/equatable.dart';

class RecommendedProductEntity extends Equatable {
  final String productId;
  final String name;
  final String category;
  final double price;
  final int stock;
  final String status; // "new" | "regular"
  final double relevanceScore;
  final int paretoRank;
  final bool isParetoFront;

  const RecommendedProductEntity({
    required this.productId,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.status,
    required this.relevanceScore,
    required this.paretoRank,
    required this.isParetoFront,
  });

  bool get isNew => status == 'new';
  bool get hasStock => stock > 0;

  @override
  List<Object?> get props => [
        productId,
        name,
        category,
        price,
        stock,
        status,
        relevanceScore,
        paretoRank,
        isParetoFront,
      ];
}
