class LoginRequest
{
    final String identity;
    final String password;

    LoginRequest( { this.identity, this.password });

    Map<String, dynamic> toJson() => loginRequestToJson(this);

    Map<String, dynamic> loginRequestToJson(LoginRequest instance) {
    return <String, dynamic>{
        'identity': instance.identity,
        'password': instance.password,
      };
    }
}