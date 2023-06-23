@EndUserText.label: '결산 엑티비티 마스터 Root View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_MASTER_GJ
  as select from yfi_ac_master_gj

  association [0..1] to ZI_FI_GROUP_GJ    as _group       on $projection.ZcGroupId = _group.ZcGroupId
  //
  association [1..1] to ZI_READ_STATUS_GJ as _read_status on $projection.ZcStatus = _read_status.value_low
{
  key zc_uuid_id            as ZcUUID,
      zc_group_id           as ZcGroupId,
      zc_ac_id              as ZcAcId,
      zc_ac_title           as ZcAcTitle,
      zc_status             as ZcStatus,
      case zc_status
      when 'N' then 1
      when 'Y' then 3
      else 0
      end                   as ZcStatusCriticality,

      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,


      _group,
      _read_status
}
