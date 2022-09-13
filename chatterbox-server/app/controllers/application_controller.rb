class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    everything = Message.all.order(created_at: :asc)
    everything.to_json
  end

  post '/messages' do
    send_it = Message.create(
      body: params[:body],
      username: params[:username]
    )
    send_it.to_json
  end

  patch '/messages/:id' do
    fix_it = Message.find(params[:id])
    fix_it.update(
      body: params[:body]
    )
    fix_it.to_json
  end

  delete '/messages/:id' do
    yeet_it = Message.find(params[:id])
    yeet_it.destroy
    yeet_it.to_json
  end
  
end