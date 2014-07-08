require 'test_helper'

class ApiScreencastsTest < ActionDispatch::IntegrationTest
  test "get /api/screencasts.json" do
    get "/api/screencasts.json"
    assert_response :success
    assert body == Screencast.all.to_json
    screencasts = JSON.parse(response.body)
    assert screencasts.size == 3
    assert screencasts.any? { |screencast| screencast["title"] == screencasts(:fast_rails_commands).title }
  end

  test "get /api/screencasts/:id" do
    screencast = screencasts(:fast_rails_commands)
    get "/api/screencasts/#{screencast.id}.json"
    assert_response :success
    assert body = screencast.to_json
    assert JSON.parse(response.body)["title"] == screencast.title
  end
end