import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:flutter/material.dart';

class NameInputWidget extends StatefulWidget {
  const NameInputWidget({super.key});

  @override
  State<NameInputWidget> createState() => _NameInputWidgetState();
}

class _NameInputWidgetState extends State<NameInputWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.addListener(() {
      context.read<NameCubit>().changeName(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Your name or Your full name ',
      ),
    );
  }
}
