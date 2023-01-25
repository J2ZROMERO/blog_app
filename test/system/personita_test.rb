require 'application_system_test_case'

class PersonitaTest < ApplicationSystemTestCase
  setup do
    @personitum = personita(:one)
  end

  test 'visiting the index' do
    visit personita_url
    assert_selector 'h1', text: 'Personita'
  end

  test 'should create personitum' do
    visit personita_url
    click_on 'New personitum'

    fill_in 'Bio', with: @personitum.Bio
    fill_in 'Name', with: @personitum.Name
    fill_in 'Photo', with: @personitum.Photo
    fill_in 'Postscounter', with: @personitum.PostsCounter
    click_on 'Create Personitum'

    assert_text 'Personitum was successfully created'
    click_on 'Back'
  end

  test 'should update Personitum' do
    visit personitum_url(@personitum)
    click_on 'Edit this personitum', match: :first

    fill_in 'Bio', with: @personitum.Bio
    fill_in 'Name', with: @personitum.Name
    fill_in 'Photo', with: @personitum.Photo
    fill_in 'Postscounter', with: @personitum.PostsCounter
    click_on 'Update Personitum'

    assert_text 'Personitum was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Personitum' do
    visit personitum_url(@personitum)
    click_on 'Destroy this personitum', match: :first

    assert_text 'Personitum was successfully destroyed'
  end
end
