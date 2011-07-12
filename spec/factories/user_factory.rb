FactoryGirl.define do
  Factory.define(:user) do |f|
	f.email { Faker::Internet.email }
	f.password "test50000"
	f.password_confirmation "test50000"
  end
  Factory.define(:user_admin,:parent => :user) do |f|
	f.roles { [Role.find_or_create_by_name('admin')] }
  end

end