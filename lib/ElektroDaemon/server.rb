module ElektroDaemon
    class Server < Client
        
        def initialize(server)
            super(server.node)
            @server = server
        end

        def start
            post("/servers/#{@server.uuid}/start")
        end

        def stop
            post("/servers/#{@server.uuid}/stop")
        end

        def kill
            post("/servers/#{@server.uuid}/kill")
        end

        def restart
            post("/servers/#{@server.uuid}/restart")
        end

        def data
            get("/servers/#{@server.uuid}")
        end

        def status
            get("/servers/#{@server.uuid}")
        end

        def command(command)
            post("/servers/#{@server.uuid}/command", query: { command: command })
        end

        def log
            get("/servers/#{@server.uuid}/log")
        end

        def tree(path)
            get("/servers/#{@server.uuid}/file_manager", query: { path: path })
        end
    end
end  