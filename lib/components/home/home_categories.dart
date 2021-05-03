import 'package:flutter/material.dart';
import '../../model/home/home_category_model.dart';
import '../../resources/spacings.dart';
import '../../resources/strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories(this.categories);

  final List<HomeCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.categories,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Spacings.x3),
          Container(
            height: 350.0,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    width: 250.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(Spacings.x2),
                          child:
                              Icon(Icons.category_outlined, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Spacings.x1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Spacings.x2,
                                    vertical: Spacings.x1),
                                child: Text(
                                  categories[index].numberOfTasks,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Spacings.x2,
                                    vertical: Spacings.x1),
                                child: Text(
                                  categories[index].categoryName,
                                  style: TextStyle(fontSize: 28.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(Spacings.x2),
                                child: LinearProgressIndicator(
                                  value: categories[index].percentageCompleted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Spacings.x2)),
                );
              },
            ),
          ),
          const SizedBox(height: Spacings.x5),
        ],
      ),
    );
  }
}
