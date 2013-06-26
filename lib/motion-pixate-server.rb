framework "Cocoa"
require "socket"

cssfile = ARGV[0] || ""
unless File.exists?(cssfile)
  warn "USAGE : #{$0} css_file_path"
  exit
end

SERVER_PORT = 54321
SERVER_NAME = "Pixate CSS Notifier"

netservice = NSNetService.alloc.initWithDomain("", type: "_pixate._tcp", name: SERVER_NAME, port: SERVER_PORT)
netservice.publish

serv = TCPServer.open("", SERVER_PORT)
fd   = open(cssfile, "r")
gcdq = Dispatch::Queue.new('pixate')
mask = Dispatch::Source::VNODE_WRITE | Dispatch::Source::VNODE_EXTEND

while true
  conn = serv.accept
  NSLog "Connected : #{conn.addr[2]}"

  @sock.close if @sock
  @sock = conn

  Dispatch::Source.new(Dispatch::Source::VNODE, fd, mask, gcdq) do
    begin
      fd.rewind
      @sock.write(fd.read)
    rescue
    end
  end
end
