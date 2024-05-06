import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';

import '../commom_bloc/connection_check_bloc/connection_check_bloc.dart';

class ConnectionCheckContainer extends StatelessWidget {
  const ConnectionCheckContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionCheckBloc, ConnectionCheckState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return Padding(
            padding: EdgeInsets.only(left: 3, right: 3),
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
                      SizedBox(
                        height: 2,
                      ),
                      CustomTextWidget(
                        title: state.message,
                        fontSize: 7,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    state.icon,
                    color: state.color,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: Text('ok'))
                ],
              ),
            ),
          );
        } else if (state is NotConnectedState) {
          return Padding(
            padding: EdgeInsets.only(left: 3, right: 3),
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
                      SizedBox(
                        height: 2,
                      ),
                      CustomTextWidget(
                        title: state.message,
                        fontSize: 7,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    state.icon,
                    color: state.color,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text('ok')
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
