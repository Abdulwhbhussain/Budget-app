# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# prepare seeds for users

# prepare seeds for categories

# prepare seeds for deals

# prepare seeds for deals_categories

user1 = User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password', name: 'John')

category1 = Category.create(name: 'Food', icon: 'fas fa-utensils', author_id: user1.id)

category2 = Category.create(name: 'Transport', icon: 'fas fa-bus', author_id: user1.id)

category3 = Category.create(name: 'Entertainment', icon: 'fas fa-gamepad', author_id: user1.id)

deal1 = Deal.create(name: 'Lunch', amount: 10, author_id: user1.id)

deal2 = Deal.create(name: 'Bus ticket', amount: 2, author_id: user1.id)

deal3 = Deal.create(name: 'Cinema', amount: 15, author_id: user1.id)

category1.deals << deal1

category2.deals << deal2

category3.deals << deal3




