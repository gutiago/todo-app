import 'package:floor/floor.dart';

@entity
class Category {
  Category(
    this.id,
    this.name,
  );

  @PrimaryKey(autoGenerate: true)
  final int id;

  final String name;
}
