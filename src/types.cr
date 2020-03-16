require "./enums"

class CrystalSysrepoData
    property binary_val : String | Nil
    property bits_val : String | Nil
    property bool_val : Bool | Nil
    property decimal32_val : Float32 | Nil
    property decimal64_val : Float64 | Nil
    property enum_val : String | Nil
    property identityref_val : String | Nil
    property instanceid_val : String | Nil
    property int8_val : Int8 | Nil
    property int16_val : Int16 | Nil
    property int32_val : Int32 | Nil
    property int64_val : Int64 | Nil
    property string_val : String | Nil
    property uint8_val : UInt8 | Nil
    property uint16_val : UInt16 | Nil
    property uint32_val : UInt32 | Nil
    property uint64_val : UInt64 | Nil
    property anyxml_val : String | Nil
    property anydata_val : String | Nil
end

class CrystalSysrepoValue
    property xpath : String | Nil
    property type : CrystalSysrepoType | Nil
    property origin : String | Nil
    property data : CrystalSysrepoData | Nil

    # ameba:disable Metrics/CyclomaticComplexity
    def to_s(io)
        io << "["
        io << "\nxpath :: " << xpath

        case type
        when CrystalSysrepoType::SR_UNKNOWN_T
        when CrystalSysrepoType::SR_LIST_T
        when CrystalSysrepoType::SR_CONTAINER_T
        when CrystalSysrepoType::SR_CONTAINER_PRESENCE_T
        when CrystalSysrepoType::SR_LEAF_EMPTY_T
        when CrystalSysrepoType::SR_NOTIFICATION_T
        when CrystalSysrepoType::SR_BINARY_T
            io << "\ntype :: SR_BINARY_T"
            io << "\ndata :: " << data.not_nil!.binary_val
        when CrystalSysrepoType::SR_BITS_T
            io << "\ntype :: SR_BITS_T"
            io << "\ndata :: " << data.not_nil!.bits_val
        when CrystalSysrepoType::SR_BOOL_T
            io << "\ntype :: SR_BOOL_T"
            io << "\ndata :: " << data.not_nil!.bool_val
        when CrystalSysrepoType::SR_DECIMAL64_T
            io << "\ntype :: SR_DECIMAL64_T"
            io << "\ndata :: " << data.not_nil!.decimal64_val
        when CrystalSysrepoType::SR_ENUM_T
            io << "\ntype :: SR_ENUM_T"
            io << "\ndata :: " << data.not_nil!.enum_val
        when CrystalSysrepoType::SR_IDENTITYREF_T
            io << "\ntype :: SR_IDENTITYREF_T"
            io << "\ndata :: " << data.not_nil!.identityref_val
        when CrystalSysrepoType::SR_INSTANCEID_T
            io << "\ntype :: SR_INSTANCEID_T"
            io << "\ndata :: " << data.not_nil!.instanceid_val
        when CrystalSysrepoType::SR_INT8_T
            io << "\ntype :: SR_INT8_T"
            io << "\ndata :: " << data.not_nil!.int8_val
        when CrystalSysrepoType::SR_INT16_T
            io << "\ntype :: SR_INT16_T"
            io << "\ndata :: " << data.not_nil!.int16_val
        when CrystalSysrepoType::SR_INT32_T
            io << "\ntype :: SR_INT32_T"
            io << "\ndata :: " << data.not_nil!.int32_val
        when CrystalSysrepoType::SR_INT64_T
            io << "\ntype :: SR_INT64_T"
            io << "\ndata :: " << data.not_nil!.int64_val
        when CrystalSysrepoType::SR_STRING_T
            io << "\ntype :: SR_STRING_T"
            io << "\ndata :: " << data.not_nil!.string_val
        when CrystalSysrepoType::SR_UINT8_T
            io << "\ntype :: SR_UINT8_T"
            io << "\ndata :: " << data.not_nil!.uint8_val
        when CrystalSysrepoType::SR_UINT16_T
            io << "\ntype :: SR_UINT16_T"
            io << "\ndata :: " << data.not_nil!.uint16_val
        when CrystalSysrepoType::SR_UINT32_T
            io << "\ntype :: SR_UINT32_T"
            io << "\ndata :: " << data.not_nil!.uint32_val
        when CrystalSysrepoType::SR_UINT64_T
            io << "\ntype :: SR_UINT64_T"
            io << "\ndata :: " << data.not_nil!.uint64_val
        when CrystalSysrepoType::SR_ANYXML_T
            io << "\ntype :: SR_ANYXML_T"
            io << "\ndata :: " << data.not_nil!.anyxml_val
        when CrystalSysrepoType::SR_ANYDATA_T
            io << "\ntype :: SR_ANYDATA_T"
            io << "\ndata :: " << data.not_nil!.anydata_val
        else
        end

        io << "\n]"
    end
end
