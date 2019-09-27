# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Importa a gem faker para gerar dados reais
require 'faker'

# Cria Centros de Custo
5.times do |x|
  CostCenter.create(name:Faker::Company.industry)
end

#Cria aplicações atreladas aos centros de custo
5.times do |x|
  App.create(name: "aplicação #{x}", cost_center_id: x+1)
end

#Cria entregas
5.times do |x|
  Delivery.create(address: "#{Faker::Address.street_address} #{Faker::Address.secondary_address}", status: "a caminho" )
end

#Cria despesas
5.times do |x|
  5.times do |y|
    Expense.create(amount: rand 100..1000000, cost_center_id: x)
  end
end