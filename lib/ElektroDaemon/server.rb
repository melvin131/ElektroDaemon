module ElektroDaemon
    class Server < Client
        attr_reader :server

        def initialize(server)
            super(server.node)
            @server = server
        end

        def start
            # puts "Starting server #{@server.name}."
            post("/server/#{@server.uuid}/start")
        end

        def stop
            # puts "Stopping server #{@server.name}."
            post("/server/#{@server.uuid}/stop")
        end

        def kill
            post("/server/#{@server.uuid}/kill")
        end

        def data
            response = get("/server/#{@server.uuid}")

            if response.success?
                return response
            else
                return nil
            end
        end

        def status
            options = { query: { name: @server.uuid } }
            response = get("/server/#{@server.uuid}", options)

            if response.success?
                return response
            else
                # puts "#{response}"
            end
        end

        def command(command)
            post("/server/#{@server.uuid}/command", query: { command: command })
        end

        def log
            response = get("/server/#{@server.uuid}/log")

            if response.success?
                return response
            else
            # puts "#{response}"
            end
        end

        def file_manager
            get("/server/#{@server.uuid}/file_manager",  query: { name: @server.uuid })
        end

        def file_manager_folder(path)
            get("/server/#{@server.uuid}/file_manager",  query: { name: @server.uuid, path: path })
        end
    end
end  