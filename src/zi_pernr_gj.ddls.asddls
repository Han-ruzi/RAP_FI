@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PERNR Root View'


define root view entity ZI_PERNR_GJ
  as select from yfi_ac_pernr_gj

  association [1..1] to ZI_COMPANY1_GJ    as _Orgehcode   on $projection.ZcOrgehCode = _Orgehcode.ZcOrgehCode

  association [1..1] to ZC_PERNR_QVIEW_GJ as _PERNR_QVIEW on $projection.ZcEmpName = _PERNR_QVIEW.zc_emp_name
{

  key   zc_pernrid            as ZcPernrId,

        //        @UI.lineItem:[{ label: 'Zc_Emp_Name', position: 20 , importance: #HIGH }]
        @UI.selectionField: [ { position: 20 } ]
        zc_emp_name           as ZcEmpName,
        zc_orgehcode          as ZcOrgehCode,
        zc_hp                 as Zchp,
        _Orgehcode.zcorgehname,

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
        
        
        
        _PERNR_QVIEW

}
