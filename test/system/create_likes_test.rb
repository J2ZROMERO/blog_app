require "application_system_test_case"

class CreateLikesTest < ApplicationSystemTestCase
  setup do
    @create_like = create_likes(:one)
  end

  test "visiting the index" do
    visit create_likes_url
    assert_selector "h1", text: "Create likes"
  end

  test "should create create like" do
    visit create_likes_url
    click_on "New create like"

    fill_in "Authorid", with: @create_like.AuthorId
    fill_in "Postid", with: @create_like.PostId
    click_on "Create Create like"

    assert_text "Create like was successfully created"
    click_on "Back"
  end

  test "should update Create like" do
    visit create_like_url(@create_like)
    click_on "Edit this create like", match: :first

    fill_in "Authorid", with: @create_like.AuthorId
    fill_in "Postid", with: @create_like.PostId
    click_on "Update Create like"

    assert_text "Create like was successfully updated"
    click_on "Back"
  end

  test "should destroy Create like" do
    visit create_like_url(@create_like)
    click_on "Destroy this create like", match: :first

    assert_text "Create like was successfully destroyed"
  end
end
