import 'package:equatable/equatable.dart';

class TasksEntitie extends Equatable {
  final String? activity;
  final String? type;
  final int? participants;
  final dynamic price;
  final String? link;
  final String? key;
  final dynamic accessibility;

  TasksEntitie({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      activity,
      type,
      participants,
      price,
      link,
      key,
      accessibility,
    ];
  }
}
