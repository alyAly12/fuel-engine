import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../commom_bloc/connection_check_bloc/connection_check_bloc.dart';
import 'custom_text_widget.dart';

class ConnectionCheckContainer extends StatelessWidget {
  const ConnectionCheckContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionCheckBloc, ConnectionCheckState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.grey.shade300),
              ]),
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      CustomTextWidget(
                        title: state.message,
                        fontSize: 7,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Icon(
                    state.icon,
                    color: state.color,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const VerticalDivider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: const Text('ok'))
                ],
              ),
            ),
          );
        } else if (state is NotConnectedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.grey.shade300),
              ]),
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      CustomTextWidget(
                        title: state.message,
                        fontSize: 7,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Icon(
                    state.icon,
                    color: state.color,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const VerticalDivider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text('ok')
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
