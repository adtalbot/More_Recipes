require('bundler/setup')
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  erb(:index)
end

post('/category_add') do
  name = params.fetch('name')
  Category.create({:name => name})
  @categories = Category.all()
  erb(:index)
end

get('/recipe_add') do
  @recipes = Recipe.all()
  erb(:recipe_form)
end

post('/recipe_add') do
  name = params.fetch('name')
  ingredients = params.fetch('ingredients')
  instructions = params.fetch('instructions')
  rating = params.fetch('rating')
  Recipe.create({:name => name, :ingredients => ingredients, :instructions => instructions, :rating => rating})
  @recipes = Recipe.all()
  erb(:recipe_form)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe_id)
end

patch('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  name = params.fetch('name')
  ingredients = params.fetch('ingredients')
  instructions = params.fetch('instructions')
  rating = params.fetch('rating')
  @recipe.update({:name => name, :ingredients => ingredients, :instructions => instructions, :rating => rating})
  @recipes = Recipe.all()
  erb(:recipe_id)
end

delete('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.delete()
  @recipes = Recipe.all
  @categories = Category.all()
  erb(:index)
end
