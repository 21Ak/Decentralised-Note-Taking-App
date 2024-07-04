import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {

  public type Note = {
    title : Text;
    content : Text;
  };

  //  List containing objects of datatype Note
  var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text){

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    // adding a new node to list
    // prepending to the list
    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));


  };

  // returns an array of notes
  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  }
}