class Lending < RelaxDB::Document
  property :title, :validator => :required
  property :category
  property :time, :validator => :required

  references :from, :validator => :required, :validation_msg => "was not given" # = belongs_to :from, ...
  references :to, :validator => :required # = belongs_to :to, ...

  property :created_at

  view_by :title
  view_by :created_at

  v = RelaxDB::View.new "Lending_overdue", <<-QUERY, RelaxDB::ViewCreator.sum_reduce_func
    function(doc) {
      var class_match = #{RelaxDB::ViewCreator.kls_check("Lending")};
      if (class_match && doc.created_at) {
        var now = new Date();
        var created_at_with_dashes = doc.created_at.match(/(.*)T/)[1];
        var created_at = new Date(created_at_with_dashes.replace(/-/g, '/'));
        var loan_deadline = new Date(created_at.setDate(created_at.getDate() + doc.time));
        if (loan_deadline < now) {
          emit(loan_deadline, doc);
        }
      }
    }
  QUERY
  v.save
  
  # see RelaxDB::Document
  meta_class.instance_eval do
    define_method :overdue do |*params|
      view_name = "Lending_overdue"
      if params.empty?
        res = RelaxDB.view view_name, { :reduce => false }
      end
    end
  end
  

  borrowed_map_func = <<-MAP
    function(doc) {
      if (doc.relaxdb_class == "User") {
        emit([doc._id, 0], doc);
      }
      if (doc.relaxdb_class == "Lending" && doc.to_id) {
          emit([doc.to_id, 1], doc);
      }
    }
  MAP
  
  borrowed_reduce_func = <<-REDUCE
    function(keys, values, rereduce) {
      return values.length;
    }
  REDUCE
  
  v = RelaxDB::View.new "Lending_borrowed_by_user", borrowed_map_func, borrowed_reduce_func  
  v.save
  
  meta_class.instance_eval do
    define_method :borrowed_by_user do |*params|
      view_name = "Lending_borrowed_by_user"
      if params.empty?
        res = RelaxDB.view view_name, { :reduce => false }
      end      
    end
  end

  v = RelaxDB::View.new "Lending_by_created_at_date", <<-QUERY, RelaxDB::ViewCreator.sum_reduce_func
    function(doc) {
      var class_match = #{RelaxDB::ViewCreator.kls_check("Lending")};
      if (class_match && doc.created_at) {
        var created_at_with_dashes = doc.created_at.match(/(.*)T/)[1];
        var created_at = created_at_with_dashes.replace(/-/g, '/');
        emit(created_at, doc.title);
      }
    }
  QUERY
  v.save

  # before_save :set_created_at

  private
  def set_created_at
    if new_document? && respond_to?(:created_at)
      @created_at = Time.now[/(.*)T/, 1]
    end
  end

end
