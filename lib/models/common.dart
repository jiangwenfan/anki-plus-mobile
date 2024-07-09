// 结果处理
class DataStatus {
  bool status;
  String? errorMsg;
  DataStatus({required this.status, this.errorMsg});
}

// 接口请求的`响应结果`
class RequestResponse extends DataStatus {
  String? rawResponse;
  RequestResponse({required super.status, super.errorMsg, this.rawResponse});
}
