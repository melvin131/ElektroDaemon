module ElektroDaemon
    class Server < Client
        
        def initialize(server)
            super(server.node)
            @server = server
        end

        def start
            post("/server/#{@server.uuid}/start")
        end

        def stop
            post("/server/#{@server.uuid}/stop")
        end

        def kill
            post("/server/#{@server.uuid}/kill")
        end

        def data
            get("/server/#{@server.uuid}")
        end

        def status
            options = { query: { name: @server.uuid } }
            get("/server/#{@server.uuid}", options)
        end

        def command(command)
            post("/server/#{@server.uuid}/command", query: { command: command })
        end

        def log
            get("/server/#{@server.uuid}/log")
        end

        def file_manager
            get("/server/#{@server.uuid}/file_manager",  query: { name: @server.uuid })
        end

        def file_manager_folder(path)
            get("/server/#{@server.uuid}/file_manager",  query: { name: @server.uuid, path: path })
        end
    end
end  