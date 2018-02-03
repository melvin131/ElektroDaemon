module ElektroDaemon
    class Client
        include HTTParty

        attr_reader :node

        def initialize(node)
            @node = node
            @headers = {
                "PRIVATE-TOKEN" => @node.secret_token
            }
            if @node.https
                self.class.base_uri "https://#{@node.ip}:#{@node.port}"
            else
                self.class.base_uri "http://#{@node.ip}:#{@node.port}"
            end
        end

        def get(path, options = {})
            self.class.get(path, options.merge(headers: @headers))
        end

        def post(path, options = {})
            self.class.post(path, options.merge(headers: @headers))
        end
    end
end