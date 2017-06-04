class MessagesController < ApplicationController
  def index
    client = Redis.new(host: 'redis')

    @messages = client.lrange('122', 0, -1)
  end

  def show
    render plain: 'TODO: show'
  end

  def create
    client = Redis.new(host: 'redis')


    client.lpush('122', message_params.to_json)

    render plain: client.fetch('122')
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

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
