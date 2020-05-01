#ifndef __DATABASE_APP_TEST_HPP__
#define __DATABASE_APP_TEST_HPP__

#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <database_app.hpp>

using ::testing::_;
using ::testing::AtLeast;
using ::testing::Return;

/**
 * isGreaterThan
 *
 * A custom assertion that works with GoogleTest's assertion system
 */
::testing::AssertionResult isGreaterThan(int a, int b) {
  if (a > b) {
    return ::testing::AssertionSuccess();
  } else {
    return ::testing::AssertionFailure();
  }
}

/**
 * Mock Classes
 */

/** Mock DB Library */
class MockDB : public Database::PSQLORM {
  public:
  MockDB() {}
  MockDB(DatabaseInterface* db_interface, DatabaseConfiguration config) {}
  MOCK_METHOD3(select, QueryValues(std::string table, Fields fields,
                     QueryFilter filter));
};

/** Mock Interface */
class MockDBInterface : public DatabaseInterface {
  public:
  MockDBInterface() {}

  MOCK_METHOD1(query, QueryResult(DatabaseQuery query));
  MOCK_METHOD1(query, std::string(InsertReturnQuery query));
  MOCK_METHOD1(query, std::string(UpdateReturnQuery query));
  MOCK_METHOD1(setConfig, bool(DatabaseConfiguration config));
};

/**
 * App Instantiates and is not null
 */
TEST(Database, AppNotNullTest) {
  APP app{};

  EXPECT_NE(&app, nullptr);
}

/**
 * fetchIDCount
 */
TEST(Database, AppFetchCountTest) {
  APP app{};
  auto count = app.fetchIDCount();
  EXPECT_EQ(count, 7);
}

/**
 * fetchCharacterForName
 */
TEST(Database, AppFetchCharacterForNameTest) {
  APP app{};
  auto name = app.fetchCharacterForName("Don");
  EXPECT_EQ(name, "artisan");
}

/**
 * fetchVDINames
 */
TEST(Database, AppFetchVDINamesTest) {
  APP app{};
  auto names = app.fetchVDINames();
  EXPECT_TRUE(isGreaterThan(names.size(), 0));
}

/**
 * updateCharacterForName
 */
TEST(Database, AppUpdateVDICharacterTest) {
  APP app{};

  auto original_character_name = app.fetchCharacterForName("Patrick");

  // First update
  auto first_update_result = app.updateCharacterForName(
      "Patrick",
      std::string{original_character_name + original_character_name});
  auto updated_character_name = app.fetchCharacterForName("Patrick");

  // Second update (back to original)
  auto second_update_result =
      app.updateCharacterForName("Patrick", original_character_name);
  auto final_character_name = app.fetchCharacterForName("Patrick");

  EXPECT_EQ(first_update_result, true);  // Able to update
  EXPECT_NE(original_character_name,
            updated_character_name);      // Character changed
  EXPECT_EQ(second_update_result, true);  // Able to update again
  EXPECT_NE(updated_character_name, final_character_name);  // Character changed
  EXPECT_EQ(original_character_name,
            final_character_name);  // Character back to original
}

/**
 * Mock DB / Mock DB Interface
 */
TEST(Database, AppMockSelectTest) {
  MockDBInterface mock_db_interface{};
  MockDB mock_db{&mock_db_interface, DatabaseConfiguration{}};
  APP app{mock_db};
  app.fetchIDCount();

  EXPECT_CALL(mock_db, select).Times(1);
}

#endif  // __DATABASE_APP_TEST_HPP__
