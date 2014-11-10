class ArticleMailer < ActionMailer::Base
  default from: "tom@example.com"

	def article_updated_email(article)
		@author = article.author
		mail(:to => article.author.email, :subject => "Your article '#{article.title}' was updated!")
	end
end
