import 'package:hive/hive.dart';
part 'localy.g.dart';

@HiveType(typeId: 0)
class Localy extends HiveObject {
  @HiveField(0)
  late String name;

  Localy({required this.name});
}
