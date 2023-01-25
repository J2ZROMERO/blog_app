require 'test_helper'

class PersonitaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personitum = personita(:one)
  end

  test 'should get index' do
    get personita_url
    assert_response :success
  end

  test 'should get new' do
    get new_personitum_url
    assert_response :success
  end

  test 'should create personitum' do
    assert_difference('Personitum.count') do
      post personita_url, params: { personitum: { Bio: @personitum.Bio, Name: @personitum.Name, Photo: @personitum.Photo, PostsCounter: @personitum.PostsCounter } }
    end

    assert_redirected_to personitum_url(Personitum.last)
  end

  test 'should show personitum' do
    get personitum_url(@personitum)
    assert_response :success
  end

  test 'should get edit' do
    get edit_personitum_url(@personitum)
    assert_response :success
  end

  test 'should update personitum' do
    patch personitum_url(@personitum), params: { personitum: { Bio: @personitum.Bio, Name: @personitum.Name, Photo: @personitum.Photo, PostsCounter: @personitum.PostsCounter } }
    assert_redirected_to personitum_url(@personitum)
  end

  test 'should destroy personitum' do
    assert_difference('Personitum.count', -1) do
      delete personitum_url(@personitum)
    end

    assert_redirected_to personita_url
  end
end
