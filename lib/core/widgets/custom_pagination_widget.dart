import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/entities/meta_entity.dart';
import '../theme/app_colors.dart';
import '../utils/device_helper.dart';

class CustomPaginationWidget<T extends BlocBase> extends StatelessWidget {
  const CustomPaginationWidget({
    super.key,
    required this.meta,
    required this.onPageChanged,
    this.currentPage,
  });

  final MetaEntity meta;
  final Function(int page) onPageChanged;
  final int? currentPage;

  @override
  Widget build(BuildContext context) {
    final activePage = currentPage ?? meta.currentPage ?? 0;
    final sized = AppResponsive.responsive(
      context,
      mobile: 110.w,
      tablet: 40.w,
      desktop: 40.w,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: activePage > 1 ? () => onPageChanged(activePage - 1) : null,
          child: Container(
            width: sized,
            height: sized,
            decoration: BoxDecoration(
              color: activePage > 1 ? LightColors().primary : Colors.grey,
              border: Border.all(color: LightColors().primary),
            ),
            child: Center(
              child: Icon(Icons.arrow_back, size: 24.w, color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        ...List.generate(
          (meta.totalPages ?? 0) > 5 ? 5 : (meta.totalPages ?? 0),
          (index) {
            int pageNum;
            if ((meta.totalPages ?? 0) <= 5) {
              pageNum = index + 1;
            } else {
              int startPage = (activePage - 2).clamp(
                1,
                (meta.totalPages ?? 0) - 4,
              );
              pageNum = startPage + index;
            }
            bool isActive = pageNum == activePage;
            return Padding(
              padding: EdgeInsets.only(left: index > 0 ? 10.w : 0),
              child: GestureDetector(
                onTap: () {
                  onPageChanged(pageNum);
                },
                child: SizedBox.square(
                  child: Container(
                    width: sized,
                    height: sized,
                    decoration: BoxDecoration(
                      color: isActive
                          ? LightColors().primary
                          : Colors.transparent,
                      border: Border.all(
                        color: isActive
                            ? LightColors().primary
                            : const Color(0xFFECE7E2),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        pageNum.toString(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: isActive
                              ? Colors.white
                              : const Color(0xFF878680),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: activePage < (meta.totalPages ?? 0)
              ? () => onPageChanged(activePage + 1)
              : null,
          child: Container(
            width: sized,
            height: sized,
            decoration: BoxDecoration(
              color: activePage < (meta.totalPages ?? 0)
                  ? LightColors().primary
                  : Colors.grey,
              border: Border.all(color: LightColors().primary),
            ),
            child: Center(
              child: Icon(Icons.arrow_forward, size: 24.w, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
