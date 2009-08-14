class Lending < RelaxDB::Document
  property :title, :validator => :required
  property :category
  property :time, :validator => :required

  references :from, :validator => :required, :validation_msg => "was not given" # = belongs_to :from, ...
  references :to, :validator => :required # = belongs_to :to, ...

  property :created_at

  view_by :title
end
