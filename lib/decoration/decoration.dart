import 'package:flutter/material.dart';

InputDecoration inputDecoration = InputDecoration(
          contentPadding: EdgeInsets.all(15),
          fillColor: Color(0xff222222),
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff222222), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff222222), width:1.5),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
);