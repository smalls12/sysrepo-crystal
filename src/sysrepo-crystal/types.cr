require "./enums"

lib Libsysrepo

    type ConnectionContext = Void
    type SessionContext = Void
    type SubscriptionContext = Void

    type LibyangContext = Void
    type LibyangData = Void

    type SysrepoLoggingCallback = SysrepoLoggingLevel, LibC::Char* -> Void
    type SysrepoModuleChangeCallback = SessionContext*, LibC::Char*, LibC::Char*, SysrepoEvent, LibC::UInt32T, Void* -> LibC::Int32T
    type SysrepoOperGetItemsCallback = SessionContext*, LibC::Char*, LibC::Char*, LibC::Char*, LibC::UInt32T, LibyangData**, Void* -> LibC::Int32T

    type PrivateData = Void

    struct SysrepoData
        binary_val : LibC::Char*
        bits_val : LibC::Char*
        bool_val : Bool
        decimal64_val : LibC::Double
        enum_val : LibC::Char*
        identityref_val : LibC::Char*
        instanceid_val : LibC::Char*
        int8_val : LibC::Int8T
        int16_val : LibC::Int16T
        int32_val : LibC::Int32T
        int64_val : LibC::Int64T
        string_val : LibC::Char*
        uint8_val : LibC::UInt8T
        uint16_val : LibC::UInt16T
        uint32_val : LibC::UInt32T
        uint64_val : LibC::UInt64T
        anyxml_val : LibC::Char*
        anydata_val : LibC::Char*
    end
    
    struct SysrepoValue
        xpath : LibC::Char*
        type : SysrepoType
        dflt : Bool
        origin : LibC::Char*
        data : LibC::Int
    end
end
