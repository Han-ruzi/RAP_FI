@EndUserText.label: '결산 엑티비티 마스터 Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'ZcGroupId' ]
@Search.searchable: true

define root view entity ZC_MASTER_GJ
  as projection on ZI_MASTER_GJ
{

      @EndUserText.label: 'UUID'
  key ZcUUID,

      @EndUserText.label: '분류 아이디'
      @ObjectModel.text.element: ['GroupName']
      @Consumption.valueHelpDefinition: [{
        entity : {name: 'ZI_READ_GROUP_GJ', element: 'ZcGroupId'}
      //             , additionalBinding: [{element: 'ZcGroupId' ,
      //                                    localElement: 'GroupName'
      //                                    ,usage: #RESULT
      //                                  }]
         }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      ZcGroupId,
      @EndUserText.label: '분류 명'
      _group.ZcGroupName as GroupName,


      @EndUserText.label: '결산 Activity ID'
      //      @Consumption.valueHelpDefinition: [{
      //        entity : {name: 'ZI_READ_ACID_GJ', element: 'ZcAcId'  }
      //         }]
      ZcAcId,


      @EndUserText.label: '결산 Activity 내역'
      @Search.fuzzinessThreshold: 0.7
      ZcAcTitle,


      @EndUserText.label: '상태'
      @Consumption.valueHelpDefinition: [{
                        entity : {name: 'ZI_READ_STATUS_GJ',
                                  element: 'value_low' } }]
      @ObjectModel.text.element: ['StatusText']

      ZcStatus,
      ZcStatusCriticality,
      _read_status.text  as StatusText,



      @EndUserText.label: '생성자'
      CreatedBy,

      @EndUserText.label: '생성일'
      CreatedAt,

      @EndUserText.label: '수정자'
      LastChangedBy,

      @EndUserText.label: '수정일'
      LastChangedAt




}
