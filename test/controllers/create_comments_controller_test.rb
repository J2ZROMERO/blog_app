require "test_helper"

class CreateCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_comment = create_comments(:one)
  end

  test "should get index" do
    get create_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_create_comment_url
    assert_response :success
  end

  test "should create create_comment" do
    assert_difference("CreateComment.count") do
      post create_comments_url, params: { create_comment: { AuthorId: @create_comment.AuthorId, PostId: @create_comment.PostId, Text: @create_comment.Text } }
    end

    assert_redirected_to create_comment_url(CreateComment.last)
  end

  test "should show create_comment" do
    get create_comment_url(@create_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_comment_url(@create_comment)
    assert_response :success
  end

  test "should update create_comment" do
    patch create_comment_url(@create_comment), params: { create_comment: { AuthorId: @create_comment.AuthorId, PostId: @create_comment.PostId, Text: @create_comment.Text } }
    assert_redirected_to create_comment_url(@create_comment)
  end

  test "should destroy create_comment" do
    assert_difference("CreateComment.count", -1) do
      delete create_comment_url(@create_comment)
    end

    assert_redirected_to create_comments_url
  end
end
