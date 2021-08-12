require 'pry'
## QUESTION 1

pokemon = [
  {
    "id": 1,
    "name": "bulbasaur",
    "base_experience": 64,
    "height": 7,
    "is_default": true,
    "order": 1,
    "weight": 69,
    "abilities": [
        {
            "is_hidden": true,
            "slot": 3,
            "ability": {
                "name": "chlorophyll",
                "url": "http://pokeapi.co/api/v2/ability/34/"
            }
        }
    ]
},
{
  "id": 3,
  "name": "venesaur",
  "base_experience": 50,
  "height": 10,
  "is_default": true,
  "order": 1,
  "weight": 90,
  "abilities": [
      {
          "is_hidden": true,
          "slot": 3,
          "ability": {
              "name": "fire",
              "url": "http://pokeapi.co/api/v2/ability/38/"
          }
      }
  ]
},
{
  "id": 2,
  "name": "pikachu",
  "base_experience": 60,
  "height": 4,
  "is_default": true,
  "order": 1,
  "weight": 37,
  "abilities": [
      {
          "is_hidden": true,
          "slot": 3,
          "ability": {
              "name": "lightning",
              "url": "http://pokeapi.co/api/v2/ability/30/"
          }
      }
  ]
}
]

class Pokemon
    @@pokemon_array = []

    def initialize(attributes = nil)
        # pokemon_array.each do |pokemon|
        if attributes    
            attributes.each do |key, value|
                self.class.attr_accessor(key)
                self.send("#{key}=", value)
                @@pokemon_array << self
            end
        end
    end
  
    def ability_url
        # [:abilities][0][:ability][:url]
        ab_hash = self.abilities
        # binding.pry
        ab_hash[0][:ability][:url]
    end

    def self.over_40
        ret_pokemon = @@pokemon_array.find do |pokemon|
            pokemon.base_experience > 40
        end
        ret_pokemon.name
    end

    def self.all_over_40
        ret_pokemon = Pokemon.all.filter do |pokemon|
            pokemon.base_experience > 40
        end
        ret_pokemon
    end

    def self.all
        @@pokemon_array.uniq
    end
end

bulbasaur = Pokemon.new(pokemon[0])
venesaur = Pokemon.new(pokemon[1])
pikachu = Pokemon.new(pokemon[2])
# puts bulbasaur.ability_url
# binding.pry
# pokemon.each {|poke| Pokemon.new(poke)}
# binding.pry
puts Pokemon.all_over_40
# puts Pokemon.all

# How would you get the url for Bulbasaur's ability? DONEEEEEEEEE FUCK YOU
# How would you return the first pokemon with base experience over 40? AAAAAAAAAAAA
# How would you return ALL OF THE pokemon with base experience over 40? (Gotta catch em all) I AM DED
# How would you return an array of all of the pokemon's names?
# How would you determine whether or not the pokemon array contained any pokemon with a weight greater than 60?
#  whatever method you use should return true if there are any such pokemon, false if not.
