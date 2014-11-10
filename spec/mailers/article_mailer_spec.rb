require "rails_helper"

RSpec.describe ArticleMailer, :type => :mailer do
  let(:author) { Fabricate(:author) }
  let(:article) { Fabricate(:article, :author => author) }
  let(:email) { ArticleMailer.updated_email(article) }

  it "sends an email to the article's author" do
    expect(email.to).to eql([author.email])
  end

  it "includes the article's subject line in the title" do
    expect(email.subject).to eql("Your article '#{article.title}' was updated")
    #expect(mail.to)
  end

  it "addresses the user in the email body" do
    expect(email.body).to match("Hi #{author.name},")
  end

  it "sends it from our address" do
    expect(email.from).to eql(["blogger-updates@example.com"])
  end

  it "includes a wee note" do
    expect(email.body).to match("We just thought you'd like to get spammed about this.")
  end
end
