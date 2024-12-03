class NotificationResponseModel {
  String id = '0';
  String type = '1';
  String notifiableType = 'order';
  int notifiableId = 0;
  Data? data;
  String readAt = '';
  int flag = 2;
  String createdAt = DateTime.now().toString();
  String? updatedAt;

  bool get isUnRead => readAt.isEmpty;

  NotificationResponseModel({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    this.data,
    required this.readAt,
    required this.flag,
    required this.createdAt,
    this.updatedAt,
  });

  NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    readAt = json['read_at'] ?? '';
    flag = json['flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['notifiable_type'] = notifiableType;
    data['notifiable_id'] = notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['flag'] = flag;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Data {
  String? type;
  String? title;
  String? body;
  String? level;
  int? orderId = 0;
  bool isPrescription = false;
  String rejectReason = '';
  List<dynamic> prescriptionImage = [];

  Data({
    this.type,
    this.title,
    this.body,
    this.level,
    required this.orderId,
    this.rejectReason = '',
    this.prescriptionImage = const [],
    this.isPrescription = false,
  });

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    body = json['body'];
    level = json['level'];
    orderId = json['order_id'];
    isPrescription = json['is_prescription'] ?? false;
    rejectReason = json['reject_reason'] ?? '';
    // prescriptionImage = json['prescription_images'] != null
    //     ? tryParseList(json['prescription_images'],
    //     (map) => PrescriptionImages.fromJson(map),)
    //     : [];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['body'] = body;
    data['level'] = level;
    data['order_id'] = orderId;
    data['is_prescription'] = isPrescription;
    data['reject_reason'] = rejectReason;
    data['prescription_images'] = prescriptionImage;
    return data;
  }
}