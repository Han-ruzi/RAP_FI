@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FI Activity PERNR Projection View'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'ZcEmpName' ]
@Search.searchable: true


define root view entity ZC_PERNR_GJ
  provider contract transactional_query
  as projection on ZI_PERNR_GJ as PERNR
{

          @EndUserText.label: '담당자 사번'
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
  key     ZcPernrId,

          @EndUserText.label: '담당자'
          ZcEmpName,

          @EndUserText.label: '부서코드'
          ZcOrgehCode,

          @EndUserText.label: '부서명'
          zcorgehname,

          @EndUserText.label: '휴대폰 번호'
          Zchp,

          @EndUserText.label: '생성자'
          CreatedBy,

          @EndUserText.label: '생성일'
          CreatedAt,

          @EndUserText.label: '수정자'
          LastChangedBy,

          @EndUserText.label: '수정일'
          LastChangedAt,
          @EndUserText.label: '첨부파일'
          Attachment,
          @EndUserText.label: '타입'
          MimeType,
          @EndUserText.label: '파일명'
          FileName


}
