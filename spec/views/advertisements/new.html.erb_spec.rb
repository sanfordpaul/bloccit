require 'rails_helper'

RSpec.describe "advertisements/new", type: :view do
  before(:each) do
    assign(:advertisement, Advertisement.new(
      :title => "MyString",
      :body => "MyText",
      :price => 1
    ))
  end

  it "renders new advertisement form" do
    render

    assert_select "form[action=?][method=?]", advertisements_path, "post" do

      assert_select "input[name=?]", "advertisement[title]"

      assert_select "textarea[name=?]", "advertisement[body]"

      assert_select "input[name=?]", "advertisement[price]"
    end
  end
end
