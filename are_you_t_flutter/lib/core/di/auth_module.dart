import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/sign_in_with_social_account_use_case.dart';
import '../../features/auth/domain/usecase/sign_up_with_social_account_use_case.dart';
import '../../features/auth/presentation/state/sign_in_state.dart';
import '../../features/auth/presentation/state/sign_up_state.dart';
import '../../features/auth/presentation/viewmodel/sign_in_view_model.dart';
import '../../features/auth/presentation/viewmodel/sign_up_view_model.dart';


// UseCase Providers
// final signUpUseCaseProvider = Provider<SignUpWithSocialAccountUseCase>((ref) {
//   return SignUpWithSocialAccountUseCase(ref.read(mockAuthRepositoryProvider));
// });

final signInUseCaseProvider = Provider<SignInWithSocialAccountUseCase>((ref) {
  return SignInWithSocialAccountUseCase(ref.read(mockAuthRepositoryProvider));
});

// ViewModel Providers
final signUpViewModelProvider = StateNotifierProvider<SignUpViewModel, SignUpState>(
      (ref) => SignUpViewModel(ref.read(signUpUseCaseProvider)),
);

final signInViewModelProvider = StateNotifierProvider<SignInViewModel, SignInState>(
      (ref) => SignInViewModel(ref.read(signInUseCaseProvider)),
);