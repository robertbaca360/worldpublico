# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute("TRUNCATE users")
ActiveRecord::Base.connection.reset_pk_sequence!('users')
admin = User.create!({
					name: 'Admin',
					email: 'admin@example.com',
					password: 'password',
					password_confirmation: 'password'
				})

ActiveRecord::Base.connection.execute("TRUNCATE roles")
ActiveRecord::Base.connection.reset_pk_sequence!('roles')
['individual', 'organization', 'business'].each do |role_name|
  Role.create! name: role_name
end