BUZZWORDS = ["essentially",
             "actually",
             "jquery",
             "javascript",
             "so...",
             ".net",
             "ruby"]

class BuzzwordBingo < Sinatra::Application

  configure do
    set :views, File.expand_path(File.join(File.dirname(__FILE__), '..', 'views'))
  end

  get '/' do
    haml :index, :locals => {:words => BUZZWORDS.sort_by{rand}.take(3)}
  end

end