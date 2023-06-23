@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Company'
@Metadata.allowExtensions: true
@Search.searchable: true


define root view entity ZC_COMPANY1_GJ
  as projection on ZI_COMPANY1_GJ as Company
{
         @EndUserText.label: '부서코드'
         @Search.defaultSearchElement: true
         @Search.fuzzinessThreshold: 0.8
         @Semantics.text: true
         @UI.lineItem: [{ position: 10 }]
  key    zcorgehcode,

         @EndUserText.label: '부서명'
         @Search.defaultSearchElement: true
         @Search.fuzzinessThreshold: 0.8
         zcorgehname,

         @EndUserText.label: '생성자'
         CreatedBy,

         @EndUserText.label: '생성일'
         CreatedAt,

         @EndUserText.label: '수정자'
         LastChangedBy,

         @EndUserText.label: '수정일'
         LastChangedAt

}
