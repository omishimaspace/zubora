# スクレイピングデータを取り込むスクリプト
# bundle exec rails r scripts/import_recipes.rb
Recipe.destroy_all

file = Rails.root.join('scripts/items_saruwaka_10.json')
exit unless File.exists?(file)
recipe_data = JSON.parse(File.read(file), { symbolize_names: true })

Recipe.transaction do
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
    unless recipe.photos.exists?
      recipe.photos.create!(url: hashied_data.main_image) if hashied_data.main_image
    end

    ingredients.each do |ingredient|
      name, amount = ingredient.to_a.flatten
      food = Food.find_or_create_by(name: name)
      recipe.ingredients.create!(food: food, unit: amount, amount: 1)
    end

    steps.each_with_index do |step_data, index|
      step = recipe.steps.create!(description: "#{step_data[:title]} #{step_data[:description]}", position: index + 1)
      step.photos.create!(url: step_data[:image]) if step_data[:image]
    end
  end
end
