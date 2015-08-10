require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest

  #include Sorcery::TestHelpers::Internal::Rails

  def setup
    @user = users(:raul)
  end
=begin
  test "please log in" do
    get login_path
    login_user(users = @usesdsdr, route = login_url, http_method = :dasdaget)
    #post login_path, session: { email: @user.email, password: 'secret' }
    assert_redirected_to @user
    assert logged_in?
  end
=end
end
