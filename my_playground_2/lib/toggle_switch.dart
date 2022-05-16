import 'package:flutter/material.dart';
import 'ToDo.dart';

class ToggleSwitch extends StatefulWidget {
  final List<Todo> itemList;
  bool isToggled;
  void Function(bool) onChangeToggle;

  ToggleSwitch(this.itemList, this.isToggled, this.onChangeToggle);

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: widget.isToggled,
      onChanged: widget.itemList.isEmpty
          ? null
          : (value) => widget.onChangeToggle(value),
      activeColor: Colors.teal,
      activeTrackColor: Colors.blueGrey,
    );
  }
}
