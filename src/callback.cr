require "./sysrepo-crystal"

class Callback
  getter module_change_cb : Proc( Session, String | Nil, String | Nil, Libsysrepo::SysrepoEvent, UInt32, Pointer(Void), Int32) | Nil
  getter oper_data_cb : Proc( Session, String | Nil, String | Nil, String | Nil, UInt32, DataNode, Void*, Int32) | Nil

  def initialize(@module_change_cb)
    puts "Start callback..."
  end

  def initialize(@oper_data_cb)
    puts "Start callback..."
  end

  def finalize
    puts "Stop subscription..."
  end
end