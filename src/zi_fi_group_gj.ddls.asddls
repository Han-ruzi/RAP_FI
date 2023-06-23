@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Root View Definition Group'
@ObjectModel.resultSet.sizeCategory: #XS

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_FI_GROUP_GJ
  as select from yfi_ac_group_gj

  //  composition [0..*] of ZI_MASTER_GJ as _master

  association [0..1] to ZI_READ_STATUS_GJ as _read_status on $projection.ZcStatus = _read_status.value_low
{

  key zc_uuid_id            as ZcUUID,
      zc_group_id           as ZcGroupId,
      zc_group_name         as ZcGroupName,
      zc_group_type         as ZcGroupType,
      zc_group_level        as ZcGroupLevel,
      zc_group_parent_id    as ZcGroupParentId,
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

      @Semantics.largeObject: { mimeType: 'MimeType',   //case-sensitive
         fileName: 'FileName',   //case-sensitive
         acceptableMimeTypes: ['image/png', 'image/jpeg'],
         contentDispositionPreference: #ATTACHMENT }

      attachment            as Attachment,
      @Semantics.mimeType: true
      mime_type             as MimeType,
      file_name             as FileName,

      _read_status

}
