Fixjour do
  define_builder(Profile) do |klass, overrides|
    klass.new(:city => 'Boulder', :description => 'this is a text description')
  end

end
