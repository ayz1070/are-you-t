import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/data/repository_impl/mock/mock_auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/sign_in_use_case.dart';
import '../../features/auth/domain/usecase/sign_up_use_case.dart';
import '../../features/auth/presentation/state/sign_in_state.dart';
import '../../features/auth/presentation/state/sign_up_state.dart';
import '../../features/auth/presentation/viewmodel/sign_in_view_model.dart';
import '../../features/auth/presentation/viewmodel/sign_up_view_model.dart';

final mockAuthRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthRepositoryImpl();
});

// UseCase Providers
final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.read(mockAuthRepositoryProvider));
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.read(mockAuthRepositoryProvider));
});

// ViewModel Providers
final signUpViewModelProvider = StateNotifierProvider<SignUpViewModel, SignUpState>(
      (ref) => SignUpViewModel(ref.read(signUpUseCaseProvider)),
);

final signInViewModelProvider = StateNotifierProvider<SignInViewModel, SignInState>(
      (ref) => SignInViewModel(ref.read(signInUseCaseProvider)),
);