import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/edit_profile/edit_profile_bloc.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/core/routes/router.dart';
import 'package:movie_app/presentation/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/presentation/core/widgets/grey_outlined_button.dart';

import '../../application/edit_profile/profile_edit_mode.dart';
import '../../core/di/injectable.dart';

// For Providing Bloc
class EditProfileBottomSheet extends StatelessWidget {
  final ProfileEditMode _mode;

  const EditProfileBottomSheet({super.key, required ProfileEditMode mode})
      : _mode = mode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileBloc>(),
      child: _EditProfile(mode: _mode),
    );
  }
}

// Bottom Sheet Widget
class _EditProfile extends StatelessWidget {
  final ProfileEditMode _mode;
  final _frmKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  _EditProfile({required ProfileEditMode mode}) : _mode = mode;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get the existing details if any
      BlocProvider.of<EditProfileBloc>(context)
          .add(EditProfileEvent.initial(_mode));
    });

    return BlocListener<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        _name.text = state.name;
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Form(
              key: _frmKey,
              child:
                  CustomTextFormFieldWidget(controller: _name, label: 'Name'),
            ),
            kHeight20,
            GreyOutlinedButtonWidget(
              label: 'Save',
              icon: const Icon(Icons.save),
              onPressed: () => _save(context),
            )
          ],
        ),
      ),
    );
  }

  void _save(BuildContext context) {
    if (_frmKey.currentState!.validate()) {
      BlocProvider.of<EditProfileBloc>(context)
          .add(EditProfileEvent.save(_mode, _name.text));
      router.pop(true);
    }
  }
}
