require "./sysrepo-crystal"

alias MODULECHANGECALLBACK = Proc( Session, String | Nil, String | Nil, Libsysrepo::SysrepoEvent, UInt32, Pointer(Void), Int32)
alias OPERDATACALLBACK = Proc( Session, String | Nil, String | Nil, String | Nil, UInt32, DataNode, Void*, Int32)
alias RPCCALLBACK = Proc( Session, String | Nil, Array(CrystalSysrepoValue), Libsysrepo::SysrepoEvent, UInt32, Array(CrystalSysrepoValue), Void*, Int32)
alias EVENTNOTIFCALLBACK = Proc( Session, Libsysrepo::SysrepoEventNotificationType, String | Nil, Array(CrystalSysrepoValue), Libsysrepo::SysrepoTime, Void*, Int32)

class Callback
  getter module_change_cb : MODULECHANGECALLBACK | Nil
  getter oper_data_cb : OPERDATACALLBACK | Nil
  getter rpc_cb : RPCCALLBACK | Nil
  getter event_notif_cb : EVENTNOTIFCALLBACK | Nil

  def initialize(@module_change_cb : MODULECHANGECALLBACK)
    puts "Start callback..."
  end

  def initialize(@oper_data_cb : OPERDATACALLBACK)
    puts "Start callback..."
  end

  def initialize(@rpc_cb : RPCCALLBACK)
    puts "Start callback..."
  end

  def initialize(@event_notif_cb : EVENTNOTIFCALLBACK)
    puts "Start callback..."
  end

  def finalize
    puts "Stop subscription..."
  end
end