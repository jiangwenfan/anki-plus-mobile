import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/_models/category.dart';
import 'controller.dart';
import '../home_explore/controller.dart';
import 'package:interview/widgets/common_widgets.dart';
import '../../routers.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CategoryView extends StatelessWidget {
  final HomeExploreController _homeExploreController =
      Get.find<HomeExploreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("admin"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes22.adminAddCategory);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Obx(() => _homeExploreController.isLoading.value
            ? const CircularIndicator()
            : RefreshIndicator(
                child: ListView.builder(
                    itemCount: _homeExploreController.listCategoryData.length,
                    itemBuilder: (context, index) {
                      ListCategoryModel item =
                          _homeExploreController.listCategoryData[index];

                      return SlidableTitle(
                        index: index,
                        bigCategory: item.bigCategory,
                        categoryModel: item.categoryModel,
                      );
                    }),
                onRefresh: () async {
                  logger.i("下拉刷新获取");
                  await _homeExploreController.handleCategoryData();
                })));
  }
}

class DataListTile extends StatelessWidget {
  final String bigCategory;
  final CategoryModel categoryData;

  const DataListTile(
      {super.key, required this.bigCategory, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          print("点击:");
        },
        title: Text(categoryData.name),
        subtitle: Text(bigCategory));
  }
}

class SlidableTitle extends StatefulWidget {
  final String bigCategory;
  final CategoryModel categoryModel;
  final int index;

  const SlidableTitle(
      {super.key,
      required this.index,
      required this.bigCategory,
      required this.categoryModel});

  @override
  State<StatefulWidget> createState() {
    return SlidableTitleState();
  }
}

class SlidableTitleState extends State<SlidableTitle>
    with SingleTickerProviderStateMixin {
  final HomeExploreController controller = Get.find<HomeExploreController>();

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: ValueKey(widget.index),
        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (v) =>
                  {controller.deleteAdminCategoryData(widget.index)},
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'delete',
            ),
          ],
        ),
        child: DataListTile(
          bigCategory: widget.bigCategory,
          categoryData: widget.categoryModel,
        ));
  }
}
