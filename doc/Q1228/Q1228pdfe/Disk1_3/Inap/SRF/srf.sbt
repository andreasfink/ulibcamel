------------------------SDT2      ����   0      SRF                                                 --------------------------------------------------------------------------------------------------------------------------------------------------------ObjectName ----------------------------------------ObjectType ----------------------------------------!%&()LinkEndpoints --------------------------------1 -------------------------------------------------         	   
         0   ��������������������   ����SRF ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   ����13 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   ����()[8        (!    Virtual Block Type SRF)]}------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   .����()[         (!
    �  �  !
    2   2   !   ( P   )[ h       (!
   6 �   �   !
   
 �  @  )[ k       (!
   6 �   �   )[ n       (!
   6 �   �   !
   
         )]][  q       (!
   6   �   )][A �       (!    �  �   �      !        )[               (!
   6 k  2   !    SCF)][`         (!    )][. �       (!
   
         )[8         (!
   6 �      !    CS2_INAP_Prim_To_SCF)]][         (!
   6 �      !    ����)][. �       (!
   
         )[8         (!
   6 �  d   !    CS2_INAP_Prim_Fro      m_SCF)]][         (!
   6 �  �   !    Z   )]][A �      (!    �   �  2   �  !        )[         (!
   6 2   q  !	    SSF_CCF)][`         (!    )][. �      (!
   
         )[8         (!
   6       !
    srfTossf)]][         (!
   6 2         �  !    �   )][. �      (!
   
         )[8         (!
   6 2   �  !
    ssfTosrf)]][         (!
   6 �   �  !        )]][A �      (!    r  �    �  !        )[         (!
   6 �  q  !    IP)][`         (!    )][. �      (!
   
               )[8         (!
   6 @     !    SigCon_
_Out)]][         (!
   6   �  !        )][. �      (!
   
         )[8         (!
   6 @  �  !    SigCon_
_In)]][         (!
   6 r  �  !    �   )]][? �       (!
   6 ^  �  !
   
 ,  �        	 )[         (!
   6 w  �  !    SRFManager)]][? �       (!
   6 �  �  !
   
 ,  �   )[         (!
   6 �  �  !    SRFStateModel)]][( t       (!
   6    X  !
   
 ,  �   )[         (!
   6 k  �  !    SRM(1,1):
SRFManager)][0 �       (!       
   �  X  �  �   !"            �  �           �  X  )[         (!
   6 �  E  !    SCF_Interface)][. �       (!
   
         )[8         (!
   6 �  �   !    CS2_INAP_Prim_To_SCF)]][         (!
   6 �  �   !    ����)][. �       (!
   
               )[8         (!
   6 �  &  !    CS2_INAP_Prim_From_SCF)]][         (!
   6 �  X  !    Z   )][: �       (!
   6 �  X  )[         (!
   6 �  q  !    SCF)]][) �       ()]][0 �       (!       �  �   �  !"            �   �                   �  )[         (!
   6 �  �  !    SSF_Interface)][. �       (!
   
         )[8         (!
   6 ^  �  !
    srfTossf)]][         (!
   6 �   �  !    �   )][. �       (!
   
         )[8         (!
   6 q  �  !
    ssfTosrf)]][         (!
         6    �  !        )][: �       (!
   6    �  )[         (!
   6    �  !    SSF)]][) �      ()]][0 �       (!    L  �  r  �  !"            r  �          L  �  )[         (!
   6 �  �  !    IP_Interface)][. �       (!
   
               )[8         (!
   6 _  �  !    SigCon_Out)]][         (!
   6 r  �  !        )][. �       (!
   
         )[8         (!
   6 ~  �  !    SigCon_In)]][         (!
   6 L  �  !    �   )][: �       (!
   6 L  �  )[         (!
   6         �  !    IP)]][) �      ()]][0 z       (!    �     �  L  !"            �  L          �     )[         (!
   6 �  �  !    )][. {       (!
   
         )[8         (!
   6 �    !    srmTosrsm)]][         (!
   6 �  L  !    Z   )]      [. |       (!
   
         )[8         (!
   6 k  R  !    srsmTosrm)]][         (!
   6 �     !    ����)][: �       (!
   6 �     )[         (!
   6 �  �  !    SRSM)]][; �       (!
   6 �  L  )[         (!
   6 �  e  !    SRM)]][( w             (!
   6    L  !
   
 ,  �   )[         (!
   6 9  �  !!    SRSM(1,NrOfSRSM):
SRFStateModel)]]][	 �       (!           L  !"              L               )[         (!
   6   L  !    Z   )][) w       ()]]]]]}---------------   �����()[         (!
    �  �  !
    2   2   !   ( G   )[ �      (!
   
 �  �  )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6 y     )][9 �      (!
   6 2   �  !
   
         )[8         (!$   SIGNAL
/      !%()PageOrder -------------------------------------1  ------------------------------------------------2 -------------------------------------------------3 -------------------------------------------------   	   
   
   
            #��������������������   ����!%()HeadingText -----------------------------------2 -------------------------------------------------------------------------------------------------------------------------------------------------------   	   
--------      --------          $--------   ����()[         (!
    :  �  !
    2   2   !   ( G   )[       (!
   
 :  �  )[       (!
   6       )[       (!
   6    d   !
   
         )]][  
      (!
   6 �     )][9       (!
   6 2   �  !
   
         )[8         (!.   /* 
Note      s to be resolved at the ITU-T Q.6 1996 Interim Meeting

NOTE 1:
It is proposed that all SCF/SRF in the ASN1 Module IN-CS2-SCF-SRF-ops-args {ccitt recommendation 
q 1228 modules(0) in-cs2-scf-srf-ops-args (7) version1(0)} contain a CSId instead of a LegId 
      (or no coding at all), in order to address the right call segment where the operation should 
relay the message in case of multiple CS`s in a CSA.

NOTE 2:
The disconnectFromIPForbidden parameter is missing in the following SCF-SSF-SRF messages ScriptRun.        
A parameter should be included into the ScriptRun operation to enable from the SCF an SRF initiated disconnect
NOTE 3:
The Cancel operation must have an CSId, in order to address the right call segment where the operation should  
relay the message in ca      se of multiple CS`s in a CSA. 


*/
)]]]]}A. 


*/
)]]]]}-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   *����(!   4 �  !   5    !   7     )[!        (!    1!       !   3    )[!        (!    2!       !   3    )[!        (!    3!       !   3    )[!        (!    4!       !   3    )]]]]}--------------------------------------------   �����* 
It should be noted that a connection can 
only be set up from the SSF-CCF towards the 
SRF/IP.
*/
  Ssf_Setup.req(Ssf_SetupType),
  Srf_Setup.req(Srf_SetupType),
  Ssf_CallProgress.ind(CallProgressType),
  Srf_CallProgress.ind(CallProgressType),
  Ssf_F      acility.req(FacilityType),
  Srf_Facility.req(FacilityType),
  Ssf_Facility.ind(FacilityType),
  Srf_Facility.ind(FacilityType),
  Ssf_FacilityResult.req(FacilityType),
  Srf_FacilityResult.req(FacilityType),
  Ssf_FacilityResult.ind(FacilityType),
  Srf_F      acilityResult.ind(FacilityType),
  Ssf_FacilityError.req(FacilityType),
  Srf_FacilityError.req(FacilityType),
  Ssf_FacilityError.ind(FacilityType),
  Srf_FacilityError.ind(FacilityType),
  Ssf_Data.req(DataType),
  Srf_Data.req(DataType),
  Ssf_Data.ind(      DataType),
  Srf_Data.ind(DataType),
  Ssf_Setup.conf(Ssf_SetupType),
  Srf_Setup.conf(Srf_SetupType),
  Ssf_Release.req(ReleaseType),
  Srf_Release.req(ReleaseType),
  Ssf_Release.ind(ReleaseType),
  Srf_Release.ind(ReleaseType),
  Ssf_SubsequentAddress.r      eq(SubsequentAddressType);)]][9 �      (!
   6 ~  �  !
   
         )[8         (!�   /* Signals from SRF to SSF-CCF*/
SIGNALLIST srfTossf=
  Ssf_CallProgress.ind,
  Ssf_Facility.ind,
  Ssf_FacilityResult.ind,
  Ssf_FacilityError.ind,
  Ssf_Data.ind,
         Ssf_Setup.conf,
  Ssf_Release.ind,
/*Additional signal for IP setup*/
  Ssf_Setup.ind;

/* Signals from SSF-CCF to SRF */
SIGNALLIST ssfTosrf=
  Ssf_Setup.req,
  Ssf_Facility.req,
  Ssf_FacilityResult.req,
  Ssf_FacilityError.req,
  Ssf_Data.req,
  Ssf_R      !elease.req,
  Ssf_SubsequentAddress.req,
/*Additional signal for IP setup*/
  Ssf_Setup.resp;

/* Signals from SRF to IP*/
SIGNALLIST SigCon_Out=
  Srf_Setup.req,
  Srf_Facility.req,
  Srf_FacilityResult.req,
  Srf_FacilityError.req,
  Srf_Data.req,
  Srf_      "Release.req,
/*Additional signal for IP setup*/
  Srf_Setup.resp;

/* Signals from IP to SRF*/
SIGNALLIST SigCon_In=
  Srf_CallProgress.ind,
  Srf_Facility.ind,
  Srf_FacilityResult.ind,
  Srf_FacilityError.ind,
  Srf_Data.ind,
  Srf_Setup.conf,
  Srf_Rele      .()[         (!
        !
    2   2   !   ( P   )[ �      (!
   
     )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6 �     )][9 �      (!
   6 ,  �   !
   
         )[8         (!�   SIGNAL
E      %3 [         (!
    :  �  !
    2   2   !   ( 4   )[       (!
   6 �   �   !
   
   �  )[       (!
   6 �   �   )[       (!
   6 �   �   !
   
         )]][  
      (!
   6 G  �   )][9    
   
(!
   6    #   !
   
  ������������       (   ����raseMessagePrim(EraseMessageType),
PlayAnnouncementPrim(PlayAnnouncementType),
PlayAnnoucementErrorPrim(PlayAnnouncementErrorType),
PromptAndCollectUserInformationPrim(PromptAndCollectUserInformationType),
PromptAndCollectUserInformationResultPrim(PromptAn      &dCollectUserInformationResultType),
PromptAndCollectUserInformationErrorPrim(PromptAndCollectUserInformationErrorType),
PromptAndReceiveMessagePrim(PromptAndReceiveMessageType),
PromptAndReceiveMessageResultPrim(PromptAndReceiveMessageResultType),
PromptAn      'dReceiveMessageErrorPrim(PromptAndReceiveMessageErrorType),
ScriptClosePrim(ScriptCloseType),
ScriptCloseErrorPrim(ScriptCloseErrorType),
ScriptEventPrim(ScriptEventType),
ScriptInformationPrim(ScriptInformationType),
ScriptInformationErrorPrim(ScriptInfor      (mationErrorType),
ScriptRunPrim(ScriptRunType),
ScriptRunErrorPrim(ScriptRunErrorType),
SpecialisedResourceReportPrim(SpecialisedResourceReportType),
CancelPrim(CancelType),
CancelErrorPrim(CancelErrorType),
AssistRequestInstructionsPrim(AssistRequestInstr      )uctionsType),
ApplicationBeginPrim(TransactionIdType),
ApplicationAbortPrim(TransactionIdType),
ApplicationEndPrim(TransactionIdType);)]][9 �      (!
   6 ^  �  !
   
         )[8         (!9   /*Signals from SRF to SCF*/
SIGNALLIST  CS2_INAP_Prim_To_      *SCF=
  PlayAnnoucementErrorPrim,
  PromptAndCollectUserInformationResultPrim,
  PromptAndCollectUserInformationErrorPrim,
  PromptAndReceiveMessageResultPrim,
  PromptAndReceiveMessageErrorPrim,
  ScriptCloseErrorPrim,
  ScriptEventPrim,
  ScriptInformatio      +nErrorPrim,
  ScriptRunErrorPrim,
  SpecialisedResourceReportPrim,
  CancelErrorPrim,
  AssistRequestInstructionsPrim,
  ApplicationBeginPrim,
  ApplicationAbortPrim,
  ApplicationEndPrim;
/*Signals from SCF to SRF*/
SIGNALLIST CS2_INAP_Prim_From_SCF=
  Er      ,aseMessagePrim,
  PlayAnnouncementPrim,
  PromptAndCollectUserInformationPrim,
  PromptAndReceiveMessagePrim,
  ScriptClosePrim,
  ScriptInformationPrim,
  ScriptRunPrim,
  CancelPrim,
  ApplicationBeginPrim,
  ApplicationAbortPrim,
  ApplicationEndPrim;)]      -][9 �      (!
   6 �  �  !
   
         )[8         (!�    SIGNALLIST srmTosrsm=
  (CS2_INAP_Prim_From_SCF),
  (SigCon_In),
  (ssfTosrf);

SIGNALLIST srsmTosrm
  (CS2_INAP_Prim_To_SCF),
  (SigCon_Out),
  (srfTossf); )]]]]}fTossf); )]]]]}---------------   �����ase.ind,
/*Additional signal for IP setup*/
  Srf_Setup.ind; )]][9 �      (!
   6 �  :  !
   
         )[8         (!�    /* Additional Signals required when the connection
is established from the IP, this is not the normal
case. */
SIGNAL
Srf_Setup.in      /d(Srf_SetupType),
Ssf_Setup.ind(Ssf_SetupType),
Ssf_Setup.resp(Ssf_SetupType),
Ssf_Setup.resp(Ssf_SetupType);
)]]]]}upType);
)]]]]}-----------------------------------------------------------------------------------------------------------------------------   t����()[w         (!   G SDL)]}-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   ����