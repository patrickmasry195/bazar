import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/assets_paths.dart';
import 'package:bazar/core/widgets/custom_loading_indicator.dart';

class UserPolicyScreen extends StatelessWidget {
  const UserPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorLight.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          "Terms and Data Policy",
          style: AppTextStyles.h5.copyWith(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(AssetsPaths.termsPolicy),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data!);
          }
          return const Center(child: CustomLoadingIndicator());
        },
      ),
    );
  }
}
