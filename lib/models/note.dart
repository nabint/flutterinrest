class Note {
  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime latestEditDateTime;
  
  Note({this.noteID,this.noteContent, this.noteTitle, this.createDateTime, this.latestEditDateTime});
  factory Note.fromJson(Map<String,dynamic> item){
    return Note(
          noteID: item['noteID'],
          noteContent: item['noteContent'],
          noteTitle: item['noteTitle'],
          createDateTime: DateTime.parse(item['createDateTime']),
          latestEditDateTime: item['latestEditDateTime'] != null
              ? DateTime.parse(item['latestEditDateTime'])
              : null,
        );
  }
}