import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';
import '../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../../core/widgets/feedback/error_content_widget.dart';
import '../controller/site_content_controller.dart';
import 'widgets/site_content_form.dart';

/// شاشة تحرير نصوص الصفحة الرئيسية للموقع العام.
class SiteContentView extends StatefulWidget {
  const SiteContentView({super.key});
  static const String routeName = 'site-content';

  @override
  State<SiteContentView> createState() => _SiteContentViewState();
}

class _SiteContentViewState extends State<SiteContentView> {
  final SiteContentController _controller = SiteContentController();

  @override
  void initState() {
    super.initState();
    _controller.load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final saved = await _controller.save();
    if (!mounted) return;
    if (saved) {
      context.showSuccessSnackBar(
        title: 'تم الحفظ',
        message: 'سيظهر التعديل على الموقع مباشرة',
      );
    } else {
      context.showErrorSnackBar(
        title: 'خطأ',
        message: 'تعذّر حفظ نصوص الموقع، حاول مرة أخرى',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        if (_controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (_controller.error != null) {
          return CustomErrorWidget(
            message: 'تعذّر تحميل نصوص الموقع',
            onRetry: _controller.load,
          );
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: .all(16.r),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: SiteContentForm(controller: _controller),
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                padding: .fromLTRB(16.w, 10.h, 16.w, 12.h),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  border: Border(top: BorderSide(color: context.colorScheme.outline)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _controller.canSave ? _save : null,
                        icon: const Icon(Icons.save_outlined),
                        label: Text(
                          _controller.isSaving ? 'جارٍ الحفظ...' : 'حفظ النصوص',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
