# Add gems 'delayed_job_active_record' & 'daemons'
# bundle install
# In config/application.rb:
 # config.active_job.queue_adapter = :delayed_job
 # config.autoload_paths << Rails.root.join('app/jobs')
# rails generate delayed_job:active_record
# rake db:migrate

# rails generate job JobName  #DON'T NEED

# Somewhere in our code: JobName.perform_later(params[:something_important])
# ... when you are done coding:

# bin/delayed_job start
# bin/delayed_job stop

# rails g mailer MailerNameMailer action_name other_action_name
# Modify views and mailers as you see fit
# Somewhere in our code: MailerNameMailer.other_action_name.deliver_now

# Add gmail style config to environments/development.rb: http://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-configuration-for-gmail
