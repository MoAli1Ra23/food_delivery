 
abstract class IAuthFacade {
  Future<void> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<void> signInWithGoogle();
}