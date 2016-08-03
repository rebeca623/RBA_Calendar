# Preview all emails at http://localhost:3000/rails/mailers/apps
class AppsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/apps/notify_lawyer
  def notify_lawyer
    Apps.notify_lawyer
  end

end
