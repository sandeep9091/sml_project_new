class UserData {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Data>? data;
  final Support? support;

  UserData({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });
}

class Data {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  final String totalName;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.totalName,
  });
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });
}
