#ifndef __DATABASE_APP_HPP__
#define __DATABASE_APP_HPP__
#include <stdint.h>

#include <psqlorm.hpp>
#include <vector>

using StrVec = std::vector<std::string>;

/**
 * Interface should provide methods to get:
 * 1. Member Count
 * 2. Member Names
 */
class VDIDataInterface {
 public:
  virtual uint32_t fetchIDCount() = 0;
  virtual StrVec fetchVDINames() = 0;
};

/**
 * \mainpage APP is used to test the PSQLORM library
 */
class APP : public VDIDataInterface {
 public:
  APP();
  APP(Database::PSQLORM psqlorm);
  /** Member count **/
  virtual uint32_t fetchIDCount() override;
  /** Names of members **/
  virtual StrVec fetchVDINames() override;
  /** Types of characters **/
  StrVec fetchCharacterTypes();
  /** Character for a member **/
  std::string fetchCharacterForName(std::string name);
  /** Change a member's character */
  bool updateCharacterForName(std::string name, std::string character);

 private:
  Database::PSQLORM psqlorm;
};

#endif  // __DATABASE_APP_HPP__

