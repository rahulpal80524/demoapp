require 'rails_helper'
include Rails.application.routes.url_helpers
RSpec.describe "posts/index", type: :view do
  before(:each) do
    @posts = assign(:posts, [
      FactoryBot.create(:post)
      FactoryBot.create(:post)
    ])
  end

  it "renders a list of posts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(@posts[0].title.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(@posts[1].title.to_s), count: 1

    assert_select cell_selector, text: Regexp.new(@posts[0].content.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(@posts[1].content.to_s), count: 1

    assert_select "iamg[src=?]", rails_blob_path(@posts[0].image, only_path: true), count: 1
    assert_select "iamg[src=?]", rails_blob_path(@posts[1].image, only_path: true), count: 1
  end
end
