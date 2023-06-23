@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Entity View for Company'

define root view entity ZI_COMPANY1_GJ
  as select from zfi_ac_company as zc_orgehcode

{

  key  zc_orgehcode          as ZcOrgehCode,
       zc_orgeh_name         as zcorgehname,

       @UI.hidden: true
       @Semantics.user.createdBy: true
       created_by            as CreatedBy,
       @UI.hidden: true
       @Semantics.systemDateTime.createdAt: true
       created_at            as CreatedAt,
       @UI.hidden: true
       @Semantics.user.lastChangedBy: true
       last_changed_by       as LastChangedBy,
       @Semantics.systemDateTime.lastChangedAt: true
       @UI.hidden: true
       last_changed_at       as LastChangedAt,
       @Semantics.systemDateTime.localInstanceLastChangedAt: true
       local_last_changed_at as LocalLastChangedAt
}
