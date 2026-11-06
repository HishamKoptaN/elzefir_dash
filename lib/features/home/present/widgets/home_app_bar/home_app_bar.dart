import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/device_helper.dart';
import '../../../../../core/utils/extensions/device_type_extension.dart';
import '../../../../../core/utils/extensions/responsive_icon_extension .dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/feedback/empty_widget.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../notifications/domain/entities/notification_entity.dart';
import '../../../../notifications/present/bloc/notifications_bloc.dart';
import '../../../../notifications/present/view/widgets/notification_item.dart';

class RestaurantAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RestaurantAppBar({
    super.key,
    this.count = 0,
    required this.onHome,
    required this.onMenu,
    required this.onAbout,
    required this.onContact,
  });

  final VoidCallback onHome;
  final VoidCallback onMenu;
  final VoidCallback onAbout;
  final VoidCallback onContact;
  static const Color primary = Color(0xFF0F3A75);
  final int count;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 140.h,
      titleSpacing: 16.w,
      centerTitle: true,
      title: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        textBaseline: .ideographic,
        spacing: 10.w,
        children: [
          Text(
            "إلادارة",
            style: context.textTheme.displayLarge?.copyWith(
              color: Color(0xFF002B49),
            ),
          ),
        ],
      ),
      actions: [
        BlocBuilder<NotificationsBloc, NotificationsState>(
          bloc: getIt<NotificationsBloc>(),
          builder: (context, state) {
            return state.maybeMap(
              loaded: (state) {
                final GlobalKey _iconKey = GlobalKey();
                return Skeletonizer(
                  enabled: false,
                  effect: ShimmerEffect(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    duration: const Duration(seconds: 1),
                  ),
                  child: BadgeTheme(
                    data: BadgeThemeData(
                      smallSize: 2,
                      largeSize: 2,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    ),
                    child: Badge(
                      isLabelVisible: (state.unreadCount ?? 0) > 0,
                      label: Text(
                        '${state.unreadCount}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      backgroundColor: Colors.red,
                      largeSize: 2,
                      child: IconButton(
                        key: _iconKey,
                        icon: Icon(
                          (state.unreadCount ?? 0) > 0
                              ? Icons.notifications_active
                              : Icons.notifications,
                          size: 20.iconRes,
                          color: context.colorScheme.primary,
                        ),
                        onPressed: () {
                          final RenderBox renderBox =
                              _iconKey.currentContext!.findRenderObject()
                                  as RenderBox;
                          final Offset position = renderBox.localToGlobal(
                            Offset.zero,
                          );
                          showNotificationOverlay(
                            context: context,
                            iconPosition: position,
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              initial: (state) {
                return const SizedBox.shrink();
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(72);
  }

  void showNotificationOverlay({
    required BuildContext context,
    required Offset iconPosition,
  }) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(color: Colors.transparent),
            ),
            Positioned(
              top: iconPosition.dy + 75.h,
              left: 20.w,
              width: context.isDesk ? 450.w : 1700.w,
              child: Material(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 100.h,
                    maxHeight: 900.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.1),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildNotificationHeader(context),
                          BlocBuilder<NotificationsBloc, NotificationsState>(
                            bloc: getIt<NotificationsBloc>(),
                            builder: (context, state) {
                              return state.maybeMap(
                                loaded: (state) {
                                  return state.notifications?.isEmpty ?? false
                                      ? EmptyWidget(
                                          icon: Icons.notifications,
                                          text: "لا توجد إشعارات",
                                        )
                                      : SingleChildScrollView(
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount:
                                                state.notifications?.length ??
                                                0,
                                            separatorBuilder: (context, i) {
                                              return Gap(10.h);
                                            },
                                            itemBuilder: (ctx, i) {
                                              return NotificationItem(
                                                notification:
                                                    state.notifications?[i] ??
                                                    const NotificationEntity(
                                                      id: '',
                                                    ),
                                              );
                                            },
                                          ),
                                        );
                                },
                                loading: (s) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                orElse: () {
                                  return SizedBox();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }

  Widget _buildNotificationHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الإشعارات",
            textAlign: .start,
            style: TextStyle(
              color: context.colorScheme.primary,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final active = hovering;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 8.0.w),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active
                    ? context.colorScheme.primary
                    : context.colorScheme.primary.withValues(alpha: 0.5),
                width: active ? 5.h : 2.0.h,
              ),
            ),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 180),
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: .bold,
              color: context.colorScheme.primary,
            ),
            child: Text(
              widget.title,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: .bold,
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
