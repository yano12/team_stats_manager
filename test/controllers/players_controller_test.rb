require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @player = players(:michael)
    @other_player = players(:archer)
  end
  
  test "should get new" do 
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_player_path(@player)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch player_path(@player), params: { player: { name: @player.name,
                                              email: @player.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_player)
    assert_not @other_player.admin?
    patch player_path(@other_player), params: {
                                    player: { password: @other_player.password,
                    password_confirmation: @other_player.password_confirmation,
                    admin: true } }
    assert_not @other_player.reload.admin?
  end
  
  test "should redirect edit when logged in as wrong player" do
    log_in_as(@other_player)
    get edit_player_path(@player)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong player" do
    log_in_as(@other_player)
    patch player_path(@player), params: { player: { name: @player.name,
                                              email: @player.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Player.count' do
      delete player_path(@player)
    end
    assert_redirected_to login_url
  end

#  test "should redirect destroy when logged in as a non-admin" do
#    log_in_as(@other_player)
#    assert_no_difference 'Player.count' do
#      delete player_path(@player)
#    end
#    assert_redirected_to root_url
#  end
end
