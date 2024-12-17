import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/user.dart';

part 'filters_provider.g.dart';

@riverpod
class FilterState extends _$FilterState {
  @override
  Future<User?> build() async {
     return null;
  }


  Future<void> updateFilter(User? user) async {
    state = AsyncValue.data(user);
  }


}
