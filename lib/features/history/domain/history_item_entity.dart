import 'package:hive/hive.dart';
part 'history_item_entity.g.dart';

@HiveType(typeId: 0)
class HistoryItemEntity {
  @HiveField(0)
  final String data;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String? qrData;
  @HiveField(3)
  final String type;

  HistoryItemEntity({
    required this.data,
    required this.date,
    required this.qrData,
    required this.type,
  });
}
