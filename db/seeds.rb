RelaxDB.delete_db "something_blue_development"
RelaxDB.use_db "something_blue_development"

seneca = User.by_login("seneca") || Factory(:user, :login => "seneca")
lucilius = User.by_login("lucilius") || Factory(:user, :login => "lucilius")
marcus = User.by_login("marcus") || Factory(:user, :login => "marcus")
cicero = User.by_login("cicero") || Factory(:user, :login => "cicero")
homer = User.by_login("homer") || Factory(:user, :login => "homer")
machiavelli = User.by_login("machiavelli") || Factory(:user, :login => "machiavelli")
cesare = User.by_login("cesare") || Factory(:user, :login => "cesare")

Factory(:lending, :category => "book", :title => "Letters from a Stoic", :from => seneca, :to => lucilius, :created_at => 500.years.ago, :time => 30)
Factory(:lending, :category => "book", :title => "The Prince", :from => machiavelli, :to => cesare, :created_at => 600.years.ago, :time => 30)
Factory(:lending, :category => "book", :title => "Odyssey", :from => homer, :to => cicero, :created_at => 550.years.ago, :time => 7)
Factory(:lending, :category => "book", :title => "Iliad", :from => homer, :to => machiavelli, :created_at => 400.years.ago, :time => 7)
Factory(:lending, :category => "book", :title => "Meditations", :from => marcus, :to => seneca, :created_at => 100.years.ago, :time => 300)
Factory(:lending, :category => "letter", :title => "Pro Sulla", :from => cicero, :to => marcus, :created_at => 200.years.ago, :time => 100)
Factory(:lending, :category => "cd", :title => "Arctic Monkeys - Your favorite worst nightmare", :from => marcus, :to => cesare, :created_at => 2.days.ago, :time => 21)