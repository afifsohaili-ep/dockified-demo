# Preview all emails at http://localhost:3000/rails/mailers/watch_mailer
class WatchMailerPreview < ActionMailer::Preview
	def new_update
		document = Document.new(title: 'This is a test document', body: 'This body is a test document\'s body')
		user = User.new(email: 'afifnajib@gmail.com')
		WatchMailer.with(document: document, user: user).new_update
	end
end
