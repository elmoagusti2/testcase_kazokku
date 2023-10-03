import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazokku/models/user/data_user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kazokku/presentation/details/bloc/details_user_bloc.dart';
import 'package:kazokku/presentation/details/details.dart';

class CardHome extends StatelessWidget {
  final DataUser dataUser;
  const CardHome({
    super.key,
    required this.dataUser,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => DetailsUserBloc(),
                  child: DetailsPage(id: dataUser.id))),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5.w),
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  dataUser.picture ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              '${dataUser.title}. ${dataUser.firstName} ${dataUser.lastName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              ' ${dataUser.firstName}${dataUser.lastName}@example.app',
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
