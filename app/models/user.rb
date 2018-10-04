class User < ActiveRecord::Base

  before_create :create_token

  def confirmed?
    self.confirmed_on.present? && self.confirmed_on.past?
  end

  def confirm!
    update_attribute(:confirmed_on, Time.zone.now)
  end

  def send_confirmation_email
    begin
      UserMailer.confirmation_email(self).deliver_now
      return true
    rescue => e
      Rails.logger.info("EMAILING ERROR: #{e.message} \n #{e.backtrace.join("\n")}")
      return false
    end
  end

private

  def create_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s
  end
end
