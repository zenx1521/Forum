require 'rails_helper'
require_relative "../support/devise"


feature "view post" do
    let!(:post) {FactoryGirl.create(:post)}
    scenario "by visting index page" do
        login_user
        visit posts_path
        
        expect(page).to have_content post.title
        post.user.destroy
    end
end 