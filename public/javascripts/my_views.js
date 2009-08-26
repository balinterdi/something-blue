// user.lendings
function(doc) {
  var class_match = ["Lending"].indexOf(doc.relaxdb_class) >= 0;
  if (class_match && doc.from_id) {
    emit(doc.from_id, doc);
  }
}
