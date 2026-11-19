import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_currency.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/utils/format_currency.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.price,
    this.prefix = '',
    this.currency = appCurrency,
  });

  final String price;

  /// Shown before the amount, e.g. «يبدأ من».
  final String prefix;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .baseline,
      textBaseline: .alphabetic,
      children: [
        Flexible(
          child: Text(
            '$prefix${formatCurrency(value: price)}',
            maxLines: 1,
            overflow: .ellipsis,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        SizedBox(width: 4.w),
        // Flexible so a squeezed price shrinks instead of overflowing the bar.
        Flexible(
          child: Text(
            currency,
            maxLines: 1,
            overflow: .ellipsis,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}
