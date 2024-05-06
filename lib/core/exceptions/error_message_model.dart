import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;
  final bool status;

  const ErrorMessageModel({required this.statusMessage, required this.status});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(statusMessage: json['message'], status: json['status']);

  @override
  List<Object> get props => [statusMessage, status];
}
