#server configuration
module.exports = (config) ->
    config.set
        api: ["rest", "websockets"]
        admin: ["adminLogin","adminPassword"]
        server:
            host: "localhost"
            port: "8080"
