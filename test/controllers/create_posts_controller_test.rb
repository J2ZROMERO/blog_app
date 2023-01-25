require "test_helper"

class CreatePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_post = create_posts(:one)
  end

  test "should get index" do
    get create_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_create_post_url
    assert_response :success
  end

  test "should create create_post" do
    assert_difference("CreatePost.count") do
      post create_posts_url, params: { create_post: { AuthorId: @create_post.AuthorId, CommentsCounter: @create_post.CommentsCounter, LikesCounter: @create_post.LikesCounter, Text: @create_post.Text, Title: @create_post.Title } }
    end

    assert_redirected_to create_post_url(CreatePost.last)
  end

  test "should show create_post" do
    get create_post_url(@create_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_post_url(@create_post)
    assert_response :success
  end

  test "should update create_post" do
    patch create_post_url(@create_post), params: { create_post: { AuthorId: @create_post.AuthorId, CommentsCounter: @create_post.CommentsCounter, LikesCounter: @create_post.LikesCounter, Text: @create_post.Text, Title: @create_post.Title } }
    assert_redirected_to create_post_url(@create_post)
  end

  test "should destroy create_post" do
    assert_difference("CreatePost.count", -1) do
      delete create_post_url(@create_post)
    end

    assert_redirected_to create_posts_url
  end
end
