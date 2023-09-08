import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testpro/Feauter/posts/Data/Datasour/Remote_data_Posts.dart';
import 'package:testpro/Feauter/posts/Data/Datasour/Remote_data_ToDos.dart';
import 'package:testpro/Feauter/posts/Data/Repos/Posts_Repos_Impl.dart';
import 'package:testpro/Feauter/posts/Data/Repos/Todos_Repos_Impl.dart';
import 'package:testpro/Feauter/posts/Domain/UseCase/FechPostsUseCaes.dart';
import 'package:testpro/Feauter/posts/Domain/UseCase/GetPostsUseCaes.dart';
import 'package:testpro/Feauter/posts/Presentation/Controller/Posts/posts_cubit.dart';
import 'package:testpro/Feauter/posts/Presentation/Controller/ToDos/to_dos_cubit.dart';
import 'package:testpro/Servesies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 76, 69, 147)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text("Posts"),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => ToDosCubit(
              GetToDosUseCaes(
                ToDosReposImpl(
                  DataRemoteSourToDos(
                    ApiServices(
                      Dio(),
                    ),
                  ),
                ),
              ),
            )..getTodos(),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.11,
              child: BlocBuilder<ToDosCubit, ToDosState>(
                builder: (context, state) {
                  if (state is ToDosSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.myToDos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.green),
                            ),
                            child: Column(
                              children: [
                                Text("${state.myToDos[index].title}"),
                                Text("${state.myToDos[index].completed}"),
                                Text("${state.myToDos[index].id}"),
                              ],
                            ));
                      },
                    );
                  } else if (state is ToDosLaoding) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ToDosFauiler) {
                    return Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      color: Color.fromARGB(255, 100, 7, 0),
                      child: Text("EM:${state.EM}"),
                    );
                  }
                  return EitherState();
                },
              ),
            ),
          ),
          BlocProvider(
            create: (context) => PostsCubit(
              FechPostsUseCaes(
                PostsReposImpl(
                  RemoteDataSourPosts(
                    ApiServices(
                      Dio(),
                    ),
                  ),
                ),
              ),
            )..fechPosts(),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.75,
              child: BlocBuilder<PostsCubit, PostsState>(
                builder: (context, state) {
                  if (state is PostsSuccess) {
                    return ListView.builder(
                      itemCount: state.myposts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          child: ListTile(
                            title: Text("${state.myposts[index].title}"),
                            subtitle: Text("${state.myposts[index].body}"),
                            // leading: Text("${state.myposts[index].userId}"),
                            leading: Text("${state.myposts[index].id}"),
                          ),
                        );
                      },
                    );
                  } else if (state is PostsLaoding) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PostsFauiler) {
                    return Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      color: Color.fromARGB(255, 100, 7, 0),
                      child: Text("EM:${state.EM}"),
                    );
                  }
                  return EitherState();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EitherState extends StatelessWidget {
  const EitherState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: Colors.red,
    );
  }
}
