require 'rails_helper'

describe 'user index page tests', type: :feature do
  before :each do
    @usera = User.create(name: 'userA', bio: 'Writer', email: 'usera@example.com', password: '123456', post_counter: 0,
                         confirmed_at: Time.now)
    @userb = User.create(name: 'userB', bio: 'footballer', email: 'userb@example.com', password: 'helloworld',
                         post_counter: 0, confirmed_at: Time.now)
  end

  it 'shows username of the first user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'usera@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'userA'
  end

  it 'shows username of the second user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'userb@example.com'
      fill_in 'Password', with: 'helloworld'
    end
    click_button 'Log in'
    expect(page).to have_content 'userB'
  end

  it 'profile image for the first user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'usera@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_css('img')
  end

  it 'profile image for the second user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'userb@example.com'
      fill_in 'Password', with: 'helloworld'
    end
    click_button 'Log in'
    expect(page).to have_css('img')
  end

  it 'show the number of post value for the first user ' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'usera@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts: 0'
  end

  it 'show the number of post value for the second user ' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'userb@example.com'
      fill_in 'Password', with: 'helloworld'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts: 0'
  end
end
