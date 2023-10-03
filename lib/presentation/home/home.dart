import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kazokku/commmon/enum.dart';
import 'package:kazokku/presentation/home/bloc/home_bloc.dart';
import 'package:kazokku/presentation/home/home_card.dart';
import 'package:kazokku/presentation/post/bloc/post_bloc.dart';
import 'package:kazokku/presentation/post/post.dart';
import 'package:kazokku/presentation/widget/shimmer_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    BlocProvider.of<HomeBloc>(context).add(const GetUsers(limit: 10));
    BlocProvider.of<PostBloc>(context).add(const GetPosts(limit: 10));
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        BlocProvider.of<HomeBloc>(context).add(GetUsers(
            limit: context.read<HomeBloc>().state.userModel.limit! + 10));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            MainPage(scrollController: scrollController),
           const PostPage(),
           const SizedBox(
              child: Center(child: Text("on develop")),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => tabController.animateTo((value)),
          // currentIndex: 1,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.amber,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: "New",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
          ]),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.delayed(const Duration(seconds: 1),
          () => context.read<HomeBloc>().add(const GetUsers(limit: 10))),
      child: SingleChildScrollView(
        controller: scrollController,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final user = state.userModel.data;
            final length = state.userModel.limit ?? 0;
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Users', style: TextStyle(fontSize: 15.sp))),
                state.requestState == RequestState.success
                    ? GridView.count(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.w,
                        children: [
                          for (var item in user!) CardHome(dataUser: item),
                        ],
                      )
                    : GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.w,
                        children: [
                          for (var i = 0; i < 8; i++) const CustomShimmer()
                        ],
                      ),
                length < 50 && length > 0 ? const CustomShimmer() : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
