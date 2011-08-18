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
             "anayltics",
             "post",
             "tag",
             "script",
             "google",
             "tracking pixel",
             "migration",
             "CRUD",
             "helper",
             "f' fahk sake"]

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

end