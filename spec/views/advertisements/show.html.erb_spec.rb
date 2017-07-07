require 'rails_helper'

RSpec.describe "advertisements/show", type: :view do
  before(:each) do
    @advertisement = assign(:advertisement, Advertisement.create!(
      :title => "Title",
      :body => "MyText",
      :price => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
