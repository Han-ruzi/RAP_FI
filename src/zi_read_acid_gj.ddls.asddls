@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'READ_ACID'

define root view entity ZI_READ_ACID_GJ
  as select from ZI_MASTER_GJ
{
      @UI.hidden: true
  key ZcUUID,

      @EndUserText.label: '결산 Activity ID'
      ZcAcId,

      @EndUserText.label: '결산내역'
      ZcAcTitle,

      @EndUserText.label: '그룹 ID'
      ZcGroupId,

      @EndUserText.label: '그룹 이름'
      _group.ZcGroupName,


      @UI.hidden: true
      CreatedBy,
      @UI.hidden: true
      CreatedAt,
      @UI.hidden: true
      LastChangedBy,
      @UI.hidden: true
      LastChangedAt,
      @UI.hidden: true
      ZcStatus

}

where
  ZcStatus = 'Y'
