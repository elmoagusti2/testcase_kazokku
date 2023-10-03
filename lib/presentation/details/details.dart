import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kazokku/commmon/enum.dart';

import 'package:kazokku/models/user_details_model/user_details_model.dart';
import 'package:kazokku/presentation/details/bloc/details_user_bloc.dart';
import 'package:kazokku/presentation/widget/post_card.dart';
import 'package:kazokku/presentation/widget/shimmer_custom.dart';

class DetailsPage extends StatefulWidget {
  final String? id;
  const DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final f = DateFormat('dd MMMM yyyy');

  _DetailsPageState();
  @override
  void initState() {
    BlocProvider.of<DetailsUserBloc>(context).add(GetDetails(id: widget.id!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: BlocBuilder<DetailsUserBloc, DetailsUserState>(
      builder: (context, state) {
        return BlocBuilder<DetailsUserBloc, DetailsUserState>(
          builder: (context, state) {
            var user = state.userDetailsModel;
            var post = state.userDetailsPostModel.data;
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: state.requestState == RequestState.success
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              iconColor: Colors.amber,
                              hintText: 'Search Post'),
                        ),
                        Header(user: user, f: f),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              for (var item in post!)
                                PostsCard(
                                  dataPost: item,
                                )
                            ],
                          ),
                        )
                      ],
                    )
                  : const Column(
                      children: [
                        CustomShimmer(
                          w: 900,
                          h: 200,
                        ),
                        Expanded(
                            child: CustomShimmer(
                          w: 900,
                          h: 500,
                        )),
                      ],
                    ),
            );
          },
        );
      },
    )));
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.user,
    required this.f,
  });

  final UserDetailsModel user;
  final DateFormat f;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("${user.picture}"),
              minRadius: 70,
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('${user.title}. ${user.firstName} ${user.lastName}'),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Text(
              "Gender: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${user.gender}')
          ],
        ),
        Row(
          children: [
            const Text(
              "Date Of Birth: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(f.format(user.dateOfBirth ?? DateTime.now()))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Gender: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child: Text('${user.location}', maxLines: 2))
          ],
        ),
      ],
    );
  }
}
