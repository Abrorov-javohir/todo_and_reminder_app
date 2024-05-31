class Note {
  int id;
  String title;
  String content;

  Note({
    required this.id,
    required this.title,
    required this.content,
  });
}

// Sample list of notes
List<Note> notes = [
  Note(id: 1, title: 'Note 1', content: 'Content 1'),
  Note(id: 2, title: 'Note 2', content: 'Content 2'),
  // Add more notes as needed
];

void updateNote(int id, String title, String content) {
  // Find the note by id
  for (var note in notes) {
    if (note.id == id) {
      // Update the note's title and content
      note.title = title;
      note.content = content;
      break;
    }
  }
}
