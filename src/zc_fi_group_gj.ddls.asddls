@EndUserText.label: '결산 엑티비티 Projection View'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_FI_GROUP_GJ
  provider contract transactional_query
  as projection on ZI_FI_GROUP_GJ
{

      @EndUserText.label: 'UUID'
  key ZcUUID,

      @EndUserText.label: '분류 아이디'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      ZcGroupId,

      @EndUserText.label: '분류 명'
      ZcGroupName,

      @EndUserText.label: '분류타입'
      @Consumption.valueHelpDefinition: [{
            entity : {name: 'ZI_READ_TYPE_GJ',
                      element: 'value_low'  } }]
      ZcGroupType,

      @EndUserText.label: '분류레벨'
      ZcGroupLevel,

      @EndUserText.label: '부모 분류 아이디'
      @Consumption.valueHelpDefinition: [{
        entity : {name: 'ZI_FI_GROUP_GJ', element: 'ZcGroupId'  } }]
      ZcGroupParentId,

      @EndUserText.label: '상태'
      @Consumption.valueHelpDefinition: [{
            entity : {name: 'ZI_READ_STATUS_GJ',
                      element: 'value_low' } }]
      @ObjectModel.text.element: ['StatusText']

      ZcStatus,
      ZcStatusCriticality,
      _read_status.text as StatusText,

      @EndUserText.label: '첨부파일'
      Attachment,
      @EndUserText.label: '타입'
      MimeType,
      @EndUserText.label: '파일명'
      FileName,


      @EndUserText.label: '생성자'
      CreatedBy,

      @EndUserText.label: '생성일'
      CreatedAt,

      @EndUserText.label: '수정자'
      LastChangedBy,

      @EndUserText.label: '수정일'
      LastChangedAt
}
