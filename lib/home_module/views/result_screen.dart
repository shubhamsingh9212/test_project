import 'package:flutter/material.dart';
import 'package:test_project/constants/colors.dart';
import 'package:test_project/constants/text_styles.dart';
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 35),
        shrinkWrap: true,
        itemCount: response?.fields?.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                title: response?.fields?[index].schema.label,
                style: AppTextStyles.lightTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              customHeight(4),
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
                        : incomeController.value.text,
                style: AppTextStyles.smallTextStyle.copyWith(
                  color: AppColors.orange,
                ),
              ),
              customHeight(10),
            ],
          );
        },
      ),
    );
  }
}
