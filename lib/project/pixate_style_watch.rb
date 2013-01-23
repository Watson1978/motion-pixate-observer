module PixateStyleObserver
  def startObserving
    @netServiceBrowser = NSNetServiceBrowser.alloc.init
    @netServiceBrowser.delegate = self
    @netServiceBrowser.searchForServicesOfType("_pixate._tcp", inDomain: "")
  end

  def netServiceBrowser(netServiceBrowser,
                        didFindService: service,
                        moreComing: moreComing)
    @netServiceBrowser.stop

    service = NSNetService.alloc.initWithDomain(service.domain, type: service.type, name: service.name)
    service.delegate = self
    service.resolveWithTimeout(5.0)
  end

  def netServiceDidResolveAddress(service)
    service.stop

    socket = Socket.alloc.initWithHost(service.hostName, Port: service.port)
    socket.delegate = self
    socket.startReceivingData
  end

  def socketDidReceive(string)
    style(string)
  end
end