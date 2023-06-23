@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FI Activity List Root View.'



/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_LIST_GJ
  as select from yfi_ac_list_gj


  association [1..1] to ZI_CONTENTS_GJ    as _CONTENTS    on $projection.zccontentid = _CONTENTS.ZcContentId

  association [1..1] to ZI_READ_STATUS_GJ as _read_status on $projection.ZcStatus = _read_status.value_low
{


  key zc_uuid_id            as ZcUUID,
      zc_content_id         as zccontentid,
      zc_spmon              as zcspmon,
      zc_plan_date          as zcplandate,
      zc_plan_time          as zcplantime,
      zc_actually_date      as zcactuallydate,
      zc_actually_time      as zcactuallytime,
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

      _CONTENTS,
      _read_status
}
