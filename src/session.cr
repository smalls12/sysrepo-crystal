require "./sysrepo-crystal"
require "./connection"

class Session
  getter session : Libsysrepo::SessionContext*

  def initialize(connection : Connection)
    @session = Libsysrepo.sr_get_session_ctx()
    session_start(connection)
  end

  def initialize(@session : Libsysrepo::SessionContext*)
  end


  def session_start(connection : Connection)
    puts "Start session..."
    Libsysrepo.sr_session_start(connection.connection, Libsysrepo::SysrepoDatastore::SR_DS_RUNNING, pointerof(@session) )
  end

  def session_stop()
    puts "Stop session..."
    Libsysrepo.sr_session_stop(@session)
  end

  def finalize
    session_stop
  end
end