abstract class BaseModel {
  /// [id] Local Database ID
  int id;
  static const tableID = 'id';

  /// [cloudID] Server ID
  String cloudID;
  static const tableCloudID = 'cloudID';

  /// [updateDate]
  int updateDate;
  static const tableUpdateDate = 'updateDate';

  /// [isUpdate] If any data is changed, update the data on the remote server.
  /// Update the data on the remote server when the data is changed.
  int isUpdate;
  static const tableIsUpdate = 'isUpdate';

  /// [DateTime.now()] when [updateDate] is empty.
  void dateControl() {
    if (updateDate == null) fromDateTime = DateTime.now();
  }

  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(updateDate);

  set fromDateTime(var value) {
    updateDate = value.millisecondsSinceEpoch;
  }
}
