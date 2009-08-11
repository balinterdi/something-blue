class RelaxDB::Document
  #FIXME: this is good only as long as it is only used for _creating_
  # documents with the form_for helper. For edit/update, this will have to be properly written.
  # def new_record?
  #   true
  # end
  def create(params)
    new(params)
    save
    self
  end
end