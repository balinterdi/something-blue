class Lending < RelaxDB::Document
  property :title, :validator => :required
  property :category
  property :time, :validator => :required

  references :from, :validator => :required
  references :to, :validator => :required

  property :created_at

  view_by :title
end
