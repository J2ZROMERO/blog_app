require 'application_system_test_case'

class CreatePostsTest < ApplicationSystemTestCase
  setup do
    @create_post = create_posts(:one)
  end

  test 'visiting the index' do
    visit create_posts_url
    assert_selector 'h1', text: 'Create posts'
  end

  test 'should create create post' do
    visit create_posts_url
    click_on 'New create post'

    fill_in 'Authorid', with: @create_post.AuthorId
    fill_in 'Commentscounter', with: @create_post.CommentsCounter
    fill_in 'Likescounter', with: @create_post.LikesCounter
    fill_in 'Text', with: @create_post.Text
    fill_in 'Title', with: @create_post.Title
    click_on 'Create Create post'

    assert_text 'Create post was successfully created'
    click_on 'Back'
  end

  test 'should update Create post' do
    visit create_post_url(@create_post)
    click_on 'Edit this create post', match: :first

    fill_in 'Authorid', with: @create_post.AuthorId
    fill_in 'Commentscounter', with: @create_post.CommentsCounter
    fill_in 'Likescounter', with: @create_post.LikesCounter
    fill_in 'Text', with: @create_post.Text
    fill_in 'Title', with: @create_post.Title
    click_on 'Update Create post'

    assert_text 'Create post was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Create post' do
    visit create_post_url(@create_post)
    click_on 'Destroy this create post', match: :first

    assert_text 'Create post was successfully destroyed'
  end
end
