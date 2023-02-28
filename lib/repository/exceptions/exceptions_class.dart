

class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An known error occurred."]);
  
  factory SignUpWithEmailAndPasswordFailure.code(String code){

    switch(code){
      case 'weak-password' :
       return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password.');
      case 'invalid-email' :
       return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted.');
      case 'email-aleady-in-use' :
       return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted.');
      default: return const SignUpWithEmailAndPasswordFailure();
    }
  }
 
}
