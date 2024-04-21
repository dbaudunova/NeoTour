import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neo_tour/config/constants/app_assets.dart';
import 'package:neo_tour/config/constants/app_colors.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/presentation/widgets/alert_dialog.dart';
import 'package:neo_tour/presentation/widgets/counter_style.dart';
import 'package:neo_tour/presentation/widgets/elevated_button_style.dart';
import 'package:neo_tour/presentation/widgets/text_field_style.dart';

class InfoBottomSheet extends StatefulWidget {
  const InfoBottomSheet({super.key});

  @override
  State<InfoBottomSheet> createState() => _InfoBottomSheetState();
}

class _InfoBottomSheetState extends State<InfoBottomSheet> {
  final _phoneController = TextEditingController();
  final _commentController = TextEditingController();
  int _counter = 1;
  bool _isButtonEnabled = false;
  String _selectedValue = AppAssets.kgF;

  @override
  void dispose() {
    _phoneController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _phoneController.text.isNotEmpty &&
          _commentController.text.isNotEmpty;
    });
  }

  List<DropdownMenuItem<String>> dropdownItems = [
    AppAssets.kgF,
    AppAssets.kzF,
    AppAssets.ruF,
  ]
      .map(
        (String value) => DropdownMenuItem(
          value: value,
          child: SvgPicture.asset(value),
        ),
      )
      .toList();

  void _incrementCounter() {
    setState(() {
      if (_counter < 6) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _closeBottomSheet(context),
            const SizedBox(height: 20),
            Text(
              'To submit an application for a tour reservation, you need to fill in your information and select the number of people for the reservation',
              style: AppStyles.s14w400,
            ),
            const SizedBox(height: 32),
            _buildText('Phone number'),
            TextFormField(
              onChanged: (_) => _updateButtonState(),
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: _decoration(),
            ),
            const SizedBox(height: 23),
            _buildText('Commentaries to trip'),
            TextFieldStyle(
              onChanged: (_) => _updateButtonState(),
              commentController: _commentController,
              hint: 'Write your wishes to trip...',
            ),
            const SizedBox(height: 20),
            _buildText('Number of people'),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.grey,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 29,
                        height: 36,
                        child: CounterStyle(
                          icon: const Icon(
                            Icons.minimize_rounded,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(bottom: 16),
                          onPressed: _decrementCounter,
                          background: _counter == 1
                              ? AppColors.inactiveButton
                              : AppColors.primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '$_counter',
                          style:
                              AppStyles.s16w700.copyWith(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 29,
                        height: 36,
                        child: CounterStyle(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: _incrementCounter,
                          background: _counter == 6
                              ? AppColors.inactiveButton
                              : AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(AppAssets.user),
                const SizedBox(width: 8),
                Text(
                  '$_counter People',
                  style: AppStyles.s16w600.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButtonStyle(
                onPressed: () {
                  _buildShowDialog(context);
                },
                text: 'Submit',
                backgroundColor: _isButtonEnabled
                    ? AppColors.primaryColor
                    : AppColors.inactiveButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const SizedBox(
          child: AlertDialogStyle(
            title: 'Your trip has been booked!',
            buttonText: 'Ok',
          ),
        );
      },
    );
  }

  Row _closeBottomSheet(BuildContext context) {
    return Row(
      children: [
        Text(
          'Info',
          style: AppStyles.s24w900.copyWith(
            fontWeight: FontWeight.normal,
            fontFamily: 'SfProDisplay',
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close_rounded,
            size: 28,
          ),
        ),
      ],
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      hintText: '_ _ _ _ _ _  _ _ _',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      prefixIcon: _prefixIcon(),
    );
  }

  Row _prefixIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          width: 75,
          child: DropdownButtonFormField(
            decoration: const InputDecoration(enabled: false),
            elevation: 0,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
            value: _selectedValue,
            onChanged: _onChanged,
            items: dropdownItems,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            _getCountryCode(_selectedValue),
            style: AppStyles.s16w400.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  String _getCountryCode(String? value) {
    if (value == AppAssets.kgF) {
      return '+996';
    } else if (value == AppAssets.kzF) {
      return '+7';
    } else if (value == AppAssets.ruF) {
      return '+7';
    } else {
      return '';
    }
  }

  void _onChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedValue = newValue;
      });
    }
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: AppStyles.s14w400.copyWith(color: Colors.grey),
    );
  }
}
