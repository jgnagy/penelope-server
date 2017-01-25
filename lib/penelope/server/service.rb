module Penelope
  module Server
    class Service < Sinatra::Base
      get '/' do
        info = Resque.info
        out = "<html><head><title>Penelope Server Demo</title></head><body>"
        out << "<p>"
        out << "There are #{info[:pending]} pending and "
        out << "#{info[:processed]} processed jobs across #{info[:queues]} queues."
        out << "</p>"
        out << '<form method="POST">'
        out << 'Git URL: <input type="text" name="uri"/><br/>'
        out << 'Entry Point: <input type="text" name="executable"/><br/>'
        out << 'GitHub User: <input type="text" name="user"/><br/>'
        out << '<input type="submit" value="Create New Job"/>'
        out << '&nbsp;&nbsp;<a href="/qmon/">View Queue Monitor</a>'
        out << '</form>'
  
        out << "</body></html>"
        out
      end

      post '/' do
        job = Penelope::Core::GitJob.new(
          uri: params['uri'],
          entry_point: params['executable'],
          submitted_by: "github:#{params['user']}"
        )
        job.save
        Resque.enqueue(Penelope::Core::Run, job.id)
        redirect "/"
      end
    end
  end
end
