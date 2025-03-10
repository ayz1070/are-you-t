class PostCreateState {
  final bool isLoading;
  final String? errorMessage;

  PostCreateState({
    this.isLoading = false,
    this.errorMessage,
  });

  PostCreateState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return PostCreateState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}