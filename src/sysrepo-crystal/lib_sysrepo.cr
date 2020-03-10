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

  #  int sr_rpc_subscribe(sr_session_ctx_t *session, const char *xpath, sr_rpc_cb callback, void *private_data,
  #  uint32_t priority, sr_subscr_options_t opts, sr_subscription_ctx_t **subscription);
  fun sr_rpc_subscribe( session : SessionContext*, xpath : LibC::Char*,
    callback : SysrepoRPCCallback, private_data : Void*, priority : LibC::UInt32T,
    opts : SysrepoSubscriptionOptions, subscription : SubscriptionContext** ) : LibC::Int


  # int sr_print_val(const sr_val_t *value);
  fun sr_print_val( value : SysrepoValue* ) : LibC::Int

end
