import 'package:to_do_app/features/home/home_export.dart';

AppBar appBarWidget({
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: AppColor().backgroundColor,
    actions: [
      IconButton(
        onPressed: () {
          bottomSheetAdTaskWidget(context: context);
        },
        icon: Icon(
          Icons.add,
          color: AppColor().textColor,
        ),
      )
    ],
  );
}
