require "./sysrepo-crystal"

require "./types"

def convertSysrepoValueToCrystalSysrepoValue( sysrepoValue : Libsysrepo::SysrepoValue* )
    crystalValue = CrystalSysrepoValue.new

    crystalValue.xpath = String.new(sysrepoValue.value.xpath)

    case sysrepoValue.value.type
    when Libsysrepo::SysrepoType::SR_UNKNOWN_T
        crystalValue.type = CrystalSysrepoType::SR_UNKNOWN_T
    when Libsysrepo::SysrepoType::SR_LIST_T
        crystalValue.type = CrystalSysrepoType::SR_LIST_T
    when Libsysrepo::SysrepoType::SR_CONTAINER_T
        crystalValue.type = CrystalSysrepoType::SR_CONTAINER_T
    when Libsysrepo::SysrepoType::SR_CONTAINER_PRESENCE_T
        crystalValue.type = CrystalSysrepoType::SR_CONTAINER_PRESENCE_T
    when Libsysrepo::SysrepoType::SR_LEAF_EMPTY_T
        crystalValue.type = CrystalSysrepoType::SR_LEAF_EMPTY_T
    when Libsysrepo::SysrepoType::SR_NOTIFICATION_T
        crystalValue.type = CrystalSysrepoType::SR_NOTIFICATION_T
    when Libsysrepo::SysrepoType::SR_BINARY_T
        crystalValue.type = CrystalSysrepoType::SR_BINARY_T

        data = CrystalSysrepoData.new
        data.binary_val = String.new(sysrepoValue.value.data.binary_val)

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_BITS_T
        crystalValue.type = CrystalSysrepoType::SR_BITS_T

        data = CrystalSysrepoData.new
        data.bits_val = String.new(sysrepoValue.value.data.bits_val)

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_BOOL_T
        crystalValue.type = CrystalSysrepoType::SR_BOOL_T

        data = CrystalSysrepoData.new
        data.bool_val = sysrepoValue.value.data.bool_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_DECIMAL64_T
        crystalValue.type = CrystalSysrepoType::SR_DECIMAL64_T

        data = CrystalSysrepoData.new
        data.decimal64_val = sysrepoValue.value.data.decimal64_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_ENUM_T
        crystalValue.type = CrystalSysrepoType::SR_ENUM_T

        data = CrystalSysrepoData.new
        data.enum_val = String.new(sysrepoValue.value.data.enum_val)

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_IDENTITYREF_T
        crystalValue.type = CrystalSysrepoType::SR_IDENTITYREF_T

        data = CrystalSysrepoData.new
        data.identityref_val = String.new(sysrepoValue.value.data.identityref_val)

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_INSTANCEID_T
        crystalValue.type = CrystalSysrepoType::SR_INSTANCEID_T

        data = CrystalSysrepoData.new
        data.instanceid_val = String.new(sysrepoValue.value.data.instanceid_val)

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_INT8_T
        crystalValue.type = CrystalSysrepoType::SR_INT8_T

        data = CrystalSysrepoData.new
        data.int8_val = sysrepoValue.value.data.int8_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_INT16_T
        crystalValue.type = CrystalSysrepoType::SR_INT16_T

        data = CrystalSysrepoData.new
        data.int16_val = sysrepoValue.value.data.int16_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_INT32_T
        crystalValue.type = CrystalSysrepoType::SR_INT32_T

        data = CrystalSysrepoData.new
        data.int32_val = sysrepoValue.value.data.int32_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_INT64_T
        crystalValue.type = CrystalSysrepoType::SR_INT64_T

        data = CrystalSysrepoData.new
        data.int64_val = sysrepoValue.value.data.int64_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_STRING_T
        crystalValue.type = CrystalSysrepoType::SR_STRING_T

        data = CrystalSysrepoData.new
        data.string_val = String.new(sysrepoValue.value.data.string_val)

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_UINT8_T
        crystalValue.type = CrystalSysrepoType::SR_UINT8_T

        data = CrystalSysrepoData.new
        data.uint8_val = sysrepoValue.value.data.uint8_val

        crystalValue.data = data 
    when Libsysrepo::SysrepoType::SR_UINT16_T
        crystalValue.type = CrystalSysrepoType::SR_UINT16_T

        data = CrystalSysrepoData.new
        data.uint16_val = sysrepoValue.value.data.uint16_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_UINT32_T
        crystalValue.type = CrystalSysrepoType::SR_UINT32_T

        data = CrystalSysrepoData.new
        data.uint32_val = sysrepoValue.value.data.uint32_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_UINT64_T
        crystalValue.type = CrystalSysrepoType::SR_UINT64_T

        data = CrystalSysrepoData.new
        data.uint64_val = sysrepoValue.value.data.uint64_val

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_ANYXML_T
        crystalValue.type = CrystalSysrepoType::SR_ANYXML_T

        data = CrystalSysrepoData.new
        data.anyxml_val = String.new(sysrepoValue.value.data.anyxml_val)

        crystalValue.data = data
    when Libsysrepo::SysrepoType::SR_ANYDATA_T
        crystalValue.type = CrystalSysrepoType::SR_ANYDATA_T

        data = CrystalSysrepoData.new
        data.anydata_val = String.new(sysrepoValue.value.data.anydata_val)
        
        crystalValue.data = data
    else
        crystalValue.type = CrystalSysrepoType::SR_UNKNOWN_T
    end

    crystalValue
end
