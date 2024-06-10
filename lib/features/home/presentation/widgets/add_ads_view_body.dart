import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ruaa_task/core/widgets/loading_manger.dart';
import 'package:ruaa_task/features/home/presentation/manger/cubit/ads_cubit.dart';
// Widgets
import '../../../../core/widgets/custom_btn.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
// Utils (validator)
import '../../../../core/utils/my_validators.dart';
// Models
import '../../data/models/ads_model/ads_model.dart';

class AddAdsViewBody extends StatefulWidget {
  const AddAdsViewBody({super.key});

  @override
  State<AddAdsViewBody> createState() => _AddAdsViewBodyState();
}

class _AddAdsViewBodyState extends State<AddAdsViewBody> {
  TextEditingController? _nameTextEditingController,
      _descTextEditingController,
      _priceTextEditingController;
  FocusNode? _nameFocusNode, _descFocusNode, _priceFocusNode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  late String imagePath;
  bool isLoading = false;

  @override
  void initState() {
    _nameTextEditingController = TextEditingController();
    _descTextEditingController = TextEditingController();
    _priceTextEditingController = TextEditingController();

    _nameFocusNode = FocusNode();
    _descFocusNode = FocusNode();
    _priceFocusNode = FocusNode();

    super.initState();
  }

  Future<void> addAd({required String imagePath}) async {
    var isValid = _formKey.currentState!.validate();
    if (isValid) {
      log('is Vailed');
      context.read<AdsCubit>().addAds(
              item: AdsModel(
            name: _nameTextEditingController!.text,
            desc: _descTextEditingController!.text,
            price: _priceTextEditingController!.text,
            createdAt: DateTime.now().toString(),
            firstImage: imagePath,
          ));
    }
  }

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
      log('Picked image path: $imagePath');
    } else {
      log('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdsCubit, AdsState>(
      listener: (context, state) {
        if (state is AddAdsLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is AddAdsSuccess) {
          setState(() {
            isLoading = false;
          });
          context.pushReplacement('/');
          customSnackBar(context, 'Success Create Ad');
        } else if (state is AddAdsFailure) {
          setState(() {
            isLoading = false;
          });
          customSnackBar(context, state.errMessage);
        }
      },
      child: LoadingManger(
        isLoading: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hint: 'Enter name',
                  controller: _nameTextEditingController,
                  focusNode: _nameFocusNode,
                  validator: (value) {
                    return MyValidators.displayNamevalidator(
                      value,
                      context,
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hint: 'Enter Description',
                  controller: _descTextEditingController,
                  focusNode: _descFocusNode,
                  validator: (value) {
                    return MyValidators.displayNamevalidator(
                      value,
                      context,
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hint: 'Enter Price',
                  controller: _priceTextEditingController,
                  focusNode: _priceFocusNode,
                  validator: (value) {
                    return MyValidators.displayNamevalidator(
                      value,
                      context,
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('select Images'),
                      ElevatedButton(
                          onPressed: pickImage,
                          child: const Text('choose file.')),
                    ],
                  ),
                ),
                const Spacer(),
                CustomBtn(
                  text: 'Add',
                  width: double.infinity,
                  height: 50,
                  onTap: () {
                    addAd(imagePath: imagePath);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
