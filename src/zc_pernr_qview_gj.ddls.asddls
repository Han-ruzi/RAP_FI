@AbapCatalog.sqlViewName: 'ZC_PERNRQVIEW_GJ'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PERNR_QVIEW'
define view ZC_PERNR_QVIEW_GJ
  as select from yfi_ac_pernr_gj
{

       @UI.facet: [ {
                 purpose:    #QUICK_VIEW,
                 type:       #FIELDGROUP_REFERENCE,
                 targetQualifier: 'Zc_Emp_Name',
                 label: 'Additional Details'
               }
             ]

  key  zc_pernrid,

       @UI.fieldGroup: [{ qualifier:'Zc_Emp_Name', position: 10}]
       @Semantics: {
       text: true,
       name.fullName: true
       }
       zc_emp_name,

//       @Semantics.eMail.address: true
//       @UI.fieldGroup: [{ qualifier:'Zc_Emp_Name', position: 20}]
//       @EndUserText.label: 'Email'
//       zc_orgehcode,

       @UI.fieldGroup: [{ qualifier:'Zc_Emp_Name', position: 30}]
       @EndUserText.label: 'HP'
       zc_hp

}
