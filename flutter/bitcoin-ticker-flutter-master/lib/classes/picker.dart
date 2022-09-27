import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class AndroidPickerItems {
  List<DropdownMenuItem<String>> DropDownMenuItemsList = [];

  List<DropdownMenuItem<String>> getItems() {
    for (String item in currenciesList) {
      DropDownMenuItemsList.add(
        DropdownMenuItem(
          child: Text(item),
          value: item,
        ),
      );
    }
    return DropDownMenuItemsList;
  }
}

class IosPickerItems {
  List<Widget> DropDownMenuItems = [];

  List<Widget> getItems() {
    for (String item in currenciesList) {
      DropDownMenuItems.add(Text(item));
    }
    return DropDownMenuItems;
  }
}
