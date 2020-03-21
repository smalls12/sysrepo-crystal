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
    # get item from sysrepo library
    sysrepo_value = Libsysrepo.sr_get_value
    Libsysrepo.sr_get_item(@session, path, timeout, pointerof(sysrepo_value))

    # convert to a crystallized structure
    crystal_value = convert_sysrepo_value_to_crystal_sysrepo_value(sysrepo_value)

    # release memory from sysrepo library
    Libsysrepo.sr_free_val(sysrepo_value)

    crystal_value
  end

  def get_items(xpath, timeout)
    # get items from sysrepo library
    sysrepo_values = Libsysrepo.sr_get_value
    sysrepo_values_count = uninitialized UInt32
    Libsysrepo.sr_get_items(@session, xpath, timeout, Libsysrepo::SysrepoGetOperationOptions::DEFAULT, pointerof(sysrepo_values), pointerof(sysrepo_values_count))

    # convert to a crystallized structure
    crystal_values = Array(CrystalSysrepoValue).new(sysrepo_values_count) { |i| convert_sysrepo_value_to_crystal_sysrepo_value(sysrepo_values + i) }

    # release memory from sysrepo library
    Libsysrepo.sr_free_values(sysrepo_values, sysrepo_values_count)

    crystal_values
  end

  def set_item(path, crystal_value)
    sysrepo_value = Libsysrepo.sr_get_value
    Libsysrepo.sr_new_values(1, pointerof(sysrepo_value))

    convert_crystal_sysrepo_value_to_sysrepo_value(crystal_value, sysrepo_value)

    # set item from sysrepo library
    Libsysrepo.sr_set_item(@session, path, sysrepo_value, Libsysrepo::SysrepoEditOptions::DEFAULT)
  end

  def apply_changes(timeout, wait)
    Libsysrepo.sr_apply_changes(@session, timeout, wait)
  end

  def rpc_send(path, input, input_cnt)
    output = Libsysrepo.sr_get_value
    output_cnt = uninitialized UInt32

    Libsysrepo.sr_rpc_send(@session, path, input, input_cnt, 0, pointerof(output), pointerof(output_cnt))
  end

  def event_notif_send(path, crystal_values)
    sysrepo_values_count = crystal_values.size.to_u32
    sysrepo_values = Libsysrepo.sr_get_value
    Libsysrepo.sr_new_values(sysrepo_values_count, pointerof(sysrepo_values))

    for x = 0, x < sysrepo_values_count, x += 1 do
      convert_crystal_sysrepo_value_to_sysrepo_value(crystal_values[x], sysrepo_values + x)
    end

    Libsysrepo.sr_event_notif_send(@session, path, sysrepo_values, sysrepo_values_count)
  end

  def session_stop()
    puts "Stop session..."
    Libsysrepo.sr_session_stop(@session)
  end

  def finalize
    session_stop
  end
end