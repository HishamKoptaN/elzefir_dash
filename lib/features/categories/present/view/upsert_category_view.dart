import 'package:alzefr_dash/core/widgets/forms/custom_text_form_field.dart';
import 'package:alzefr_dash/features/categories/domain/entities/categories_res_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../domain/entities/category_upsert_req_entity.dart';
import '../blocs/category_upsert_bloc/category_upsert_bloc.dart';

class UpsertCategoryView extends StatefulWidget {
  const UpsertCategoryView({super.key, required this.category});
  static const String routeName = "upsert";
  final CategoryEntity? category;
  @override
  State<UpsertCategoryView> createState() => _UpsertCategoryViewState();
}

class _UpsertCategoryViewState extends State<UpsertCategoryView> {
  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      getIt<CategoryUpsertBloc>().add(
        CategoryUpsertEvent.dataChanged(
          categoryUpsertReq: CategoryUpsertReqEntity(
            id: widget.category?.id,
            imageUrl: .dirty(value: widget.category?.image ?? ''),
            name: .dirty(value: widget.category?.name ?? ''),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryUpsertBloc, CategoryUpsertState>(
      bloc: getIt<CategoryUpsertBloc>(),
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            context.pop();
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 14.h,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          child: SizedBox(
                            height: 280.h,
                            width: double.infinity,
                            child: CustomImage(
                              image:
                                  state
                                      .categoryUpsertReq
                                      ?.imageFile
                                      ?.value
                                      ?.path ??
                                  state.categoryUpsertReq?.imageUrl?.value ??
                                  '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20.h,
                          right: 60.w,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              color: Colors.black,
                              onPressed: () async {
                                final XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (image != null) {
                                  getIt<CategoryUpsertBloc>().add(
                                    CategoryUpsertEvent.dataChanged(
                                      categoryUpsertReq: state
                                          .categoryUpsertReq!
                                          .copyWith(
                                            // Keep the picked file itself: its
                                            // name and mime type are what the
                                            // upload link is generated from.
                                            imageFile: XFileFormInput.dirty(
                                              image,
                                            ),
                                          ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    // CustomDropDown
                    CustomTextFormField(
                      width: .infinity,
                      initialValue: state.categoryUpsertReq?.name?.value,
                      onChanged: (value) {
                        getIt<CategoryUpsertBloc>().add(
                          CategoryUpsertEvent.dataChanged(
                            categoryUpsertReq: state.categoryUpsertReq!
                                .copyWith(
                                  name: GenericFormInput.dirty(value: value),
                                ),
                          ),
                        );
                      },
                    ),
                    FilledButton(
                      onPressed: () {
                        getIt<CategoryUpsertBloc>().add(
                          const CategoryUpsertEvent.upsert(),
                        );
                      },
                      child: state.formzSubmissionStatus.isInProgress
                          ? const CircularProgressIndicator()
                          : const Text('حفظ'),
                    ),
                  ],
                ),
              ),
            );
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
