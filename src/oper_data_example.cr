# TODO: Write documentation for `OperDataExample`
require "libyang-crystal"

require "./sysrepo-crystal"
require "./connection"
require "./session"
require "./subscribe"

LOG_MESSAGE = ->( level : Libsysrepo::SysrepoLoggingLevel, message : LibC::Char* ) { puts String.new message }
OPER_DATA = ->( session : Session, module_name : String | Nil, xpath : String | Nil,
request_xpath : String | Nil, request_id : UInt32, parent : Libsysrepo::LibyangData**, private_data : Void* )
{
  puts " === OPER_DATA_EXTERNAL === "

  context = Libyang::LibyangContext.new

  puts " === OPER_DATA_EXTERNAL === "

  return 0
}

module OperDataExample
  VERSION = "0.1.0"

  running = true

  Signal::INT.trap do
    puts "CTRL-C handler here!"
    running = false
  end

  # TODO: Put your code here
  Libsysrepo.sr_log_set_cb(LOG_MESSAGE)

  connection = Connection.new
  session = Session.new(connection)
  subscribe = Subscribe.new(session)

  sleep(1)

  data = Pointer(Void).malloc(0)
  subscribe.oper_data_subscribe("odin", "/odin:stateData/blah", OPER_DATA, data, Libsysrepo::SysrepoSubscriptionOptions::DEFAULT)

  sleep(1)

  puts "Wait for CTRL-C ..."
  while running
    sleep 0.01
  end

  subscribe.unsubscribe
  session.session_stop
  connection.disconnect

end