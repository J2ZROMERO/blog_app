require 'application_system_test_case'

class CreateUsersTest < ApplicationSystemTestCase
  setup do
    @create_user = create_users(:one)
  end

  test 'visiting the index' do
    visit create_users_url
    assert_selector 'h1', text: 'Create users'
  end

  test 'should create create user' do
    visit create_users_url
    click_on 'New create user'

    fill_in 'Bio', with: @create_user.Bio
    fill_in 'Name', with: @create_user.Name
    fill_in 'Photo', with: @create_user.Photo
    fill_in 'Postscounter', with: @create_user.PostsCounter
    click_on 'Create Create user'

    assert_text 'Create user was successfully created'
    click_on 'Back'
  end

  test 'should update Create user' do
    visit create_user_url(@create_user)
    click_on 'Edit this create user', match: :first

    fill_in 'Bio', with: @create_user.Bio
    fill_in 'Name', with: @create_user.Name
    fill_in 'Photo', with: @create_user.Photo
    fill_in 'Postscounter', with: @create_user.PostsCounter
    click_on 'Update Create user'

    assert_text 'Create user was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Create user' do
    visit create_user_url(@create_user)
    click_on 'Destroy this create user', match: :first

    assert_text 'Create user was successfully destroyed'
  end
end
