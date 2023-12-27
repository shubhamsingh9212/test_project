import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/constants/colors.dart';
import 'package:test_project/constants/text_styles.dart';
import 'package:test_project/home_module/controllers/home_controller.dart';
import 'package:test_project/home_module/custom_widgets/widgets.dart';
import 'package:test_project/home_module/views/result_screen.dart';

class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height;
    double mediaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Obx(
      () => Scaffold(
        body: SizedBox(
          height: mediaHeight,
          width: mediaWidth,
          child: Container(
            width: mediaWidth,
            // height: mediaHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 25,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  title: "About loan",
                  style: AppTextStyles.appBarText,
                ),
                (controller.queNo.value == 6)
                    ? ResultScreen(
                  response: controller.reponse?.schema,
                  incomeController: controller.incomeController,
                )
                    :
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    indicator(mediaWidth: mediaWidth),
                    const SizedBox(
                      height: 25,
                    ),
                    Obx(
                      () => ((controller.queNo.value < 6))
                          ? customText(
                              title: controller
                                  .reponse
                                  ?.schema
                                  ?.fields?[controller.queNo.value]
                                  .schema
                                  .label,
                              style: AppTextStyles.lightTextStyle,
                            )
                          : const SizedBox(),
                    ),
                    customHeight(12),
                    Obx(() => (controller.queNo.value < 6)
                        ? (controller
                                    .reponse
                                    ?.schema
                                    ?.fields?[controller.queNo.value]
                                    .type ==
                                "Section")
                            ? customTextField(
                                controller: controller.incomeController,
                                hintText: "Income",
                                labelText: "Income",
                              )
                            : radioButtonView()
                        : const SizedBox()),

                  ],
                ),
                const Spacer(),
                Obx(
                  () => Row(
                    children: [
                      Visibility(
                        visible: controller.queNo.value > 0,
                        child: labelButton(
                            onPressed: controller.queNo.value <= 6 &&
                                    controller.queNo.value >= 1
                                ? () {
                                    controller.queNo.value--;

                                    log(
                                      controller.queNo.value.toString(),
                                    );
                                  }
                                : () {}),
                      ),
                      const Spacer(),
                      Visibility(
                        visible: controller.queNo.value <=5,
                        child: iconButton(
                          onPressed: controller.queNo.value <= 5
                              ? () {
                                  controller.queNo.value++;
                                  log(
                                    controller.queNo.value.toString(),
                                  );
                                }
                              : () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget radioButtonView() {
    var fields = controller
        .reponse?.schema?.fields?[controller.queNo.value].schema.options;

    return ListView.builder(
      itemCount: fields.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        children: [
          Obx(
            () {
              return RadioListTile(
                title: Text(
                  fields[index].value,
                  style: TextStyle(
                    fontSize: 13,
                    color: controller
                                .reponse
                                ?.schema
                                ?.fields?[controller.queNo.value]
                                .schema
                                .selectedIndex
                                .toString() ==
                            index.toString()
                        ? AppColors.orange
                        : AppColors.black,
                  ),
                ),
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                value: index.toString(),
                contentPadding: EdgeInsets.zero,
                groupValue: controller.reponse?.schema
                    ?.fields?[controller.queNo.value].schema.selectedIndex
                    .toString(),
                onChanged: (value) {
                  controller.reponse?.schema?.fields?[controller.queNo.value]
                      .schema.selectedIndex.value = value;

                  // controller.setSelectedAns(value ?? "0");
                },
                activeColor: AppColors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: controller
                                .reponse
                                ?.schema
                                ?.fields?[controller.queNo.value]
                                .schema
                                .selectedIndex
                                .toString() ==
                            index.toString()
                        ? AppColors.orange
                        : AppColors.grey,
                    width: 1.5,
                  ),
                ),
              );
            },
          ),
          customHeight(17),
        ],
      ),
    );
  }

  Widget indicator({
    required double? mediaWidth,
  }) {
    return SizedBox(
      height: 5,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) => Row(
          children: [
            const SizedBox(width: 4),
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: controller.queNo.value == index
                      ? AppColors.green
                      : AppColors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: (mediaWidth ?? 0) * 0.060,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
