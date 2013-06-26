module Motion; module Pixate; module Observer
  def startObserving
    @netServiceBrowser = NSNetServiceBrowser.alloc.init
    @netServiceBrowser.delegate = self
    @netServiceBrowser.searchForServicesOfType("_pixate-observer._tcp", inDomain: "")
  end

  def netServiceBrowser(netServiceBrowser,
                        didFindService: service,
                        moreComing: moreComing)
    @netServiceBrowser.stop

    @netService = NSNetService.alloc.initWithDomain(service.domain, type: service.type, name: service.name)
    @netService.delegate = self
    @netService.resolveWithTimeout(0.0)
  end

  def netServiceDidResolveAddress(service)
    @netService.stop

    socket = Socket.alloc.initWithHost(service.hostName, Port: service.port)
    socket.delegate = self
    socket.startReceivingData
  end

  def socketDidReceive(string)
    style(string)
  end
end; end; end
