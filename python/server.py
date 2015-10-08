from twisted.internet.protocol import Factory, Protocol
from twisted.internet import reactor
import sys 

dic = {}
class IphoneChat(Protocol):
        

    def connectionMade(self):

    	self.factory.clients.append(self)
        print "Lista de clientes" , self.factory.clients

    def connectionLost(self,reason):
    	self.factory.clients.remove(self)

    def dataReceived(self,data):
    	msg = data.split(':')
    	print msg
    	if (len(msg)>1):
    		command = msg[0]
    		content = msg[1]
    	
    	ans = ""

    	if (command == "iam"):
            self.name = content
            dic[content]=self
            
    	if (command == "msg"):
    		ans = self.name +"diz para todos: "+content
    		for c in self.factory.clients:
				c.message(ans)
    	
    	if (command == "to"):
            value = content.split('>')
            ans = "mensagem reservada para voce "+value[0]
            ans = ans + " : " + value[1] 
            if value[0] in dic:
                receive = dic[value[0]]
                receive.message(ans)
            else:
                self.message("Usuario nao encontrado")
			

    def message(self,message):
    	self.transport.write(message + '\n')

factory = Factory()
factory.protocol = IphoneChat
factory.clients = []
reactor.listenTCP(8081, factory)
print "server connected"
reactor.run()