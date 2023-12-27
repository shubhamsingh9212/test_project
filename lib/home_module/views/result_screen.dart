import 'package:flutter/material.dart';
import 'package:test_project/home_module/controllers/home_controller.dart';
import 'package:test_project/home_module/custom_widgets/widgets.dart';

import '../../models/que_ans_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    this.response,
    required this.incomeController,
  });

  final DummyResponseSchema? response;
  final TextEditingController incomeController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: response?.fields?.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(title: response?.fields?[index].schema.label),
              customText(
                  title: (response?.fields?[index].type != "Section")
                      ? (response
                          ?.fields?[index]
                          .schema
                          .options[int.parse(response
                              ?.fields?[index].schema.selectedIndex.value)]
                          .value)
                      : incomeController.value.text.isEmpty
                          ? "0"
                          : incomeController.value.text)
            ],
          );
        },
      ),
    );
  }
}
