Recipe.destroy_all

data = Rails.root.join('scripts/items_saruwaka_10.json')

if File.exist?(data)
  recipe_data = JSON.parse(File.read(data), { symbolize_names: true })
  recipe_data.each do |data|
    ingredients = data.delete(:ingredients)
    steps = data.delete(:steps)
    hashied_data = Hashie::Mash.new(data)
    recipe = Recipe.find_or_create_by(name: hashied_data.name)
    recipe.attributes = {
        name: hashied_data.title,
        category_id: 1, #和食
        elapsed_minutes: hashied_data.elapsed_minutes || 999,
        original_url: hashied_data.original_url,
        description: hashied_data.description
    }
    recipe.save!

    ingredients.each do |ingredient|
      name, amount = ingredient.to_a.flatten
      food = Food.find_or_create_by(name: name)
      recipe.ingredients.create(food: food, unit: amount, amount: 1)
    end

    steps.each_with_index do |step, index|
      recipe.steps.create(description: "#{step[:title]} #{step[:description]}", position: index + 1)
    end
    print '.'
  end
end