require "./sysrepo-crystal"

require "./types"

# ameba:disable Metrics/CyclomaticComplexity
def convert_sysrepo_value_to_crystal_sysrepo_value( sysrepo_value : Libsysrepo::SysrepoValue* )
    crystal_value = CrystalSysrepoValue.new

    crystal_value.xpath = String.new(sysrepo_value.value.xpath)

    case sysrepo_value.value.type
    when Libsysrepo::SysrepoType::SR_UNKNOWN_T
        crystal_value.type = CrystalSysrepoType::SR_UNKNOWN_T
    when Libsysrepo::SysrepoType::SR_LIST_T
        crystal_value.type = CrystalSysrepoType::SR_LIST_T
    when Libsysrepo::SysrepoType::SR_CONTAINER_T
        crystal_value.type = CrystalSysrepoType::SR_CONTAINER_T
    when Libsysrepo::SysrepoType::SR_CONTAINER_PRESENCE_T
        crystal_value.type = CrystalSysrepoType::SR_CONTAINER_PRESENCE_T
    when Libsysrepo::SysrepoType::SR_LEAF_EMPTY_T
        crystal_value.type = CrystalSysrepoType::SR_LEAF_EMPTY_T
    when Libsysrepo::SysrepoType::SR_NOTIFICATION_T
        crystal_value.type = CrystalSysrepoType::SR_NOTIFICATION_T
    when Libsysrepo::SysrepoType::SR_BINARY_T
        crystal_value.type = CrystalSysrepoType::SR_BINARY_T

        data = CrystalSysrepoData.new
        data.binary_val = String.new(sysrepo_value.value.data.binary_val)

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_BITS_T
        crystal_value.type = CrystalSysrepoType::SR_BITS_T

        data = CrystalSysrepoData.new
        data.bits_val = String.new(sysrepo_value.value.data.bits_val)

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_BOOL_T
        crystal_value.type = CrystalSysrepoType::SR_BOOL_T

        data = CrystalSysrepoData.new
        data.bool_val = sysrepo_value.value.data.bool_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_DECIMAL64_T
        crystal_value.type = CrystalSysrepoType::SR_DECIMAL64_T

        data = CrystalSysrepoData.new
        data.decimal64_val = sysrepo_value.value.data.decimal64_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_ENUM_T
        crystal_value.type = CrystalSysrepoType::SR_ENUM_T

        data = CrystalSysrepoData.new
        data.enum_val = String.new(sysrepo_value.value.data.enum_val)

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_IDENTITYREF_T
        crystal_value.type = CrystalSysrepoType::SR_IDENTITYREF_T

        data = CrystalSysrepoData.new
        data.identityref_val = String.new(sysrepo_value.value.data.identityref_val)

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_INSTANCEID_T
        crystal_value.type = CrystalSysrepoType::SR_INSTANCEID_T

        data = CrystalSysrepoData.new
        data.instanceid_val = String.new(sysrepo_value.value.data.instanceid_val)

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_INT8_T
        crystal_value.type = CrystalSysrepoType::SR_INT8_T

        data = CrystalSysrepoData.new
        data.int8_val = sysrepo_value.value.data.int8_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_INT16_T
        crystal_value.type = CrystalSysrepoType::SR_INT16_T

        data = CrystalSysrepoData.new
        data.int16_val = sysrepo_value.value.data.int16_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_INT32_T
        crystal_value.type = CrystalSysrepoType::SR_INT32_T

        data = CrystalSysrepoData.new
        data.int32_val = sysrepo_value.value.data.int32_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_INT64_T
        crystal_value.type = CrystalSysrepoType::SR_INT64_T

        data = CrystalSysrepoData.new
        data.int64_val = sysrepo_value.value.data.int64_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_STRING_T
        crystal_value.type = CrystalSysrepoType::SR_STRING_T

        data = CrystalSysrepoData.new
        data.string_val = String.new(sysrepo_value.value.data.string_val)

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_UINT8_T
        crystal_value.type = CrystalSysrepoType::SR_UINT8_T

        data = CrystalSysrepoData.new
        data.uint8_val = sysrepo_value.value.data.uint8_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_UINT16_T
        crystal_value.type = CrystalSysrepoType::SR_UINT16_T

        data = CrystalSysrepoData.new
        data.uint16_val = sysrepo_value.value.data.uint16_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_UINT32_T
        crystal_value.type = CrystalSysrepoType::SR_UINT32_T

        data = CrystalSysrepoData.new
        data.uint32_val = sysrepo_value.value.data.uint32_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_UINT64_T
        crystal_value.type = CrystalSysrepoType::SR_UINT64_T

        data = CrystalSysrepoData.new
        data.uint64_val = sysrepo_value.value.data.uint64_val

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_ANYXML_T
        crystal_value.type = CrystalSysrepoType::SR_ANYXML_T

        data = CrystalSysrepoData.new
        data.anyxml_val = String.new(sysrepo_value.value.data.anyxml_val)

        crystal_value.data = data
    when Libsysrepo::SysrepoType::SR_ANYDATA_T
        crystal_value.type = CrystalSysrepoType::SR_ANYDATA_T

        data = CrystalSysrepoData.new
        data.anydata_val = String.new(sysrepo_value.value.data.anydata_val)

        crystal_value.data = data
    else
        crystal_value.type = CrystalSysrepoType::SR_UNKNOWN_T
    end

    crystal_value
end
