import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazokku/commmon/enum.dart';
import 'package:kazokku/presentation/widget/post_card.dart';
import 'package:kazokku/presentation/widget/shimmer_custom.dart';
import 'bloc/post_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        BlocProvider.of<PostBloc>(context).add(
            GetPosts(limit: context.read<PostBloc>().state.post.limit! + 10));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => Future.delayed(const Duration(seconds: 1),
                () => context.read<PostBloc>().add(const GetPosts(limit: 10))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  final post = state.post.data;
                  final length = state.post.limit ?? 0;
                  return Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text('Posts', style: TextStyle(fontSize: 15.sp))),
                      state.requestState == RequestState.success
                          ? ListView(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                for (var item in post!)
                                  PostsCard(dataPost: item)
                              ],
                            )
                          : ListView(
                              shrinkWrap: true,
                              children: [
                                for (var i = 0; i < 8; i++)
                                  const CustomShimmer(
                                    w: 500,
                                    h: 200,
                                  )
                              ],
                            ),
                      length < 50 && length > 0
                          ? const CustomShimmer()
                          : Container(),
                    ],
                  );
                },
              ),
            ),
          );
        },
      )),
    );
  }
}
