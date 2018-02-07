module ElektroDaemon
    class Node < Client
        
        def initialize(node)
            super(node)
            @node = node
        end

        def online?
            begin
                response = get("/")
                if response.success?
                    return true
                else
                    return false
                end
            rescue
                return false
            end
        end
    end
end