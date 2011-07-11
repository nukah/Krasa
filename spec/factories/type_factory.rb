FactoryGirl.define do
  factory :type, :class => Type do
	name "Test type"
	presentation "Testing Presentation"
	first true
  end

  factory :invalid_type, :class => Type do
	name ""
	presentation "Invalid test presentation"
	first false
  end

  factory :type_with_taxons, :class => Type do
	name "Type with taxons"
	presentation "Type with taxons presentation"
	first false
	taxons { Factory.build(:taxons, 4) }
  end
end