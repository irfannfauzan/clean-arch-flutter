import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility/Data/DataSource/user_remote_data_source.dart';
import 'package:mobility/Data/Repositories/user_repository_impl.dart';
import 'package:mobility/Domain/UseCase/get_user_usecase.dart';
import 'package:mobility/Presentation/features/profile/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(
        getUserUseCase: GetUserUseCase(
          UserRepositoryImpl(UserRemoteDataSourceImpl(Dio())),
        ),
      )..add(ProfileMainEvent()),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurple),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial || state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileFailure) {
              return Center(child: Text(state.message));
            }

            if (state is ProfileLoaded) {
              return ListView.builder(
                itemCount: state.user.length,
                itemBuilder: (context, index) {
                  final user = state.user[index];
                  return ListTile(
                    title: Text(user.title),
                    subtitle: Text(
                      user.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
