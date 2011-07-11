FactoryGirl.define do
  factory :taxonomy do
	name { Factory.next(:taxonomy_name) }
  end
  
  factory :taxons, :class => Taxon do
	name { Factory.next(:taxon_name) }
	association :taxonomy
  end

  sequence :taxonomy_name do |id|
	"Taxonomy #{id}"
  end

  sequence :taxon_name do |id|
	"Taxon #{id}"
  end
end