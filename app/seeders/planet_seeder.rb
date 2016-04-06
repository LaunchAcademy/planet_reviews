class PlanetSeeder
  class << self
    def planets_params
      [
        {
          name: "Mercury",
          diameter_in_km: 4_879,
          mass_in_kg: 3.29e23,
          moons: 0,
          min_temp_in_c: -173,
          max_temp_in_c: 427,
          description: "The closest planet to the Sun."
        },
        {
          name: "Venus",
          diameter_in_km: 12_104,
          mass_in_kg: 4.87e24,
          moons: 0,
          max_temp_in_c: 462,
          description: "The second planet from the Sun."
        },
        {
          name: "Earth",
          diameter_in_km: 12_756,
          mass_in_kg: 5.97e24,
          moons: 1,
          min_temp_in_c: -88,
          max_temp_in_c: 58,
          description: "The third planet from the Sun."
        },
        {
          name: "Mars",
          diameter_in_km: 6_752,
          mass_in_kg: 6.39e23,
          moons: 2,
          min_temp_in_c: -87,
          max_temp_in_c: -5,
          description: "The Red Planet."
        },
        {
          name: "Jupiter",
          diameter_in_km: 142_984,
          mass_in_kg: 1.90e27,
          moons: 67,
          max_temp_in_c: -108,
          description: "A gas giant."
        },
        {
          name: "Saturn",
          diameter_in_km: 120_536,
          mass_in_kg: 5.68e26,
          moons: 62,
          max_temp_in_c: -139,
          description: "The most distant planet that can be seen with the naked eye."
        },
        {
          name: "Uranus",
          diameter_in_km: 51_118,
          mass_in_kg: 8.68e25,
          moons: 27,
          max_temp_in_c: -197,
          description: "The third largest planet in the Solar System."
        },
        {
          name: "Neptune",
          diameter_in_km: 49_528,
          mass_in_kg: 1.02e26,
          moons: 14,
          max_temp_in_c: -201,
          description: "The eighth planet from the Sun."
        },
        {
          name: "Pluto",
          diameter_in_km: 2_372,
          mass_in_kg: 1.31e22,
          moons: 5,
          max_temp_in_c: -229,
          description: "Recently downgraded to a dwarf planet. Poor Pluto."
        },
        {
          name: "Planet Nine",
          mass_in_kg: 6e25,
          description: "Maybe it exists? Current status: 'Hypothetical'."
        },
      ]
    end

    def seed
      planets_params.each do |planet_params|
        planet = Planet.find_or_initialize_by(name: planet_params[:name])
        planet.user = User.admin
        planet.update_attributes!(planet_params)
      end
    end
  end
end
