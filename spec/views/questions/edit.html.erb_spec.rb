require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :title => "MyString",
      :body => "MyText",
      :resolved => false
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[title]"

      assert_select "textarea[name=?]", "question[body]"

      assert_select "input[name=?]", "question[resolved]"
    end
  end
end
