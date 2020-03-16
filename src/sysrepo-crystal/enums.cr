lib Libsysrepo

  enum SysrepoLoggingLevel
    SR_LL_NONE = 0
    SR_LL_ERR
    SR_LL_WRN
    SR_LL_INF
    SR_LL_DBG
  end

  enum SysrepoConnectionOptions
    DEFAULT
  end

  enum SysrepoDatastore
    SR_DS_STARTUP
    SR_DS_RUNNING
    SR_DS_CANDIDATE
    SR_DS_OPERATIONAL
  end

  enum SysrepoType
    SR_UNKNOWN_T
    SR_LIST_T
    SR_CONTAINER_T
    SR_CONTAINER_PRESENCE_T
    SR_LEAF_EMPTY_T
    SR_NOTIFICATION_T
    SR_BINARY_T
    SR_BITS_T
    SR_BOOL_T
    SR_DECIMAL64_T
    SR_ENUM_T
    SR_IDENTITYREF_T
    SR_INSTANCEID_T
    SR_INT8_T
    SR_INT16_T
    SR_INT32_T
    SR_INT64_T
    SR_STRING_T
    SR_UINT8_T
    SR_UINT16_T
    SR_UINT32_T
    SR_UINT64_T
    SR_ANYXML_T
    SR_ANYDATA_T
  end

  enum SysrepoGetOperationOptions
    DEFAULT
  end

  enum SysrepoEvent
    SR_EV_UPDATE
    SR_EV_CHANGE
    SR_EV_DONE
    SR_EV_ABORT
    SR_EV_ENABLED
    SR_EV_RPC
  end

  enum SysrepoSubscriptionOptions
    DEFAULT
  end

end