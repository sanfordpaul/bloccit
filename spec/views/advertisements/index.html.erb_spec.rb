require 'rails_helper'

RSpec.describe "advertisements/index", type: :view do
  before(:each) do
    assign(:advertisements, [
      Advertisement.create!(
        :title => "Title",
        :body => "MyText",
        :price => 2
      ),
      Advertisement.create!(
        :title => "Title",
        :body => "MyText",
        :price => 2
      )
    ])
  end

  it "renders a list of advertisements" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
