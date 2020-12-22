import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';

class LanguageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'language_choose'.locale,
        ),
      ),
      body: ListView(
        children: [
          buildSizeBox(context),
          for (Locale language in context.supportedLocales) ...[
            buildLanguage(context, language),
          ]
        ],
      ),
    );
  }
}
