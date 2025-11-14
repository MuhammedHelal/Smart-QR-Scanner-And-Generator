import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/functions/navbar_navigation.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:qr_reader/core/widgets/show_qr_view_with_cubit.dart';
import 'package:qr_reader/core/widgets/black_greyish_container.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/generate_qr_item_view_body.dart';

class EventQrView extends StatefulWidget {
  const EventQrView({super.key});

  @override
  State<EventQrView> createState() => _EventQrViewState();
}

class _EventQrViewState extends State<EventQrView> {
  late final TextEditingController eventNameController;
  late final TextEditingController startDateAndTimeController;
  late final TextEditingController endDateAndTimeController;
  late final TextEditingController addressController;
  late final TextEditingController descriptionController;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    eventNameController = TextEditingController();
    startDateAndTimeController = TextEditingController();
    endDateAndTimeController = TextEditingController();
    addressController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    eventNameController.dispose();
    startDateAndTimeController.dispose();
    endDateAndTimeController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundCircles(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(60),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: BlackGreyishContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Gap(42),
                          const Icon(
                            Icons.event_available,
                            size: 60,
                          ),
                          const Gap(52),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: AppTextStyles.white16W400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter event name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Event Name',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    maxLines: 1,
                                    expands: false,
                                    controller: eventNameController,
                                  ),
                                  const Gap(8),
                                  GestureDetector(
                                    onTap: () async {
                                      final value = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2040),
                                      );
                                      if (value != null) {
                                        startDateAndTimeController.text =
                                            value.toString().substring(0, 11);

                                        setState(() {});
                                      }
                                    },
                                    child: TextFormField(
                                      style: AppTextStyles.white16W400,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Choose start date';
                                        }
                                        return null;
                                      },
                                      ignorePointers: true,
                                      controller: startDateAndTimeController,
                                      decoration: const InputDecoration(
                                        hintText: 'Start Date',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  const Gap(8),
                                  GestureDetector(
                                    onTap: () async {
                                      final value = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day + 1,
                                        ),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2040),
                                      );
                                      if (value != null) {
                                        endDateAndTimeController.text =
                                            value.toString().substring(0, 11);

                                        setState(() {});
                                      }
                                    },
                                    child: TextFormField(
                                      style: AppTextStyles.white16W400,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Choose end date';
                                        }
                                        return null;
                                      },
                                      ignorePointers: true,
                                      decoration: const InputDecoration(
                                        hintText: 'End Date',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                      maxLines: 1,
                                      expands: false,
                                      controller: endDateAndTimeController,
                                    ),
                                  ),
                                  const Gap(8),
                                  TextFormField(
                                    style: AppTextStyles.white16W400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter event address';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Event Address',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    maxLines: 1,
                                    expands: false,
                                    controller: addressController,
                                  ),
                                  const Gap(8),
                                  TextFormField(
                                    style: AppTextStyles.white16W400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter description';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    maxLines: 3,
                                    expands: false,
                                    controller: descriptionController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(52),
                          ElevatedButton(
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              String ics = '''BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//hacksw/handcal//NONSGML v1.0//EN
BEGIN:VEVENT
SUMMARY:${eventNameController.text}
DTSTART:${startDateAndTimeController.text}
DTEND:${endDateAndTimeController.text}
LOCATION:${addressController.text}
DESCRIPTION:${descriptionController.text}
END:VEVENT
END:VCALENDAR''';

                              navigateWithoutNavBar(
                                context,
                                ShowQrViewWithCubit(ics),
                              );
                            },
                            child: const Text(
                              'Generate',
                              style: AppTextStyles.blackGreyish17W500,
                            ),
                          ),
                          const Gap(42),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(25),
              ],
            ),
          ),
          const CustomAppBar(title: 'Event'),
        ],
      ),
    );
  }
}
