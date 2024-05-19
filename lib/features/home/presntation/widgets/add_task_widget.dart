import 'package:auto_route/auto_route.dart';

import '../../home_export.dart';

Future bottomSheetAdTaskWidget({
  required BuildContext context,
}) {
  return showModalBottomSheet(
      clipBehavior: Clip.antiAlias,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return BlocProvider(
            create: (context) => sl<AddBloc>(),
            child: BlocConsumer<AddBloc, AddState>(
              listener: (context, state) {
                if (state is AllAddState) {
                  if (state.add == Add.loading) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const LoadingWithOpacityWidget();
                        });
                  }
                  if (state.add == Add.error) {
                    AutoRouter.of(context).pop();
                  }
                  if (state.add == Add.loaded) {
                    AutoRouter.of(context).pop();
                    AddBloc.get(context).task.clear();
                  }
                }
              },
              builder: (context, state) {
                var addBloc = AddBloc.get(context);
                return SingleChildScrollView(
                  child: Container(
                    width: 430.w,
                    height: 500.h,
                    color: AppColor().gryColor,
                    child: Form(
                        key: addBloc.addFormKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// here use name
                              SizedBox(
                                height: 44.h,
                              ),
                              AppTextFormWidget(
                                  text: 'Task title*',
                                  controller: addBloc.task,
                                  textInputType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "The field must be filled out";
                                    }
                                  }),

                              SizedBox(
                                height: 44.h,
                              ),

                              AppButton(
                                width: 400.w,
                                height: 50.h,
                                onTap: () {
                                  if (addBloc.addFormKey.currentState!
                                      .validate()) {
                                    final addEntity = AddEntity(
                                        todo: addBloc.task.text,
                                        completed: false,
                                        userId: AppStorage().getUserId() ?? 0);

                                    addBloc.add(
                                        PostAddEvent(addEntity: addEntity));
                                  }
                                },
                                text: 'Add',
                                color: AppColor().buttonColor,
                                fontSize: 18.sp,
                                textColor: AppColor().textColor,
                                fontWeight: FontWeight.bold,
                                borderColor: AppColor().buttonColor,
                              ),

                              SizedBox(
                                height: 44.h,
                              ),
                              errorText(state),
                              successfullyText(state),
                            ],
                          ),
                        )),
                  ),
                );
              },
            ),
          );
        });
      });
}

Widget errorText(AddState state) {
  return state is AllAddState
      ? state.add == Add.error
          ? Text(
              state.error.toString(),
              style: TextStyle(color: AppColor().redColor),
            )
          : Container()
      : Container();
}

Widget successfullyText(AddState state) {
  return state is AllAddState
      ? state.add == Add.loaded
          ? Text(
              'Task Added Successfully',
              style: TextStyle(color: AppColor().lightGreenColor),
            )
          : Container()
      : Container();
}
