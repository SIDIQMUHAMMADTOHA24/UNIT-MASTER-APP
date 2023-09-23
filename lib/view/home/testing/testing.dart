import 'package:conversion_app/view/home/testing/bloc/testing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestingView extends StatelessWidget {
  const TestingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestingBloc, int>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: IconButton(
              onPressed: () {
                context.read<TestingBloc>().add(Incremennt());
              },
              icon: const Icon(Icons.add)),
          body: Center(
            child: Text('$state'),
          ),
        );
      },
    );
  }
}
