require "rails_helper"

RSpec.describe ArticleMailer, :type => :mailer do

  describe "#article_updated_email" do
    let(:author) { Fabricate(:author) }
    let(:article) { Fabricate(:article, :author => author) }
    let(:email) { ArticleMailer.article_updated_email(article) }

    it "sends the message to the article's author" do
      expect(email.to).to eq([author.email])
    end

    it "includes the article's title in the subject line" do
      expect(email.subject).to eq("Your article '#{article.title}' was updated!")
    end

    it "addresses the author in the message body" do
      html_body = get_message_part(email, "html")
      expect(html_body).to include(author.name)
    end

    it "includes a text version of the message" do
      text_body = get_message_part(email, "plain")
      expect(text_body).to include(author.name)
    end
  end
end

def get_message_part(mail, content_type)
  mail.body.parts.find { |p| p.content_type.match(content_type) }.body.raw_source
end
