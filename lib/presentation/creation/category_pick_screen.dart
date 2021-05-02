import 'package:flutter/material.dart';
import 'package:todo_app/components/popover.dart';
import 'package:todo_app/database/entities/category.dart';
import 'package:todo_app/presentation/creation/category_create_popover.dart';
import 'package:todo_app/resources/app_colors.dart';
import 'package:todo_app/resources/spacings.dart';
import 'presenter/category_pick_presenter.dart';
import '../../resources/strings.dart';
import '../../components/empty_list.dart';

class CategoryPickScreen extends StatefulWidget {
  const CategoryPickScreen({
    this.presenter = const CategoryPickPresenter(),
  });

  final CategoryPickPresenter presenter;

  @override
  _CategoryPickScreenState createState() => _CategoryPickScreenState();
}

class _CategoryPickScreenState extends State<CategoryPickScreen> {
  List<Category> allCategories = [];

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        leading: CloseButton(),
        title: Text(Strings.categories),
      ),
      backgroundColor: Colors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: allCategories.isEmpty ? EmptyList() : _categoryList(context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkBlue,
        child: Icon(Icons.add),
        onPressed: () => _presentCreateCategory(context),
      ),
    );
  }

  Widget _categoryList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Spacings.x2, vertical: Spacings.x4),
      child: ListView.builder(
          itemCount: allCategories.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(allCategories[index].name),
                onTap: () => Navigator.of(context).pop(allCategories[index]),
              ),
            );
          }),
    );
  }

  void _getCategories() async {
    widget.presenter
        .fetchCategories()
        .then((categories) => setState(() => allCategories = categories));
  }

  void _presentCreateCategory(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(child: CategoryCreatePopover());
      },
    ).then(_checkNewCategory);
  }

  void _checkNewCategory(dynamic? result) {
    if (result != null && result is Category) {
      setState(() => allCategories.add(result));
    }
  }
}
