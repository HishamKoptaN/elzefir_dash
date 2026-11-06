import 'package:alzefr_dash/core/widgets/forms/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/feedback/app_snackbar.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../blocs/bloc/products_bloc.dart';
import '../blocs/product_upsert_bloc/product_upsert_bloc.dart';

class UpsertProductView extends StatefulWidget {
  const UpsertProductView({super.key, required this.product});
  static const String routeName = "upsert";
  final ProductEntity? product;
  @override
  State<UpsertProductView> createState() => _UpsertProductViewState();
}

class _UpsertProductViewState extends State<UpsertProductView> {
  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      getIt<ProductUpsertBloc>().add(
        .dataChanged(
          productUpsertReq: ProductUpsertReqEntity(
            id: widget.product?.id,
            imageUrl: .dirty(value: widget.product?.image ?? ''),
            name: .dirty(value: widget.product?.name ?? ''),
            title: .dirty(value: widget.product?.title ?? ''),
            description: .dirty(value: widget.product?.description ?? ''),
            price: .dirty(value: widget.product?.price ?? ''),
            categoryId: .dirty(
              value: widget.product?.category.id.toString() ?? '',
            ),
            // enabled: widget.product.enabled,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductUpsertBloc, ProductUpsertState>(
      bloc: getIt<ProductUpsertBloc>(),
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            // The list is cached in a singleton bloc, so pull it again to show
            // the image that was just uploaded.
            getIt<ProductsBloc>().add(ProductsEvent.get());
            context.pop();
          },
          failure: (errorInfo) {
            final message = errorInfo.message.trim().isEmpty
                ? 'تعذّر حفظ المنتج'
                : errorInfo.message.trim();
            context.showErrorSnackBar(title: 'خطأ', message: message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return SingleChildScrollView(
              child: Column(
                spacing: 4.h,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: SizedBox(
                          height: 240.h,
                          width: .infinity,
                          child: CustomImage(
                            image:
                                state
                                    .productUpsertReq
                                    ?.imageFile
                                    ?.value
                                    ?.path ??
                                state.productUpsertReq?.imageUrl?.value ??
                                '',
                            fit: .cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        right: 10.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            color: Colors.black,
                            onPressed: () async {
                              final XFile? image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                getIt<ProductUpsertBloc>().add(
                                  ProductUpsertEvent.dataChanged(
                                    productUpsertReq: state.productUpsertReq!
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
                    initialValue: state.productUpsertReq?.name?.value,
                    onChanged: (value) {
                      getIt<ProductUpsertBloc>().add(
                        .dataChanged(
                          productUpsertReq: state.productUpsertReq!.copyWith(
                            name: .dirty(value: value),
                          ),
                        ),
                      );
                    },
                  ),
                  CustomTextFormField(
                    width: .infinity,
                    initialValue: state.productUpsertReq?.title?.value,
                    onChanged: (value) {
                      getIt<ProductUpsertBloc>().add(
                        ProductUpsertEvent.dataChanged(
                          productUpsertReq: state.productUpsertReq!.copyWith(
                            title: GenericFormInput.dirty(value: value),
                          ),
                        ),
                      );
                    },
                  ),
                  CustomTextFormField(
                    width: .infinity,
                    initialValue: state.productUpsertReq?.description?.value,
                    onChanged: (value) {
                      getIt<ProductUpsertBloc>().add(
                        ProductUpsertEvent.dataChanged(
                          productUpsertReq: state.productUpsertReq!.copyWith(
                            description: GenericFormInput.dirty(value: value),
                          ),
                        ),
                      );
                    },
                  ),
                  CustomTextFormField(
                    width: .infinity,
                    initialValue: state.productUpsertReq?.price?.value,
                    onChanged: (v) {
                      getIt<ProductUpsertBloc>().add(
                        ProductUpsertEvent.dataChanged(
                          productUpsertReq: state.productUpsertReq!.copyWith(
                            price: GenericFormInput.dirty(value: v),
                          ),
                        ),
                      );
                    },
                  ),
                  FilledButton(
                    onPressed: () {
                      getIt<ProductUpsertBloc>().add(
                        const ProductUpsertEvent.upsert(),
                      );
                    },
                    child: state.formzSubmissionStatus.isInProgress
                        ? const CircularProgressIndicator()
                        : const Text('حفظ'),
                  ),
                ],
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
