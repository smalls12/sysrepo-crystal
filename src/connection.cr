require "./sysrepo-crystal"

class Connection
  getter connection : Libsysrepo::ConnectionContext*

  def initialize()
    @connection = Libsysrepo.sr_get_connection_ctx()
    connect
  end

  def connect()
    puts "Connecting..."
    Libsysrepo.sr_connect(Libsysrepo::CONNECTION_OPTIONS::DEFAULT, pointerof(@connection))
  end

  def disconnect()
    puts "Disconnecting..."
    Libsysrepo.sr_disconnect(@connection)
  end

  def finalize
    disconnect
  end
end