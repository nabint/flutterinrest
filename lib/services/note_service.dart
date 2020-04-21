import 'dart:convert';
import 'package:flutterinrest/models/api_respone.dart';
import 'package:flutterinrest/models/note.dart';
import 'package:flutterinrest/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NoteService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': "43a07a9d-12ed-45e8-9051-f3760039b870"};
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing.fromJson(item);
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(
          data: notes,
        );
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'Ann Error has occured');
    }).catchError((_) {
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An Error has occured');
    });
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + '/notes/'+noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final note = Note.fromJson(jsonData);

        return APIResponse<Note>(
          data: note,
        );
      }
      return APIResponse<Note>(
          error: true, errorMessage: 'Ann Error has occured');
    }).catchError((_) {
      return APIResponse<Note>(
          error: true, errorMessage: 'An Error has occured');
    });
  }
}
