import '../../domain/entities/tasks.dart';

class TasksModel extends TasksEntitie {
  TasksModel({
    String? activity,
    String? type,
    int? participants,
    dynamic price,
    String? link,
    String? key,
    dynamic accessibility,
  }) : super(
          activity: activity,
          type: type,
          participants: participants,
          price: price,
          link: link,
          key: key,
          accessibility: accessibility,
        );

  factory TasksModel.fromJson(Map<String, dynamic> map) {
    return TasksModel(
      activity: map["activity"] ?? "",
      type: map["type"] ?? "",
      participants: map["participants"] ?? 0,
      price: map["price"] ?? 0,
      link: map["link"] ?? "",
      key: map["key"] ?? "",
      accessibility: map["accessibility"] ?? 0,
    );
  }
  factory TasksModel.fromEntity(TasksEntitie entity) {
    return TasksModel(
      activity: entity.activity,
      type: entity.type,
      participants: entity.participants,
      price: entity.price,
      link: entity.link,
      key: entity.key,
      accessibility: entity.accessibility,
    );
  }
}
