module ElektroDaemon
    class Client
        include HTTParty

        def initialize(node)
            @node = node
            @headers = {
                "PRIVATE-TOKEN" => @node.secret_token
            }

            puts @node.https

            if @node.https
                self.class.base_uri "https://#{@node.ip}:#{@node.port}"
            else
                self.class.base_uri "http://#{@node.ip}:#{@node.port}"
            end
        end

        def get(path, options = {})
            begin
                self.class.get(path, options.merge(headers: @headers))
            rescue
                
            end
        end

        def post(path, options = {})
            self.class.post(path, options.merge(headers: @headers))
        end
    end
end