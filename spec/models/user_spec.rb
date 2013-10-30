require 'spec_helper'

describe User do

  context "#save" do

    let(:user) { User.new }

    it "must have an email address" do
      user.password = "test"
      expect { user.save! }.to raise_error
    end

    it "must have a valid email address" do
      user.password = "1234pass"
      bad_emails = ["123abc","asdf.sakdf.dasf","....gmail.com"]
      bad_emails.each do |email|
        user.email = email
        expect{ user.save! }.to raise_error
      end
    end

    it "must have a password" do
      user.email = "me@example.com"
      expect { user.save! }.to raise_error
    end

  end

  context "#authenticate" do
    let(:user) { User.new(email: "me@example.com", password: "1234pass") }

    it "should return true when correct password is given"

  end

end
