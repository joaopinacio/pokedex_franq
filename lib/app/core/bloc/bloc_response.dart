/// Will represent the response from the data source
/// will hold the success data and error data
class BaseResponse<T, E> {
  T? data;
  E? error;
  bool success;

  BaseResponse.completed(this.data) : success = true;

  BaseResponse.error(this.error) : success = false;
}
