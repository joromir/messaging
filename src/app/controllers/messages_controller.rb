class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :redis_client, only: %i[create index]

  def index
    @messages = @redis_client.lrange(current_user.email, 0, -1)
  end

  def create
    @redis_client.lpush(current_user.email, message_params.to_json)

    redirect_to messages_path
  end

  def edit
    render plain: 'TODO: edit'
  end

  def update
    render plain: 'TODO: update'
  end

  def destroy
    render plain: 'TODO: destroy'
  end

  private

  def redis_client
    @redis_client ||= Redis.new(host: 'redis')
  end

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
