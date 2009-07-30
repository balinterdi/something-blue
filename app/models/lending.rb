class Lending < RelaxDB::Document
  property :title, :validator => :required
  property :category
  property :time, :validator => :required
  property :to, :validator => :required

  property :created_at
  
end
