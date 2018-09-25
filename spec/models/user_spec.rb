require "rails_helper"

RSpec.describe User, type: :model do
  let(:admin) {FactoryBot.build :admin}
  let!(:user1) {FactoryBot.create(:user, name: "phamvanle1")}
  let!(:user2) {FactoryBot.create(:user, name: "phamvanle2")}
  let!(:user3) {FactoryBot.create(:user, name: "example")}

  it "is admin" do
    expect(admin.role).to eq("admin")
  end

  context "validates" do
    it "check the presence of name" do
      is_expected.to validate_presence_of(:name)
    end

    it "check the presence of email" do
      is_expected.to validate_presence_of(:email)
    end

    it "check the presence of password" do
      is_expected.to validate_presence_of(:password)
    end

    it "check the presence of address" do
      is_expected.to validate_presence_of(:address)
    end

    it "check the presence of phone" do
      is_expected.to validate_presence_of(:phone)
    end

    it "check max length of name" do
      is_expected.to validate_length_of(:name)
    end

    it "check max length of email" do
      is_expected.to validate_length_of(:email)
    end

    it "check max length of address" do
      is_expected.to validate_length_of(:address)
    end

    it "check max length of phone" do
      is_expected.to validate_length_of(:phone)
    end

    it "check min length of password" do
      is_expected.to validate_length_of(:password)
    end

    it "check the uniqueness of email" do
      is_expected.to validate_uniqueness_of(:email).case_insensitive
    end

    it "check the format of email" do
      is_expected.to_not allow_value("phamvanlegmail.com").for(:email)
    end

    it "check role of user" do
      is_expected.to define_enum_for(:role).with([:member, :admin])
    end
  end

  context "associations" do
    it "check association with comments" do
      is_expected.to have_many(:comments).dependent(:destroy)
    end

    it "check association with rattings" do
      is_expected.to have_many(:rattings).dependent(:destroy)
    end

    it "check association with orders" do
      is_expected.to have_many(:orders).dependent(:destroy)
    end

    it "check association with suggests" do
      is_expected.to have_many(:suggests).dependent(:destroy)
    end
  end

  context "scope" do
    it "check scope newest" do
      expect(User.newest).to eq([user3, user2, user1])
    end

    it "check scope search_name" do
      expect(User.search_name("vanle")).to eq([user1, user2])
    end
  end
end
