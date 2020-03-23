# Preview all emails at http://localhost:3000/rails/mailers/stuff_mailer
class StuffMailerPreview < ActionMailer::Preview
    def requirement_mail_preview
        StuffMailer.new_requirement_email(User.first)
    end
end
