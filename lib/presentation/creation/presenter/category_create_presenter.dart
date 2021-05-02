import '../../../database/app_database.dart';
import '../../../database/entities/category.dart';

class CategoryCreatePresenter {
  const CategoryCreatePresenter();

  Future createCategory(String name) {
    final category = Category(DateTime.now().millisecond, name);
    return AppDatabase.appDatabase
        .then((db) => db.categoryDao.insertCategory(category))
        .then((_) => category);
  }
}
