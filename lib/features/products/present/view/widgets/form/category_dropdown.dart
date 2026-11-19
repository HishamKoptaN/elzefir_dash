import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:alzefr_dash/core/widgets/forms/labeled_field.dart';
import 'package:alzefr_dash/features/categories/present/blocs/bloc/categories_bloc.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key, required this.value, required this.onChanged});

  final String? value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      label: 'التصنيف',
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: getIt<CategoriesBloc>(),
        builder: (context, state) {
          final categories = state.maybeWhen(
            loaded: (categories, loading) => categories ?? [],
            orElse: () => [],
          );
          final ids = categories.map((c) => c.id.toString()).toSet();
          return DropdownButtonFormField<String>(
            initialValue: ids.contains(value) ? value : null,
            hint: const Text('اختر التصنيف'),
            style: context.textTheme.bodyLarge,
            borderRadius: .circular(12.r),
            items: [
              for (final category in categories)
                DropdownMenuItem(
                  value: category.id.toString(),
                  child: Text(category.name),
                ),
            ],
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
          );
        },
      ),
    );
  }
}