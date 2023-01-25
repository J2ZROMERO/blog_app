require "application_system_test_case"

class CreateCommentsTest < ApplicationSystemTestCase
  setup do
    @create_comment = create_comments(:one)
  end

  test "visiting the index" do
    visit create_comments_url
    assert_selector "h1", text: "Create comments"
  end

  test "should create create comment" do
    visit create_comments_url
    click_on "New create comment"

    fill_in "Authorid", with: @create_comment.AuthorId
    fill_in "Postid", with: @create_comment.PostId
    fill_in "Text", with: @create_comment.Text
    click_on "Create Create comment"

    assert_text "Create comment was successfully created"
    click_on "Back"
  end

  test "should update Create comment" do
    visit create_comment_url(@create_comment)
    click_on "Edit this create comment", match: :first

    fill_in "Authorid", with: @create_comment.AuthorId
    fill_in "Postid", with: @create_comment.PostId
    fill_in "Text", with: @create_comment.Text
    click_on "Update Create comment"

    assert_text "Create comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Create comment" do
    visit create_comment_url(@create_comment)
    click_on "Destroy this create comment", match: :first

    assert_text "Create comment was successfully destroyed"
  end
end
