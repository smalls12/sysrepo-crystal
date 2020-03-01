require "libyang-crystal/data-node"

require "./sysrepo-crystal"
require "./session.cr"
require "./callback.cr"

MODULE_CHANGE_HIDDEN = ->( session : Libsysrepo::SessionContext*, module_name : LibC::Char*, xpath : LibC::Char*,
event : Libsysrepo::SysrepoEvent, request_id : LibC::UInt32T, private_data : Void* )
{
  # build strings from libc::char*
  if module_name.null?
    module_name_str = nil
  else
    module_name_str = String.new(module_name)
  end

  if xpath.null?
    xpath_str = nil
  else
    xpath_str = String.new(xpath)
  end

  # pass blank private data for now
  data = Pointer(Void).malloc(0)
  # unbox the data passed in
  data_as_callback = Box(Callback).unbox(private_data)
  # call the callback
  data_as_callback.module_change_cb.call(Session.new(session), module_name_str, xpath_str, event, request_id, data)
}

OPER_DATA_HIDDEN = ->( session : Libsysrepo::SessionContext*, module_name : LibC::Char*, path : LibC::Char*,
request_xpath : LibC::Char*, request_id : LibC::UInt32T, parent : Libyang::LibyangDataNode**, private_data : Void* )
{
  # build strings from libc::char*
  if module_name.null?
    module_name_str = nil
  else
    module_name_str = String.new(module_name)
  end

  if path.null?
    path_str = nil
  else
    path_str = String.new(path)
  end

  if request_xpath.null?
    request_xpath_str = nil
  else
    request_xpath_str = String.new(request_xpath)
  end

  tree = DataNode.new(parent.value)

  # pass blank private data for now
  data = Pointer(Void).malloc(0)
  # unbox the data passed in
  data_as_callback = Box(Callback).unbox(private_data)
  # call the callback
  data_as_callback.oper_data_cb.not_nil!.call(Session.new(session), module_name_str, path_str, request_xpath_str, request_id, pointerof(tree), data)
}

class Subscribe
  getter session : Session
  getter subscription : Libsysrepo::SubscriptionContext*

  def initialize(@session : Session)
    puts "Start subscription..."
    @subscription = Libsysrepo.sr_get_subscription_ctx()

  end

  def module_change_subscribe(module_name : String, xpath : String, external_callback, private_data : Void*, priority : UInt32, opts : Libsysrepo::SysrepoSubscriptionOptions)
    # build callback wrapper
    my_callback = Callback.new(external_callback)
    # box the data to pass down to libsysrepo
    boxed_data = Box.box(my_callback)
    # perform subscribe
    Libsysrepo.sr_module_change_subscribe(@session.session, module_name, nil, MODULE_CHANGE_HIDDEN, boxed_data, priority, Libsysrepo::SysrepoSubscriptionOptions::DEFAULT, pointerof(@subscription) )
  end

  def oper_data_subscribe(module_name : String, path : String, external_callback, private_data : Void*, opts : Libsysrepo::SysrepoSubscriptionOptions)
    # build callback wrapper
    my_callback = Callback.new(external_callback)
    # box the data to pass down to libsysrepo
    boxed_data = Box.box(my_callback)
    # perform subscribe
    Libsysrepo.sr_oper_get_items_subscribe(@session.session, module_name, path, OPER_DATA_HIDDEN, boxed_data, opts, pointerof(@subscription) )
  end

  def unsubscribe
    Libsysrepo.sr_unsubscribe(@subscription)
  end

  def finalize
    puts "Stop subscription..."
  end
end