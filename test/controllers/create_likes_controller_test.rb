require 'test_helper'

class CreateLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_like = create_likes(:one)
  end

  test 'should get index' do
    get create_likes_url
    assert_response :success
  end

  test 'should get new' do
    get new_create_like_url
    assert_response :success
  end

  test 'should create create_like' do
    assert_difference('CreateLike.count') do
      post create_likes_url, params: { create_like: { AuthorId: @create_like.AuthorId, PostId: @create_like.PostId } }
    end

    assert_redirected_to create_like_url(CreateLike.last)
  end

  test 'should show create_like' do
    get create_like_url(@create_like)
    assert_response :success
  end

  test 'should get edit' do
    get edit_create_like_url(@create_like)
    assert_response :success
  end

  test 'should update create_like' do
    patch create_like_url(@create_like), params: { create_like: { AuthorId: @create_like.AuthorId, PostId: @create_like.PostId } }
    assert_redirected_to create_like_url(@create_like)
  end

  test 'should destroy create_like' do
    assert_difference('CreateLike.count', -1) do
      delete create_like_url(@create_like)
    end

    assert_redirected_to create_likes_url
  end
end
