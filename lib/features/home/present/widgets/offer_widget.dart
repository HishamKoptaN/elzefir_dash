import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';

import 'dart:ui';


class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});
  static const Color primary = Color(0xFF001629);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 450.h,
        width: .infinity,
        child: Stack(
          fit: .expand,
          textDirection: .rtl,
          children: [
            //CustomImage(image: Assets.mock.offer.path, fit: .cover),
            Container(
              padding: const .symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFd87459).withValues(alpha: 0.2),
                borderRadius: .circular(30),
                border: Border.all(
                  color: const Color(0xFFd87459).withValues(alpha: 0.3),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .centerLeft,
                  end: .centerRight,
                  colors: [
                    primary.withValues(alpha: .9),
                    primary.withValues(alpha: .0),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(30.h),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مطعم أسماك الزفر',
                        textAlign: .right,
                        style: context.textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      OpenStatusBadge(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpenStatusBadge extends StatelessWidget {
  const OpenStatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20.w,
            children: [
              Text(
                'مفتوح الآن',
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: .w600,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 26.w,
                height: 26.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
