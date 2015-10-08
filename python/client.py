
from twisted.internet.protocol import ClientFactory
from twisted.protocols.basic import LineReceiver
from twisted.internet import reactor
import sys

class EchoClient(LineReceiver):
    
    def connectionMade(self):
        self.sendLine("iam:aloc")
    

    def lineReceived(self, line):
        print "receive:", line

class EchoClientFactory(ClientFactory):
    protocol = EchoClient

    def clientConnectionFailed(self, connector, reason):
        print 'connection failed:', reason.getErrorMessage()
        reactor.stop()

    def clientConnectionLost(self, connector, reason):
        print 'connection lost:', reason.getErrorMessage()
        reactor.stop()

def main():
    factory = EchoClientFactory()
    reactor.connectTCP('localhost', 8081, factory)
    reactor.run()

if __name__ == '__main__':
    main()