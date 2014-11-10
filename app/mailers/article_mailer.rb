class ArticleMailer < ActionMailer::Base
  default from: "blogger-updates@example.com"

  def updated_email(article)
    @article = article
    @author = article.author
    mail(to: @author.email, subject: "Your article '#{article.title}' was updated")
  end
end
