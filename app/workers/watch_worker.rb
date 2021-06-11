class WatchWorker
  include Sidekiq::Worker

  sidekiq_options lock: :until_executed, on_conflict: :reject

  def perform(doc_id)
    watchers = Watch.select(:document_id, :user_id).where(document_id: doc_id).includes(:user, :document).distinct
    watchers.each do |watcher|
      document = watcher.document
      user = watcher.user
      WatchMailer.with(document: document, user: user).new_update.deliver_now
    end
  end
end
