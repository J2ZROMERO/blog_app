require 'application_system_test_case'

class LikesTest < ApplicationSystemTestCase
  setup do
    @like = likes(:one)
  end

  test 'visiting the index' do
    visit likes_url
    assert_selector 'h1', text: 'Likes'
  end

  test 'should create like' do
    visit likes_url
    click_on 'New like'

    fill_in 'Authorid', with: @like.AuthorId
    fill_in 'Postid', with: @like.PostId
    click_on 'Create Like'

    assert_text 'Like was successfully created'
    click_on 'Back'
  end

  test 'should update Like' do
    visit like_url(@like)
    click_on 'Edit this like', match: :first

    fill_in 'Authorid', with: @like.AuthorId
    fill_in 'Postid', with: @like.PostId
    click_on 'Update Like'

    assert_text 'Like was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Like' do
    visit like_url(@like)
    click_on 'Destroy this like', match: :first

    assert_text 'Like was successfully destroyed'
  end
end
