import 'package:flutter/material.dart';

import '../../../../../categories/domain/entities/categories_res_entity.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../products_widget.dart';
import 'products_header.dart';
import 'products_search_field.dart';

import 'package:alzefr_dash/core/widgets/feedback/empty_widget.dart';

class ProductsContent extends StatefulWidget {
  const ProductsContent({
    super.key,
    required this.products,
    required this.categories,
    required this.onAdd,
  });

  final List<ProductEntity> products;
  final List<CategoryEntity> categories;
  final VoidCallback onAdd;

  @override
  State<ProductsContent> createState() {
    return _ProductsContentState();
  }
}

class _ProductsContentState extends State<ProductsContent> {
  String _query = '';

  List<ProductEntity> get _filtered {
    final categories = {for (final c in widget.categories) c.id: c};
    final products = widget.products.map((product) {
      return product.copyWith(
        category: categories[product.category.id] ?? product.category,
      );
    }).toList();
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) {
      return products;
    }
    return products.where((product) {
      return [
        product.title,
        product.name,
        product.description,
        product.category.name,
      ].any((field) {
        return field.toLowerCase().contains(query);
      });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    return Column(
      children: [
        ProductsHeader(count: widget.products.length, onAdd: widget.onAdd),
        if (widget.products.isNotEmpty)
          ProductsSearchField(
            onChanged: (value) {
              setState(() {
                _query = value;
              });
            },
          ),
        Expanded(
          child: widget.products.isEmpty
              ? EmptyWidget(
                  icon: Icons.restaurant_menu_outlined,
                  text: 'لا توجد منتجات بعد',
                  hint: 'أضف أول منتج ليظهر في المنيو الخاص بمطعمك',
                  actionText: 'إضافة منتج',
                  onAction: widget.onAdd,
                )
              : filtered.isEmpty
              ? const EmptyWidget(
                  icon: Icons.search_off_rounded,
                  text: 'لا توجد نتائج لبحثك',
                  hint: 'جرّب كلمة بحث أخرى أو امسح البحث لعرض كل المنتجات',
                )
              : ProductsWidget(products: filtered),
        ),
      ],
    );
  }
}
