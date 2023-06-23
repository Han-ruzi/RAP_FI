@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quick View'
define root view entity ZI_QV_PERNR
  as select from ZI_PERNR_GJ as pernr
{

      @Semantics.name.fullName: true
  key ZcPernrId,

      @Semantics.name.jobTitle: true
      ZcEmpName,

      @Semantics.organization.name: true
      ZcOrgehCode,

      @Semantics.organization.unit: true
      zcorgehname,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt
}
