@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FI Activity Contents Root View'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_CONTENTS_GJ
  as select from yfi_ac_content

  association [1..1] to ZI_MASTER_GJ      as _AcId        on $projection.ZcAcId = _AcId.ZcAcId

  association [1..1] to ZI_PERNR_GJ       as _Pernr       on $projection.ZcPernrId = _Pernr.ZcPernrId

  association [1..1] to ZI_READ_STATUS_GJ as _read_status on $projection.ZcStatus = _read_status.value_low
  
  association [1..1] to ZI_QV_PERNR       as _qv_pernr    on $projection.ZcPernrId = _qv_pernr.ZcPernrId
{


  key zc_uuid_id            as ZcUUID,
      zc_content_id         as ZcContentId,
      zc_ac_id              as ZcAcId,
      zc_orgeh_code         as ZcOrgehCode,
      zc_pernr_id           as ZcPernrId,
      zc_cycle              as zccycle,
      zc_day                as zcday,
      zc_tcode              as zctcode,
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


      _AcId,
      _Pernr,
      _read_status,
      _qv_pernr
}
