

class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An known error occurred."]);
  
  factory SignUpWithEmailAndPasswordFailure.code(String code){

    switch(code){
      case '' : return const SignUpWithEmailAndPasswordFailure('');
      default: return const SignUpWithEmailAndPasswordFailure();
    }
  }
 
}
