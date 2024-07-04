import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {

  public type Note = {
    title : Text;
    content : Text;
  };

  //  List containing objects of datatype Note
  // applied data persistence using stable keyword
  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text){

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    // adding a new node to list
    // prepending to the list
    notes := List.push(newNote, notes);
    // Debug.print(debug_show(notes));


  };

  // returns an array of notes
  public query func readNotes(): async [Note] {
    // Motko List is basically an array of array with many layers eg. [1,[2,[3,[4]]]]
    // so need to convert it into array before sending to frontend
    return List.toArray(notes);
  };


  public func removeNote(id: Nat) {
    // take drop append
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id+1);
    notes := List.append(listFront, listBack);
  };

}