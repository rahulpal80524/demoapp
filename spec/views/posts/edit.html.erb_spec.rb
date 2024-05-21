# spec/views/posts/edit.html.erb_spec.rb

require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:user) { FactoryBot.create(:user) } # Create a user using FactoryBot

  let(:post) {
    Post.create!(
      title: "MyString",
      content: "MyText",
      user: user # Assign the user to the post
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do
      assert_select "input[name=?]", "post[title]"
      assert_select "textarea[name=?]", "post[content]"
      assert_select "input[name=?]", "post[image]"
    end
  end
end
