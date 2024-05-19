import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../home_export.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<HomeBloc>()
          ..add(const GetHomeEvent())
          ..add(PaginationInitEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            print(state);
            if (state is AllHomeState) {
              if (state.home == Home.errorDeleteOrEdit) {
                AppSnackBarMessage().showSnackBar(
                    message: state.error!,
                    backgroundColor: AppColor().redColor,
                    context: context);
              }
            }
          },
          builder: (context, state) {
            var homeBloc = HomeBloc.get(context);

            if (state is AllHomeState) {
              if (state.home == Home.loading) {
                return const LoadingWidget();
              } else if (state.home == Home.error) {
                return ErrorPageWidget(
                  errorText: state.error ?? '',
                  onTap: () {
                    homeBloc.add(const GetHomeEvent());
                  },
                );
              } else {
                return Scaffold(
                  appBar: appBarWidget(context: context),
                  body: RefreshIndicator(
                    onRefresh: () async {
                      homeBloc.add(const GetHomeEvent());
                    },
                    child: Container(
                      color: AppColor().backgroundColor,
                      width: w,
                      height: h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: false,
                            controller: homeBloc.scrollController,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ItemListWidget(
                                    todoEntity: homeBloc.todoList[index],
                                    onTapDelete: () {
                                      homeBloc.add(EditTaskEvent(
                                          index: index,
                                          delete: true,
                                          todoEntity:
                                              homeBloc.todoList[index]));
                                    },
                                    onTapEdit: () {
                                      homeBloc.add(EditTaskEvent(
                                          index: index,
                                          delete: false,
                                          todoEntity:
                                              homeBloc.todoList[index]));
                                    },
                                  ),
                                  if (index == homeBloc.todoList.length - 1 &&
                                      homeBloc.isLoading)
                                    const LoadingWidget(),
                                ],
                              );
                            },
                            itemCount: homeBloc.todoList.length),
                      ),
                    ),
                  ),
                );
              }
            }

            return Container();
          },
        ),
      ),
    );
  }
}
