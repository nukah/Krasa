FactoryGirl.define do
  Factory.define(:type, :class => Type) do |t|
	t.name "Test type"
	t.presentation "Testing Presentation"
	t.first true
  end

  Factory.define(:invalid_type, :class => Type) do |t|
	t.name ""
	t.presentation "Invalid test presentation"
	t.first false
  end

  Factory.define(:type_with_taxons, :class => Type) do |t|
	t.taxons { Factory.build(:taxons, 4) }
  end
end