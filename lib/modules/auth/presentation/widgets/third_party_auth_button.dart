import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdPartyAuthButton extends StatelessWidget {
  const ThirdPartyAuthButton({
    super.key,
    required this.thirdPartyName,
    required this.thirdPartyIcon,
    this.onPressed,
  });

  final String thirdPartyName;
  final String thirdPartyIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(thirdPartyIcon),
        label: Text(thirdPartyName),
      ),
    );
  }
}
