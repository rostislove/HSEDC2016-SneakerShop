# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def upload_fake_image
  uploader = SneakerImageUploader.new(Sneaker.new, :sneakerimage)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

Brand.create([
  {
    name: 'Adidas'
  },{
    name: 'Asics'
  },{
    name: 'Brooks'
  },{
    name: 'Converse'
  },{
    name: 'DC'
  },{
    name: 'Fila'
  },{
    name: 'Keds'
  },{
    name: 'Merrell'
  },{
    name: 'New Balance'
  },{
    name: 'Nike'
  },{
    name: 'Reebok'
  },{
    name: 'Umbro'
  },{
    name: 'Under Armour'
  },{
    name: 'Vans'
  }
])

@sneaker_name = ['NMD_R2 PRIMEKNIT','GEL-QUANTUM 360 KNIT','1978 New Balance','574 Retro Sport','TRIPLE LEATHER','999 Classic']
@sneaker_size = ['7','7.5','8','8.5','9','9.5','10','10.5','11']
@sneaker_sex = ['Men', 'Women']

def create_sneaker
  Sneaker.create(
    name: @sneaker_name.sample,
    brand_id: random_brand_id,
    price: '$79.99',
    size: @sneaker_size.sample,
    sex: @sneaker_sex.sample,
    sneakerimage: upload_fake_image
  )
end

16.times do
  create_sneaker
  puts "Sneaker created"
end
