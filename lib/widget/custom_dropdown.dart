import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/global_controller.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    this.isMust,
    required this.items,
    required this.firstItem,
    required this.controller,
  });
  final String title;
  final bool? isMust;
  final List<String> items;
  final String firstItem;
  final TextEditingController controller;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final c = Get.put(GlobalController());
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField2(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),isDense: true,
                  contentPadding: EdgeInsets.zero,),
                isExpanded: true,
                hint: Text(
                  widget.firstItem,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                items: widget.items
                    .map((item) => DropdownMenuItem<String>(
                          alignment: Alignment.centerLeft,
                          value: item,
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedValue = value.toString();
                  widget.controller.text = selectedValue.toString();
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                  widget.controller.value = selectedValue as TextEditingValue;
                  widget.controller.text = selectedValue!;
                },
                buttonStyleData: const ButtonStyleData(
                  height: 45,
                  padding: EdgeInsets.only(right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                  iconSize: 30,
                ),
                dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.zero,
                  // padding: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
