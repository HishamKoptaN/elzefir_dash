import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomTabsWidget extends StatefulWidget {
  const CustomTabsWidget({
    super.key,
    required this.tabs,
    this.otherWidgets,
    required this.tabWidgets,
    this.tabSpecificWidgets,
  });
  final List<CustomTabEntity> tabs;
  final List<Widget>? otherWidgets;
  final List<Widget> tabWidgets;
  final List<List<Widget>>? tabSpecificWidgets;

  @override
  State<CustomTabsWidget> createState() => _CustomTabsWidgetState();
}

class _CustomTabsWidgetState extends State<CustomTabsWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDivider(),
              Gap(10.h),
              _buildTabsRow(),
              _buildDivider(),
            ],
          ),
        ),
        Gap(40.h),
        Container(
          margin: EdgeInsets.only(right: 25.w, left: 25.w, bottom: 25.h),
          child: widget.tabWidgets[_selectedIndex],
        ),
      ],
    );
  }

  Widget _buildTabsRow() {
    return SizedBox(
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 15.w,
              children: widget.tabs.asMap().entries.map((entry) {
                final index = entry.key;
                final tab = entry.value;
                final isSelected = index == _selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: index == 0 ? 0 : 24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              tab.icon,
                              size: 24.w,
                              color: isSelected
                                  ? const Color(0xFF003A46)
                                  : const Color(0xFF9F9F9F),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              tab.title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: isSelected
                                    ? const Color(0xFF003A46)
                                    : const Color(0xFF9F9F9F),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Gap(15.h),
                        if (isSelected)
                          Align(
                            child: Container(
                              width: 154.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFF003A46),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            if (widget.tabSpecificWidgets != null &&
                _selectedIndex < widget.tabSpecificWidgets!.length &&
                widget.tabSpecificWidgets![_selectedIndex].isNotEmpty)
              Row(
                children: widget.tabSpecificWidgets![_selectedIndex],
              )
            else if (widget.otherWidgets != null)
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.otherWidgets!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1.h,
      color: const Color(0xFFDBDBDB),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, -1),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabEntity {
  final String title;
  final IconData? icon;
  CustomTabEntity({required this.title, this.icon});
}
