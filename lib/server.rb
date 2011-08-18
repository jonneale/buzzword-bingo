BUZZWORDS = ["essentially",
             "actually",
             "jquery",
             "javascript",
             "so...",
             ".net",
             "ruby",
             "baris",
             "in my opinion",
             "in my experience",
             "not cleaning up",
             "not my job",
             "rewrite",
             "redirect",
             "proxy",
             "uSwitch",
             "the business",
             "business person",
             "fahkin'",
             "errr...",
             "that's not what i heard",
             "how come",
             "what?",
             "who said that?",
             "release",
             "ie",
             "analytics",
             "post",
             "tag",
             "script",
             "google",
             "tracking pixel",
             "migration",
             "CRUD",
             "helper",
             "f' fahk sake",
             "default",
             "database",
             "cache",
             "i don't know why",
             "comment out",
             "for some reason",
             "it just so happens that",
             "xml",
             "version",
             "i guess"]

class BuzzwordBingo < Sinatra::Application

  configure do
    set :views, File.expand_path(File.join(File.dirname(__FILE__), '..', 'views'))
    Sass::Plugin.options[:template_location] = File.expand_path(File.join(File.dirname(__FILE__), '..', 'public', 'stylesheets', 'sass'))
    Sass::Plugin.options[:css_location] = File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'stylesheets'))
    use Sass::Plugin::Rack
  end

  get '/' do
    haml :index, :locals => {:words => BUZZWORDS.sort_by{rand}.take(25)}
  end
  
  get '/stylesheets/:sheet.css' do
    content_type "text/css"
    file = File.open("#{File.join(File.dirname(__FILE__), *%w[.. public stylesheets sass])}/#{params[:sheet]}.sass")
    last_modified = file.mtime
    sass file.read, :sass => {:filename => file}
  end

end