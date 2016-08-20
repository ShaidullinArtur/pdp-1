require "rails_helper"

feature "Send Feedback" do
  context "when user signed in" do
    include_context "current user signed in"

    scenario "User send feedback" do
      visit new_feedback_path

      within ".new_feedback" do
        expect(find_field("Email").value).to eq(current_user.email)

        fill_in "Text", with: "New Feedback Text"

        click_button("Create Feedback")
      end

      expect(page).to have_content("Thank's for your Feedback")

      email = open_last_email

      expect(email).to have_subject("New feedback")
      expect(email).to have_body_text(current_user.email)
      expect(email).to have_body_text("New Feedback Text")
    end
  end

  scenario "Visitor send feedback" do
    visit new_feedback_path

    within ".new_feedback" do
      expect(find_field("Email").value).to be_nil

      fill_in "Email", with: "visitor@mail.com"
      fill_in "Text", with: "New Feedback Text"

      click_button("Create Feedback")
    end

    expect(page).to have_content("Thank's for your Feedback")

    email = open_last_email

    expect(email).to have_subject("New feedback")
    expect(email).to have_body_text("visitor@mail.com")
    expect(email).to have_body_text("New Feedback Text")
  end

  scenario "Visitor send feedback with invalid params" do
    visit new_feedback_path

    within ".new_feedback" do
      fill_in "Text", with: "New Feedback Text"

      click_button("Create Feedback")
    end

    expect(page).to have_content("Feedback could not be created.")
    expect(page).to have_content("can't be blank")
  end
end
