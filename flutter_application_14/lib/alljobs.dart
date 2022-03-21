class Jobs {
  String? title;
  String? companyName;
  String? catgoryName;
  String? jobType;
  String? location;
  String? salary;
  List<dynamic>? tags;
  String? logo;
  String? url;

  Jobs.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        companyName = json['company_name'],
        catgoryName = json['category'],
        jobType = json['job_type'],
        location = json['candidate_required_location'],
        salary = json['salary'],
        tags = json['tags'],
        logo = json['company_logo'],
        url = json['url'];
}
