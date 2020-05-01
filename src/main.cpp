#include <httplib.h>

#include <database_app.hpp>
#include <psqlorm.hpp>

using namespace httplib;

APP app;

namespace TestServer {
void handle_requests(Server&& svr) {
  svr.Get("/hi", [](const Request& req, Response& res) {
    res.set_content("Hello VDI!", "text/plain");
  });

  svr.Get("/vdi", [](const Request& req, Response& res) {
    std::string names_string{};
    for (const auto& name : app.fetchVDINames()) {
      names_string += name + "\n";
    }
    res.set_content(names_string, "text/plain");
  });

  svr.Get("/characters", [](const Request& req, Response& res) {
    std::string names_string{};
    for (const auto& name : app.fetchCharacterTypes()) {
      names_string += name + "\n";
    }
    res.set_content(names_string, "text/plain");
  });

  svr.Get("/vdi/character", [](const Request& req, Response& res) {
    auto param_it = req.params.find("name");
    if (param_it != req.params.end()) {
      auto name = param_it->second;
      auto character = app.fetchCharacterForName(name);
      std::string return_string{name + "'s character: " + character + "\n"};
      res.set_content(return_string, "text/plain");
    }
  });

  svr.Get("/vdi/character/update", [](const Request& req, Response& res) {
    auto name_it = req.params.find("name");
    auto char_it = req.params.find("character");
    if (name_it != req.params.end() && char_it != req.params.end()) {
      auto update_result =
          app.updateCharacterForName(name_it->second, char_it->second);
      res.set_content(update_result ? "Success" : "Failure", "text/plain");
    }
  });

  svr.Get("/stop", [&](const Request& req, Response& res) { svr.stop(); });
}  // namespace TestServer

void start_http_server() {
  Server svr{};
  handle_requests(std::move(svr));
  std::cout << "Starting HTTP server.." << std::endl;
  std::cout << "Connect to http://localhost:9820" << std::endl;
  svr.listen("localhost", 9820);
}
}  // namespace TestServer

int main(int argc, char** argv) {
  app = APP{};
  TestServer::start_http_server();
  return 0;
}

