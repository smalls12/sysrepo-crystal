require "./sysrepo-crystal"

require "./types"
require "./utils"
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

  def get_context()
    Libsysrepo.sr_get_context( Libsysrepo.sr_session_get_connection( @session ) )
  end

  def get_item(path, timeout)
    # get the value from sysrepo library
    sysrepoValue = Libsysrepo.sr_get_value
    Libsysrepo.sr_get_item(@session, path, timeout, pointerof(sysrepoValue))

    # convert to a crystallized structure
    crystalValue = convertSysrepoValueToCrystalSysrepoValue(sysrepoValue)

    # release memory from sysrepo library
    Libsysrepo.sr_free_val(sysrepoValue)

    crystalValue
  end

  def get_items(xpath, timeout)
    sysrepoValues = Libsysrepo.sr_get_value
    sysrepoValuesCount = uninitialized UInt32

    Libsysrepo.sr_get_items(@session, xpath, timeout, Libsysrepo::SysrepoGetOperationOptions::DEFAULT, pointerof(sysrepoValues), pointerof(sysrepoValuesCount))
    # Array(Libsysrepo::SysrepoValue*).new(value_cnt) { |i| value + i }
    crystalValues = Array(CrystalSysrepoValue).new(sysrepoValuesCount) { |i| convertSysrepoValueToCrystalSysrepoValue(sysrepoValues + i) }

    # release memory from sysrepo library
    Libsysrepo.sr_free_values(sysrepoValues, sysrepoValuesCount)

    crystalValues
  end

  def rpc_send(path, input, input_cnt)
    puts "RPC send..."
    output = Libsysrepo.sr_get_value
    output_cnt = uninitialized UInt32

    Libsysrepo.sr_rpc_send(@session, path, input, input_cnt, 0, pointerof(output), pointerof(output_cnt))
  end

  def session_stop()
    puts "Stop session..."
    Libsysrepo.sr_session_stop(@session)
  end

  def finalize
    session_stop
  end
end