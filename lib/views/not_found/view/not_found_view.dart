import 'package:flutter/material.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';

class NotFoundView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('error_page_not_found_title'.locale),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text('error_page_not_found'.locale),
          ),
        ],
      ),
    );
  }
}
