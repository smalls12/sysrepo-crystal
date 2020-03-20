require "libyang-crystal"

require "./enums"
require "./types"

# @[Link("sysrepo-crystal")]
# @[Link(ldflags: "-lsysrepo-crystal -lsysrepo")]
@[Link(ldflags: "#{__DIR__}/libsysrepo-crystal.a -lsysrepo")]
lib Libsysrepo

  # ////////////////////////////////////////////////////////////////////////////////
  # // Logging API
  # ////////////////////////////////////////////////////////////////////////////////
  fun sr_log_set_cb(callback : SysrepoLoggingCallback) : Void

  # ////////////////////////////////////////////////////////////////////////////////
  # // Connection / Session Management
  # ////////////////////////////////////////////////////////////////////////////////

  fun sr_get_connection_ctx() : ConnectionContext*
  fun sr_connect( opts : SysrepoConnectionOptions, conn : ConnectionContext** ) : LibC::Int
  fun sr_disconnect( conn : ConnectionContext* ) : LibC::Int

    # const struct ly_ctx *sr_get_context(sr_conn_ctx_t *conn);
    # sr_conn_ctx_t *sr_session_get_connection(sr_session_ctx_t *session);
  fun sr_get_context( conn : ConnectionContext* ) : Libyang::LibyangContext*
  fun sr_session_get_connection( session : SessionContext* ) : ConnectionContext*

  fun sr_get_session_ctx() : SessionContext*
  fun sr_session_start( conn : ConnectionContext*, datstore : SysrepoDatastore, session : SessionContext** ) : LibC::Int
  fun sr_session_stop( session : SessionContext* ) : LibC::Int

  # ////////////////////////////////////////////////////////////////////////////////
  # // Data Retrieval API (get / get-config functionality)
  # ////////////////////////////////////////////////////////////////////////////////
  fun sr_get_value() : SysrepoValue*
  fun sr_get_item( session : SessionContext*, path : LibC::Char*, timeout_ms : LibC::Int, value : SysrepoValue** ) : LibC::Int
  fun sr_get_items( session : SessionContext*, xpath : LibC::Char*, timeout_ms : LibC::UInt32T, opts : SysrepoGetOperationOptions, values : SysrepoValue**, value_cnt : LibC::UInt32T* ) : LibC::Int
  fun sr_free_val( value : SysrepoValue* ) : Void
  fun sr_free_values( values : SysrepoValue*, count : LibC::UInt32T ) : Void

  # ////////////////////////////////////////////////////////////////////////////////
  # // Data Manipulation API (edit-config functionality)
  # ////////////////////////////////////////////////////////////////////////////////
  fun sr_set_item( session : SessionContext*, path : LibC::Char*, value : SysrepoValue*, opts : SysrepoEditOptions ) : LibC::Int
  fun sr_apply_changes( session : SessionContext*, timeout_ms : LibC::UInt32T, wait : LibC::Int ) : LibC::Int

  # ////////////////////////////////////////////////////////////////////////////////
  # // Subscription API
  # ////////////////////////////////////////////////////////////////////////////////
  fun sr_unsubscribe( subscription : SubscriptionContext* ) : LibC::Int*

  # ////////////////////////////////////////////////////////////////////////////////
  # // Change Subscriptions API
  # ////////////////////////////////////////////////////////////////////////////////
  fun sr_get_subscription_ctx() : SubscriptionContext*
  fun sr_module_change_subscribe( session : SessionContext*, module_name : LibC::Char*, xpath : LibC::Char*,
     callback : SysrepoModuleChangeCallback, private_data : Void*, priority : LibC::UInt32T, opts : SysrepoSubscriptionOptions,
     subscription : SubscriptionContext** ) : LibC::Int

  # ////////////////////////////////////////////////////////////////////////////////
  # // Operational Data API
  # ////////////////////////////////////////////////////////////////////////////////
  fun sr_oper_get_items_subscribe( session : SessionContext*, module_name : LibC::Char*, xpath : LibC::Char*,
    callback : SysrepoOperGetItemsCallback, private_data : Void*, opts : SysrepoSubscriptionOptions,
    subscription : SubscriptionContext** ) : LibC::Int

  # ////////////////////////////////////////////////////////////////////////////////
  # // RPC (Remote Procedure Calls) and Action API
  # ////////////////////////////////////////////////////////////////////////////////
  fun sr_rpc_subscribe( session : SessionContext*, xpath : LibC::Char*,
    callback : SysrepoRPCCallback, private_data : Void*, priority : LibC::UInt32T,
    opts : SysrepoSubscriptionOptions, subscription : SubscriptionContext** ) : LibC::Int

  fun sr_rpc_send( session : SessionContext*, path : LibC::Char*,
    input : SysrepoValue*, input_cnt : LibC::UInt32T, timeout_ms : LibC::UInt32T,
    output : SysrepoValue**, output_cnt : LibC::UInt32T* ) : LibC::Int

  fun sr_new_values( value_cnt : LibC::UInt32T, values : SysrepoValue** ) : LibC::Int

  fun sr_val_set_str_data( values : SysrepoValue*, type : SysrepoType, string_val : LibC::Char* ) : LibC::Int
  fun sr_val_set_xpath( value : SysrepoValue*, xpath : LibC::Char* ) : LibC::Int

  fun sr_print_val( value : SysrepoValue* ) : LibC::Int

end
