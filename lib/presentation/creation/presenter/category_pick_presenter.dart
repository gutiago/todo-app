import '../../../database/entities/category.dart';

import '../../../database/app_database.dart';

class CategoryPickPresenter {
  const CategoryPickPresenter();

  Future<List<Category>> fetchCategories() async {
    final db = await AppDatabase.appDatabase;
    return db.categoryDao.findAllCategories();
  }
}
