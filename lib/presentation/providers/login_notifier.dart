import 'package:flutter_riverpod/legacy.dart';

final showPasswordSP = StateProvider.autoDispose<bool>((_) => false);
final rememberMePasswordSP = StateProvider.autoDispose<bool>((_) => false);
