FactoryGirl.define do
  Factory.define(:taxonomy) do |t|
	t.name { Factory.next(:taxonomy_name) }
  end
  
  Factory.define(:taxons, :class => Taxon) do |t|
	t.name { Factory.next(:taxon_name) }
	t.association :taxonomy
  end

  sequence :taxonomy_name do |id|
	"Taxonomy #{id}"
  end

  sequence :taxon_name do |id|
	"Taxon #{id}"
  end
end