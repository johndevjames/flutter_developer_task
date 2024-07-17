class UsersList {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  UsersList(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});
}
