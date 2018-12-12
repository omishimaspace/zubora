class RecipeScoringService
  attr_accessor :recipe

  # - ステップ数が低い
  # - 食材の数
  # - 食材の栄養素カラム（まだない）をサマリした値が大きいこと
  # - 器具が少ない
  #   - 電子レンジ　○
  #   - フライパン　☓

  FACTORS = {
    step_count: 1.5,
    food_count: 1.25,
    food_nutrient: 2,
    wares: [
      {
        microwave: 1.5,
        fryingpan: 1.0,
      }
    ]
  }.freeze

  MAX_SCORE = 100.0.freeze

  def initialize recipe
    @recipe = recipe
  end

  def execute
    MAX_SCORE - count_strength
  end


  def count_strength
    counts = {
      step_count: step_count,
      food_count: food_count
      # food_nutrient: food_nutrient(user, second_user),
      # wares: wares(second_user, user)
    }
    weights = counts.map { |key, _| counts[key] * FACTORS[key] }
    weights.sum
  end

  def step_count
    # delegate しようか
    recipe.steps.count
  end

  def food_count
    recipe.foods.count
  end
end