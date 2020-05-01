#include <database_app.hpp>
#include <iostream>
#include <psqlorm.hpp>

using PSQLORM = Database::PSQLORM;
/**
 * Constructor
 */
APP::APP()
    : psqlorm(PSQLORM{DatabaseConfiguration{
          DatabaseCredentials{"vdi_tester", "vdi_tester", "vdi_test"},
          "127.0.0.1", "5432"}}) {}

/**
 * Constructor - For mocking
 */
APP::APP(Database::PSQLORM _psqlorm) : psqlorm(_psqlorm) {}

/**
 * @returns {uint32_t} The number of ID rows in the VDI table
 */
uint32_t APP::fetchIDCount() {
  auto result = psqlorm.select("vdi", {"id"}, QueryFilter{});
  return result.size();
}

/**
 * @returns {StrVec} A vector of all the names in the VDI table
 */
StrVec APP::fetchVDINames() {
  auto result = psqlorm.select("vdi", {"name"}, QueryFilter{});
  StrVec sv{};
  for (const auto& name : result) {
    sv.push_back(name.second);
  }
  return sv;
}

/**
 * @returns {StrVec} A vector of all the names in the VDI table
 */
StrVec APP::fetchCharacterTypes() {
  auto result = psqlorm.select("character", {"name"}, QueryFilter{});
  StrVec sv{};
  for (const auto& name : result) {
    sv.push_back(name.second);
  }
  return sv;
}

/**
 * @param [in] {std::string} name The name of the person for whose character to
 * fetch
 */
std::string APP::fetchCharacterForName(std::string name) {
  auto result =
      psqlorm.select("vdi", {"character"}, QueryFilter{{"name", name}});
  std::string character_string{};
  if (!result.empty() && !result[0].second.empty()) {
    for (const auto& character : result) {
      try {
        auto c_result = psqlorm.select("character", {"name"},
                                       QueryFilter{{"id", character.second}});
        for (const auto& name : c_result) {
          character_string = name.second;
        }
      } catch (pqxx::sql_error e) {
        std::cout << e.what() << std::endl;
      }
    }
  }
  return character_string;
}

/**
 *
 */
bool APP::updateCharacterForName(std::string name, std::string character) {
  auto character_result =
      psqlorm.select("character", {"id"}, QueryFilter{{"name", character}});
  std::string character_id{};
  if (character_result.empty() || character_result[0].second.empty()) {
    character_id = psqlorm.insert("character", {"name"}, {character}, "id");
  } else {
    character_id = character_result[0].second;
  }
  if (!character_id.empty()) {
    auto update_result = psqlorm.update("vdi", {"character"}, {character_id},
                                        QueryFilter{{"name", name}}, "id");
    return (!update_result.empty());
  }
  return false;
}
