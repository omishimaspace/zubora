# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

# シードネタ
# 釜玉たらこうどん
# 所要時間:5分未満
# レンチンした冷凍うどん1玉に卵黄、たらこパスタソースを1食分の1/3入れ(好みで調節して)あえる。最後にお好みでバターやら小葱やら海苔やら乗せて完。
# 王道ですが、めちゃくちゃ安上がりだしパスタ茹でる待ち時間があるならうどんチンして即食べる
#
# 材料；
# 冷凍うどん1玉
# 卵黄
# たらこパスタソース
# バター
# 小葱
# 海苔
# 作り方
# レンチンした冷凍うどん1玉に卵黄、たらこパスタソースを1食分の1/3入れ(好みで調節して)あえる。最後にお好みでバターやら小葱やら海苔やら乗せて完。

recipe = Recipe.create(name: '釜玉たらこうどん', elapsed_minutes: 5, category: Category.first)
Photo.create(url: 'https://omishima-space.com/common/img/kv1.jpg', photoable_type: "Recipe", photoable_id: recipe.id)

food1 = Food.create(name: '冷凍うどん玉')
Ingredient.create(food: food1, recipe: recipe, amount: 1, unit: '玉')
food2 = Food.create(name: '卵黄')
Ingredient.create(food: food2, recipe: recipe, amount: 1, unit: '個')
food3 = Food.create(name: 'たらこパスタソース')
Ingredient.create(food: food3, recipe: recipe, amount: 1, unit: '適量')
food4 = Food.create(name: 'バター')
Ingredient.create(food: food4, recipe: recipe, amount: 1, unit: '適量')
food5 = Food.create(name: '小葱')
Ingredient.create(food: food5, recipe: recipe, amount: 1, unit: '適量')
food6 = Food.create(name: '海苔')
Ingredient.create(food: food6, recipe: recipe, amount: 1, unit: '適量')

step1 = Step.create(recipe: recipe, position: 1, description: 'レンチンする')
Photo.create(url: 'https://omishima-space.com/common/img/kv1.jpg', photoable_type: "Step", photoable_id: step1.id)
step2 = Step.create(recipe: recipe, position: 2, description: '卵黄とたらこパスタソースを入れて和える')
Photo.create(url: 'https://omishima-space.com/common/img/kv1.jpg', photoable_type: "Step", photoable_id: step2.id)
step3 = Step.create(recipe: recipe, position: 3, description: '小ねぎとのりをのせる')
Photo.create(url: 'https://omishima-space.com/common/img/kv1.jpg', photoable_type: "Step", photoable_id: step3.id)

kitchenware = Kitchenware.create(name: '電子レンジ')
kitchenware2 = Kitchenware.create(name: '耐熱容器')
RecipeKitchenware.create(kitchenware: kitchenware, recipe: recipe)
RecipeKitchenware.create(kitchenware: kitchenware2, recipe: recipe)

