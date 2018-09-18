namespace :utils do
  desc "Gerar registros de testes no Banco de Dados."
  task seed: :environment do

    puts "Gerando Contatos (Contacts)..."
    100.times do |i|
        Contact.create!( 
          name: Faker::Name.name, 
          email: Faker::Internet.email,
          kind: Kind.all.sample, 
          rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
          # rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
        )
    end
    puts "Contatos (Contacts)...[OK]"

    puts "Gerando Endereços (Addresses)..."
    Contact.all.each do |contact|
        Address.create!( 
          street: Faker::Address.street_address, 
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contact
        )
    end
    puts "Endereços (Addresses)...[OK]"

    puts "Gerando Telefones (Phones)..."
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!( 
          phone: Faker::PhoneNumber.phone_number, 
          contact: contact
        )
      end
    end
    puts "Telefones (Phones)...[OK]"

  end
end
