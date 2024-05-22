import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shipping_ui_app/widget_constants/styles.dart';
import 'package:shipping_ui_app/widget_utils/utility.dart';
import 'package:shipping_ui_app/widgets/custom_text_form_field.dart';

class OrderFormPage extends StatefulWidget {
  const OrderFormPage({super.key});

  @override
  State<OrderFormPage> createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final _orderFormKey = GlobalKey<FormState>();
  int currentStep = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: FutureBuilder(future: Future(() {
        return "result";
      }), builder: (context, snapshot) {
        if (snapshot.hasError) {}
        if (!snapshot.hasData) {
          //return inLineProgressIndicator(minHeight: 8);
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            return Form(
              key: _orderFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Text(
                      "Create Order.",
                      style: kPageTitleBoldStyle,
                    ),
                  ),
                  Material(
                    elevation: 20,
                    borderOnForeground: true,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    shadowColor: Colors.grey,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Stepper(
                        type: Utility.isRunningOnWeb()
                            ? StepperType.vertical
                            : StepperType.horizontal,
                        currentStep: currentStep,
                        onStepCancel: () => currentStep == 0
                            ? null
                            : setState(() {
                                currentStep -= 1;
                              }),
                        onStepContinue: () {
                          bool isLastStep =
                              (currentStep == getSteps().length - 1);
                          if (isLastStep) {
                            _orderFormKey.currentState!.validate();
                          } else {
                            setState(() {
                              currentStep += 1;
                            });
                          }
                        },
                        onStepTapped: (step) => setState(() {
                          currentStep = step;
                        }),
                        steps: getSteps(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      createStep(
        0,
        const Text("Personal Details."),
        createPersonalDetailStep(),
      ),
      createStep(
        1,
        const Text("Product Details."),
        createPersonalDetailStep(),
      ),
      createStep(
        2,
        const Text("Deilvery Details."),
        createPersonalDetailStep(),
      ),
    ];
  }

  Step createStep(int stepIndex, Text stepHeader, Widget stepContent) {
    return Step(
      state: currentStep > stepIndex ? StepState.complete : StepState.indexed,
      isActive: currentStep >= stepIndex,
      title: stepHeader,
      content: stepContent,
    );
  }

  Widget createPersonalDetailStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFormField(
              hint: "Customer Name",
              controller: _nameController,
              errorMsg: "customer name is invalid",
              onChanged: (value) {},
            ),
            const Spacer(flex: 1),
            CustomTextFormField(
              hint: "Customer Mobile No",
              controller: _mobileNoController,
              errorMsg: "customer mobile no is invalid",
              onChanged: (value) {},
            ),
            const Spacer(flex: 1),
            CustomTextFormField(
              hint: "Customer Email",
              controller: _emailController,
              errorMsg: "customer email is invalid",
              onChanged: (value) {},
            ),
          ],
        ),
        const Divider(
          height: 20,
          thickness: 0,
          color: Colors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFormField(
              hint: "Flat No. & Building Name",
              errorMsg: " details invalid",
              onChanged: (value) {},
            ),
            const Spacer(flex: 1),
            CustomTextFormField(
              hint: "Road, Locality",
              errorMsg: " details invalid",
              onChanged: (value) {},
            ),
            const Spacer(flex: 1),
            CustomTextFormField(
              hint: "Landmark (Optional)",
              errorMsg: " details invalid",
              onChanged: (value) {},
            ),
          ],
        ),
        const Divider(
          height: 20,
          thickness: 0,
          color: Colors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFormField(
              hint: "Pin Code",
              controller: _nameController,
              errorMsg: "details invalid",
              onChanged: (value) {},
            ),
            const Spacer(flex: 1),
            CustomTextFormField(
              hint: "City, State",
              errorMsg: "details invalid",
              onChanged: (value) {},
            ),
            const Spacer(flex: 6),
          ],
        ),
        const Divider(
          height: 20,
          thickness: 0,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
