import 'package:to_do_app/features/auth/login_export.dart';
import 'package:to_do_app/features/home/home_export.dart';

class ItemListWidget extends StatelessWidget {
  ItemListWidget(
      {Key? key,
      required this.todoEntity,
      required this.onTapDelete,
      required this.onTapEdit})
      : super(key: key);

  TodoEntity todoEntity;
  void Function()? onTapEdit;
  void Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: w,
          height: 200.h,
          decoration: BoxDecoration(
            color: AppColor().gryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: todoEntity.todo,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor().textColor),
                SizedBox(
                  height: 20.h,
                ),
                AppText(
                    text: 'Status : ${todoEntity.completed} ',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor().textColor),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    todoEntity.isEditing
                        ? const LoadingWithOpacityWidget()
                        : AppButton(
                            width: 150.w,
                            height: 50.h,
                            onTap: onTapEdit,
                            text: 'Edit Status',
                            color: AppColor().buttonColor,
                            fontSize: 20.sp,
                            textColor: AppColor().textColor,
                            fontWeight: FontWeight.bold,
                            borderColor: AppColor().buttonColor),
                    todoEntity.isDeleting
                        ? const LoadingWithOpacityWidget()
                        : AppButton(
                            width: 150.w,
                            height: 50.h,
                            onTap: onTapDelete,
                            text: 'Delete',
                            color: AppColor().redColor,
                            fontSize: 20.sp,
                            textColor: AppColor().textColor,
                            fontWeight: FontWeight.bold,
                            borderColor: AppColor().buttonColor),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
