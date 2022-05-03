USE FCC_ULS_ImportDB  
GO

--ADDITIONAL APPLICATION DETAIL
CREATE TABLE dbo.PUBACC_APP_A2
(
   Record_Type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   ULS_File_Number           char(14)             NULL,
   EBF_Number                varchar(30)          NULL,
   spectrum_manager_leasing  char(1)              NULL, -- No Longer Used
   defacto_transfer_leasing  char(1)              NULL, -- No Longer Used
   new_spectrum_leasing      char(1)              NULL, -- No Longer Used
   spectrum_subleasing       char(1)              NULL, -- No Longer Used
   xfer_control_lessee       char(1)              NULL, -- No Longer Used
   revision_spectrum_lease   char(1)              NULL, -- No Longer Used
   assignment_spectrum_lease char(1)              NULL,
   pfr_status		char(1)		     NULL
)
GO

--AIRCRAFT
CREATE TABLE dbo.PUBACC_APP_AC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   aircraft_count            int                  NULL,
   type_of_carrier           char(1)              NULL,
   portable_indicator        char(1)              NULL,
   fleet_indicator           char(1)              NULL,
   n_number                  char(10)             NULL
)
GO

--APPLICATION DETAIL
CREATE TABLE dbo.PUBACC_APP_AD
(
   Record_Type               	char(2)              NULL,
   unique_system_identifier  	numeric(9,0)         NOT NULL,
   ULS_File_Number           	char(14)             NULL,
   EBF_Number                	varchar(30)          NULL,
   Application_Purpose       	char(2)              NULL,
   Application_Status       		char(1)              NULL,
   Application_Fee_Exempt    	char(1)              NULL,
   Regulatory_Fee_Exempt     	char(1)              NULL,
   [Source]                    	char(1)              NULL,
   requested_expiration_date_mmdd 	char(4)              NULL,
   Receipt_Date              	char(10)             NULL,
   Notification_Code         	char(1)              NULL,
   Notification_date         	char(10)             NULL,
   Expanding_Area_or_Contour 	char(1)              NULL,
   Change_Type               	char(1)              NULL,
   Original_Application_Purpose 	char(2)              NULL,
   Requesting_A_Waiver       	char(1)              NULL,
   How_Many_Waivers_Requested 	int                  NULL,
   Any_Attachments           	char(1)              NULL,
   Number_of_Requested_SIDs  	int                  NULL,
   fee_control_num           	char(16)             NULL,
   date_entered              	char(10)             NULL,
   reason                    	varchar(255)         NULL, -- No longer Used
   frequency_coordination_indicat 	char(1)              NULL,
   emergency_sta             	char(1)              NULL,
   overall_change_type       	char(1)              NULL,
   slow_growth_ind           	char(1)              NULL,
   previous_waiver           	char(1)              NULL,
   waiver_deferral_fee       	char(1)              NULL,
   has_term_pending_ind		char(1)		     NULL
)
GO

CREATE TABLE dbo.PUBACC_APP_AG
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   action_requested		char(1)		     NULL,
   agreement_type		char(2) 	     NULL,
   agreement_name		varchar(50)	     NULL,
   des_ent_or_closed_bid_impact char(1)	     NULL,
   reserved_for_future	char(1)		     NULL,
   mod_to_rev		char(1)		     NULL						 	  	
)
GO

--ADDITIONAL MM APPLICATION ATTACHMENT INFORMATION
CREATE TABLE dbo.PUBACC_APP_AH
(
   record_type		char(2)		     NOT NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   ULS_File_Number              char(14)             NULL,
   attachment_desc           varchar(60)          NULL, 
   attachment_file_id        char(18)             NULL
)
GO

--AMATEUR
CREATE TABLE dbo.PUBACC_APP_AM
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   ULS_File_Number              char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   operator_class            char(1)              NULL,
   group_code                char(1)              NULL,
   region_code               tinyint              NULL,
   trustee_callsign          char(10)             NULL,
   trustee_indicator         char(1)              NULL,
   physician_certification   char(1)              NULL,
   ve_signature              char(1)              NULL,
   systematic_callsign_change char(1)             NULL,
   vanity_callsign_change    char(1)              NULL,
   vanity_relationship       char(12)             NULL,
   previous_callsign         char(10)             NULL,
   previous_operator_class   char(1)              NULL,
   trustee_name              varchar(50)          NULL
)
GO

--ANTENNA
CREATE TABLE dbo.PUBACC_APP_AN
(
   record_type              	char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                	char(10)             NULL,
   antenna_action_performed  char(1)              NULL,
   antenna_number            int                  NULL,
   location_number           int                  NULL,
   receive_zone_code         char(6)              NULL,
   antenna_type_code         char(1)              NULL,
   height_to_tip            	numeric(5,1)         NULL,
   height_to_center_raat     numeric(5,1)         NULL,
   antenna_make              varchar(25)          NULL,
   antenna_model             varchar(25)          NULL,
   tilt                      numeric(3,1)         NULL,
   polarization_code         char(5)              NULL,
   beamwidth                 numeric(4,1)         NULL,
   gain                      numeric(4,1)         NULL,
   azimuth                   numeric(4,1)         NULL,
   height_above_avg_terrain  numeric(5,1)         NULL,
   diversity_height          numeric(5,1)         NULL,
   diversity_gain            numeric(4,1)         NULL,
   diversity_beam            numeric(4,1)         NULL,
   reflector_height          numeric(5,1)         NULL,
   reflector_width           numeric(4,1)         NULL,
   reflector_separation      numeric(5,1)         NULL,
   repeater_seq_num          int                  NULL,
   back_to_back_tx_dish_gain numeric(4,1)         NULL,
   back_to_back_rx_dish_gain numeric(4,1)         NULL,
   location_name             varchar(20)          NULL,
   passive_repeater_id       int                  NULL,
   alternative_cgsa_method   char(1)              NULL,
   path_number               int                  NULL,
   line_loss                 numeric(3,1)         NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL      
)
GO

CREATE TABLE dbo.PUBACC_APP_AP
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   agreement_name		varchar(50)	     NULL,
   action_requested		char(1)		     NULL,
   legal_entity_name		varchar(50)	     NULL,
   first_name		varchar(20)	     NULL,
   mi                        char(1)              NULL,
   last_name                 varchar(20)          NULL,
   suffix                    char(3)              NULL,
   FCC_reg_number	        char(10)	     NULL	
)
GO

--ASSOCIATED CALL SIGN
CREATE TABLE dbo.PUBACC_APP_AS
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   assoc_callsign            char(10)             NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL,
   action_performed  	char(1)              NULL
) 
GO

--ATTACHMENT
CREATE TABLE dbo.PUBACC_APP_AT
(
   Record_Type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   ULS_File_Number           char(14)             NULL,
   EBF_Number                varchar(30)          NULL,
   Attachment_Code           char(1)              NULL,
   Attachment_Description    varchar(60)          NULL,
   Attachment_Date           char(10)             NULL,
   attachment_file_name      varchar(60)          NULL,
   attachment_action_performed char(1)            NULL
)
GO

--BROADCAST CALL SIGN
CREATE TABLE dbo.PUBACC_APP_BC
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   broadcast_callsign        char(10)             NULL,
   broadcast_city            char(20)             NULL,
   broadcast_state           char(2)              NULL,
   parent_facility_id        int                  NULL,
   parent_class_code         char(2)              NULL,
   nonparent_type_code       char(1)              NULL
)
GO

--BIDDING CREDITS
CREATE TABLE dbo.PUBACC_APP_BD
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   involves_credit           char(1)              NULL,
   involves_payment          char(1)              NULL,
   involves_close_bidding    char(1)              NULL,
   credits_paid              char(1)              NULL,
   bc_same_elig_status       char(1)              NULL,
   bc_diff_elig_status       char(1)              NULL,
   bc_dnq_elig_status	char(1)              NULL,
   payments                  char(1)              NULL,
   ip_same_elig_status       char(1)              NULL,
   ip_diff_elig_status       char(1)              NULL,
   ip_dnq_elig_status        char(1)              NULL,
   closed_notification       char(1)              NULL,
   qualifies_for_cb          char(1)              NULL,
   dnq_for_cb                char(1)              NULL,
   bc_ten_percent		char(1)              NULL,
   bc_affiliate		char(1)              NULL,
   bc_cont_elig		char(1)              NULL,
   bc_shared			char(1)              NULL,
   [document]			char(1)              NULL,
   ip_ten_percent		char(1)              NULL,	
   ip_affiliate		char(1)              NULL, 
   ip_cont_elig		char(1)              NULL,
   ip_shared			char(1)              NULL,
   sec_date			   char(10)              NULL,
   lien_date			char(10)              NULL,
   cb_ten_percent		char(1)              NULL,
   cb_affiliate		char(1)              NULL,
   cb_cont_elig		char(1)              NULL,
   cb_shared			char(1)              NULL
)
GO

--BRS/EBS Specific Questions
CREATE TABLE dbo.PUBACC_APP_BE
(
   record_type                 char(2)              NOT NULL,
   unique_system_identifier    numeric(9,0)         NOT NULL,
   uls_file_number             char(14)             NULL,
   ebf_number                  varchar(30)          NULL,
   callsign                    char(10)             NULL,
   multichannel		  char(1)	       NULL,
   cable_tv			  char(1)	       NULL,
   programming_requirements	  char(1)	       NULL,
   interference_protection	  char(1)	       NULL
)
GO

--BUILDOUT FREQUENCY
CREATE TABLE dbo.PUBACC_APP_BF
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   call_sign                 char(10)             NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   buildout_code             int                  NULL,
   buildout_deadline         char(10)             NULL,
   buildout_date             char(10)             NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--BUILDOUT LOCATION
CREATE TABLE dbo.PUBACC_APP_BL
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   call_sign                 char(10)             NULL,
   location                  int                  NULL,
   buildout_code             int                  NULL,
   buildout_deadline         char(10)             NULL,
   buildout_date             char(10)             NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--BUILDOUT
CREATE TABLE dbo.PUBACC_APP_BO
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   call_sign                 char(10)             NULL,
   buildout_code             int                  NULL,
   buildout_deadline         char(10)             NULL,
   buildout_date             char(10)             NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

CREATE TABLE dbo.PUBACC_APP_BT
(
   record_Type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   ULS_File_Number           char(14)             NULL,
   EBF_Number                varchar(30)          NULL,
   Applicant_Status		char(1)              NULL
)
GO

--Closed Bidding/ Designated Entity Eligibility
CREATE TABLE dbo.PUBACC_APP_CD
(
	Record_Type			char(2)		NULL,
	Unique_System_Identifier	numeric(9,0)	NOT NULL,
	ULS_File_Number			char(14)	NULL,
	EBF_Number			varchar(30)	NULL,
	Year_Sequence			smallint	NOT NULL,
	Gross_Revenues			money		NULL,
	Year_End_Date			char(10)	NULL,
	Aggregate_Gros_Rvn_DE		money		NULL,
	Aggregate_Gros_Rvn_CB		money		NULL,
	Total_Assets			money		NULL								
)
GO

--CALL SIGN/FILE NUMBER
CREATE TABLE dbo.PUBACC_APP_CF
(
   Record_Type                       char(2)              NULL,
   unique_system_identifier          numeric(9,0)         NOT NULL,
   ULS_File_Number                   char(14)             NULL,
   EBF_Number                        varchar(30)          NULL,
   Item_Type_Indicator               char(1)              NULL,
   Item_Type                         char(14)             NULL,
   Constructed                       char(1)              NULL,
   Location_Number                   int                  NULL,
   Path_Number                       int                  NULL,
   Frequency_Assigned                numeric(16,8)        NULL,
   Frequency_Upper_Band              numeric(16,8)        NULL,
   number_of_mobiles                 int                  NULL,
   action_performed                  char(1)              NULL,
   actual_date_of_construction       char(30)	          NULL,
   frequency_number                  int                  NULL,
   Assign_Callsign                   char(10)             NULL 
)
GO

--Coast and Ground
CREATE TABLE dbo.PUBACC_APP_CG
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   station_available         char(1)              NULL,
   public_correspondence     char(1)              NULL,
   station_identifier        char(12)             NULL,
   aeronautical_enroute_call_sign char(10)        NULL,
   faa_office_notified       varchar(255)         NULL,
   date_faa_notified         char(10)             NULL,
   seeking_authorization     char(1)              NULL,
   regularly_engaged         char(1)              NULL,
   engaged                   char(1)              NULL,
   public_mooring            char(1)              NULL,
   servicing                 char(1)              NULL,
   fixed_station             char(1)              NULL,
   maritime_support          char(1)              NULL,
   aeronautical_fixed        char(1)              NULL,
   unicom                    char(1)              NULL,
   search_and_rescue         char(1)              NULL,
   flight_test_uhf           char(1)              NULL,
   flight_test_manufacturer  char(1)              NULL,
   flight_test_parent_corporation char(1)         NULL,
   flight_test_educational   char(1)              NULL,
   flight_school_certitication char(1)            NULL,
   lighter_than_air          char(1)              NULL,
   ballooning                char(1)              NULL,
   located_at_airport        char(1)              NULL,
   radiodetermination_not_faa char(1)             NULL,
   radiodetermination_equipment char(1)           NULL,
   radiodetermination_public char(1)              NULL,
   radiodetermination_elts   char(1)              NULL,
   civil_air_patrol          char(1)              NULL,
   aeronautical_enroute      char(1)              NULL,
   mobile_routine            char(1)              NULL,
   mobile_owner_operator     char(1)              NULL,
   mobile_agreement          char(1)              NULL,
   coast_ground_identifier   char(12)             NULL,
   selective_call_sign_identifier char(4)         NULL,
   station_class             char(4)              NULL,
   status_code		char(1)	             NULL,
   status_date		char(10)	     NULL
)
GO

--COMMENTS
CREATE TABLE dbo.PUBACC_APP_CO
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   ULS_File_Number              char(14)             NULL,
   callsign                  char(10)             NULL,
   comment_date              char(30)             NULL,
   [description]               varchar(255)         NULL,
   status_code		char(10)		     NULL, -- should be char(1)
   status_date		char(30)             NULL
)
GO

--CONTROL POINT
CREATE TABLE dbo.PUBACC_APP_CP
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   control_point_action_performed char(1)         NULL,
   control_point_number      int                  NULL,
   control_address           varchar(80)          NULL,
   control_city              char(20)             NULL,
   state_code                char(2)              NULL,
   control_phone             char(10)             NULL,
   control_county            varchar(60)          NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--COSER
CREATE TABLE dbo.PUBACC_APP_CS
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   call_sign                 char(10)             NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   coser_result              char(5)              NULL,
   coser_num                 char(10)             NULL,
   coser_activity_type       char(1)              NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--EMISSION
CREATE TABLE dbo.PUBACC_APP_EM
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   emission_action_performed char(1)              NULL,
   emission_code             char(10)             NULL,
   digital_mod_rate          numeric(8,1)         NULL,
   digital_mod_type          char(255)            NULL,
   frequency_number          int                  NULL,
   status_code		char(1)		     NULL,
   status_date		char(30)	     NULL,
   emission_sequence_id       int                  NULL
)
GO

--ENTITY
CREATE TABLE dbo.PUBACC_APP_EN
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   entity_type               char(2)              NULL,
   licensee_id               char(9)              NULL,
   entity_name               varchar(200)         NULL,
   first_name                varchar(20)          NULL,
   mi                        char(1)              NULL,
   last_name                 varchar(20)          NULL,
   suffix                    char(3)              NULL,
   phone                     char(10)             NULL,
   fax                       char(10)             NULL,
   email                     varchar(50)          NULL,
   street_address            varchar(60)          NULL,
   city                      varchar(20)          NULL,
   [state]                     char(2)              NULL,
   zip_code                  char(9)              NULL,
   po_box                    varchar(20)          NULL,
   attention_line            varchar(35)          NULL,
   sgin                      char(3)              NULL,
   frn                       char(10)             NULL,
   applicant_type_code       char(1)              NULL,
   applicant_type_other      char(40)             NULL,
   status_code               char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--ADDITIONAL FREQUENCY INFORMATION
CREATE TABLE dbo.PUBACC_APP_F2
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   action_performed          char(1)              NULL, 
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency_number          int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   frequency_upper_band      numeric(16,8)        NULL,
   offset                    char(3)              NULL,
   frequency_channel_block   char(4)              NULL,
   equipment_class	        char(2)              NULL, 
   minimum_power_output	numeric(15,3)        NULL,
   date_first_use            char(30)             NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL,
   trans_meth                char(1)              NULL
)
GO

--FRC Admin
CREATE TABLE dbo.PUBACC_APP_FA
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   operator_class            char(2)              NULL,
   ship_radar_endorsement    char(1)              NULL,
   six_month_endorsement     char(1)              NULL,
   date_of_birth             char(10)             NULL,
   certification_not_restricted char(1)           NULL,
   cert_restricted_permit    char(1)              NULL,
   restricted_permit_limited_use char(1)          NULL,
   cole_manager_code         char(5)              NULL,
   dm_call_sign              char(10)             NULL,
   proof_of_passing          char(1)              NULL 
)
GO

--FREQUENCY COORDINATION
CREATE TABLE dbo.PUBACC_APP_FC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   coordination_number       char(25)             NULL,
   coordinator_name          varchar(40)          NULL,
   coordinator_phone         char(10)             NULL,
   freq_coordination_date    char(10)             NULL,
   action_performed          char(1)              NULL
)
GO

--FREQUENCY FREE FORM SPECIAL CONDITION
CREATE TABLE dbo.PUBACC_APP_FF
(
   record_type               char(2)              NULL ,
   unique_system_identifier  numeric(9,0)         NULL ,
   callsign                  char(10)             NULL ,
   location_number           int                  NULL ,
   antenna_number            int                  NULL ,
   frequency                 numeric(16,8)        NULL ,
   frequency_number          int                  NULL ,
   freq_freeform_cond_type   char(1)              NULL ,
   unique_freq_freeform_id   numeric(9,0)         NULL ,
   sequence_number           int                  NULL ,
   freq_freeform_condition   varchar(255)         NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
) 
GO

--FREQUENCY
CREATE TABLE dbo.PUBACC_APP_FR
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   frequency_action_performed char(1)             NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   class_station_code        char(4)              NULL,
   op_altitude_code          char(2)              NULL,
   frequency_assigned        numeric(16,8)        NULL,
   frequency_upper_band      numeric(16,8)        NULL,
   frequency_carrier         numeric(16,8)        NULL,
   time_begin_operations     int                  NULL,
   time_end_operations       int                  NULL,
   power_output              numeric(15,3)        NULL,
   power_erp                 numeric(15,3)        NULL,
   tolerance                 numeric(6,5)         NULL,
   frequency_ind             char(1)              NULL,
   [status]                    char(1)              NULL,
   eirp                      numeric(7,1)         NULL,
   transmitter_make          varchar(25)          NULL,
   transmitter_model         varchar(25)          NULL,
   auto_transmitter_power_control char(1)         NULL,
   cnt_mobile_units          int                  NULL,
   cnt_mob_pagers            int                  NULL,
   freq_seq_id               int                  NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--FREQUENCY SPECIAL CONDITION
CREATE TABLE dbo.PUBACC_APP_FS
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   call_sign                 char(10)             NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency                 numeric(16,8)        NULL,
   frequency_number          int                  NULL,
   special_condition_type    char(1)              NULL,
   special_condition_code    int                  NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--FREQUENCY TYPE
CREATE TABLE dbo.PUBACC_APP_FT
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   freq_type_action_performed char(1)             NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   frequency_type_number     int                  NULL,
   frequency_type_code       char(2)              NULL
)
GO

--APPLICATION/LICENSE HEADER
CREATE TABLE dbo.PUBACC_APP_HD
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   license_status            char(1)              NULL,
   radio_service_code        char(2)              NULL,
   grant_date                char(10)             NULL,
   expired_date              char(10)             NULL,
   cancellation_date         char(10)             NULL,
   eligibility_rule_num      char(10)             NULL,
   applicant_type_code_reserved       char(1)              NULL,
   alien                     char(1)              NULL,
   alien_government          char(1)              NULL,
   alien_corporation         char(1)              NULL,
   alien_officer             char(1)              NULL,
   alien_control             char(1)              NULL,
   revoked                   char(1)              NULL,
   convicted                 char(1)              NULL,
   adjudged                  char(1)              NULL,
   involved_reserved      	char(1)              NULL,
   common_carrier            char(1)              NULL,
   non_common_carrier        char(1)              NULL,
   private_comm              char(1)              NULL,
   fixed                     char(1)              NULL,
   mobile                    char(1)              NULL,
   radiolocation             char(1)              NULL,
   satellite                 char(1)              NULL,
   developmental_or_sta      char(1)              NULL,
   interconnected_service    char(1)              NULL,
   certifier_first_name      varchar(20)          NULL,
   certifier_mi              char(1)              NULL,
   certifier_last_name       varchar(20)          NULL,
   certifier_suffix          char(3)              NULL,
   certifier_title           char(40)             NULL,
   gender                    char(1)              NULL,
   african_american          char(1)              NULL,
   native_american           char(1)              NULL,
   hawaiian                  char(1)              NULL,
   asian                     char(1)              NULL,
   white                     char(1)              NULL,
   ethnicity                 char(1)              NULL,
   effective_date            char(10)             NULL,
   last_action_date          char(10)             NULL,
   auction_id                int                  NULL,
   reg_stat_broad_serv       char(1)              NULL,
   band_manager              char(1)              NULL,
   type_serv_broad_serv      char(1)              NULL,
   alien_ruling              char(1)              NULL,
   licensee_name_change	char(1)		     NULL
)
GO

--HISTORY
CREATE TABLE dbo.PUBACC_APP_HS
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   callsign                  char(10)             NULL,
   log_date                  char(10)             NULL,
   code                      char(6)              NULL
)
GO

--INTERNATIONAL ADDRESSES
CREATE TABLE dbo.PUBACC_APP_IA
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   international_address_1   varchar(60)          NULL,
   international_address_2   varchar(60)          NULL,
   international_city        varchar(30)          NULL,
   country                   varchar(40)          NULL,
   international_zip_code    varchar(20)          NULL,
   international_phone       char(20)             NULL,
   international_fax         char(20)             NULL
)
GO

--IRAC
CREATE TABLE dbo.PUBACC_APP_IR
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   call_sign                 char(10)             NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   irac_result               char(2)              NULL,
   fas_docket_num            char(8)              NULL,
   fccm_num                  char(10)             NULL,
   faa_ng_num                char(11)             NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL,
   a_irac_status_code 	smallint     	     NULL
)
GO

--LICENSE_ATTACHMENT
CREATE TABLE dbo.PUBACC_APP_LA
 (
   record_type               char(2)              NULL ,
   unique_system_identifier  numeric(9,0)         NULL ,
   callsign                  char(10)             NULL ,
   attachment_code           char(1)              NULL ,
   attachment_desc           varchar(60)          NULL ,
   attachment_date           char(10)             NULL ,
   attachment_filename       varchar(60)          NULL ,
   action_performed          char(1)              NULL
)
GO

--ADDITIONAL LOCATION DATA
CREATE TABLE dbo.PUBACC_APP_L2
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   location_action_performed	char(1)              NULL,
   location_number           int                  NULL,
   registration_required	char(1)              NULL,
   protection_date		char(30)             NULL,
   link_reg_num              varchar(30)          NULL,
   link_reg_action_performed char(1)              NULL,
   mexico_clearance_indicator char(1)	     NULL,
   quiet_zone_consent        char(1)		     NULL,	
   status_code		char(1)		     NULL,
   status_date		char(30)	     NULL
)
GO

--LOCATION FREE FORM SPECIAL CONDITION
CREATE TABLE dbo.PUBACC_APP_LF
 (
   record_type               char(2)              NULL ,
   unique_system_identifier  numeric(9,0)         NULL ,
   callsign                  char(10)             NULL ,
   location_number           int                  NULL ,
   loc_freeform_cond_type    char(1)              NULL ,
   unique_loc_freeform_id    numeric(9,0)         NULL ,
   sequence_number           int                  NULL ,
   loc_freeform_condition    varchar(255)         NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--ADDITIONAL MM LICENSE ATTACHMENT INFORMATION
CREATE TABLE dbo.PUBACC_APP_LH
(
   record_type		char(2)		     NOT NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   call_sign                 char(10)             NULL,
   attachment_desc           varchar(60)          NULL, 
   attachment_file_id        char(18)             NULL
)
GO

--LAND MOBILE ADMINISTRATION
CREATE TABLE dbo.PUBACC_APP_LM
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   ext_implement_appr        char(1)              NULL,
   lm_eligibility_activity   varchar(255)         NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--LOCATION
CREATE TABLE dbo.PUBACC_APP_LO
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   location_action_performed char(1)              NULL,
   location_type_code        char(1)              NULL,
   location_class_code       char(1)              NULL,
   location_number           int                  NULL,
   site_status               char(1)              NULL,
   corresponding_fixed_location int               NULL,
   location_address          varchar(80)          NULL,
   location_city             char(20)             NULL,
   location_county           varchar(60)          NULL,
   location_state            char(2)              NULL,
   radius_of_operation       numeric(5,1)         NULL,
   area_of_operation_code    char(1)              NULL,
   clearance_indicator       char(1)              NULL,
   ground_elevation          numeric(7,1)         NULL,
   lat_degrees               int                  NULL,
   lat_minutes               int                  NULL,
   lat_seconds               numeric(3,1)         NULL,
   lat_direction             char(1)              NULL,
   long_degrees              int                  NULL,
   long_minutes              int                  NULL,
   long_seconds              numeric(3,1)         NULL,
   long_direction            char(1)              NULL,
   max_lat_degrees           int                  NULL,
   max_lat_minutes           int                  NULL,
   max_lat_seconds           numeric(3,1)         NULL,
   max_lat_direction         char(1)              NULL,
   max_long_degrees          int                  NULL,
   max_long_minutes          int                  NULL,
   max_long_seconds          numeric(3,1)         NULL,
   max_long_direction        char(1)              NULL,
   nepa                      char(1)              NULL,
   quiet_zone_notification_date char(10)          NULL,
   tower_registration_number char(10)             NULL,
   height_of_support_structure numeric(7,1)       NULL,
   overall_height_of_structure numeric(7,1)       NULL,
   structure_type            char(6)              NULL,
   airport_id                char(4)              NULL,
   location_name             char(20)             NULL,
   units_hand_held           int                  NULL,
   units_mobile              int                  NULL,
   units_temp_fixed          int                  NULL,
   units_aircraft            int                  NULL,
   units_itinerant           int                  NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL,
   earth_agree               char(1)              NULL
)
GO

--LOCATION SPECIAL CONDITION
CREATE TABLE dbo.PUBACC_APP_LS
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   call_sign                 char(10)             NULL,
   location_number           int                  NULL,
   special_condition_type    char(1)              NULL,
   special_condition_code    int                  NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--MARKET COORDINATE
CREATE TABLE dbo.PUBACC_APP_MC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   undefined_partitioned_area int                 NULL,
   partition_sequence_number int                  NULL,
   partition_lat_degrees     int                  NULL,
   partition_lat_minutes     int                  NULL,
   partition_lat_seconds     numeric(3,1)         NULL,
   partition_lat_direction   char(1)              NULL,
   partition_long_degrees    int                  NULL,
   partition_long_minutes    int                  NULL,
   partition_long_seconds    numeric(3,1)         NULL,
   partition_long_direction  char(1)              NULL
)
GO

--MEA NUMBER
CREATE TABLE dbo.PUBACC_APP_ME
(
   record_type              	 char(2)              NOT NULL,
   unique_system_identifier   numeric(9,0)         NOT NULL,
   uls_file_number            char(14)             NULL,
   ebf_number              	 varchar(30)          NULL,
   callsign                	 char(10)             NULL,
   mea_number		            char(6)	      NULL,
   action_performed		      char(1)	      NULL 
)
GO

--CHANNEL PLAN INFORMATION
CREATE TABLE dbo.PUBACC_APP_MH
(
   record_type                char(2)             NOT NULL,
   unique_system_identifier 	 numeric(9,0)        NOT NULL,
   uls_file_number          	 char(14)            NULL,
   ebf_number               	 varchar(30)         NULL,
   callsign                 	 char(10)            NULL,
   action_performed		      char(1)	     NULL,
   channel_plan_number	      char(4)	     NULL,
   channel_plan		         char(1)	     NULL
)
GO

--MARKET FREQUENCY
CREATE TABLE dbo.PUBACC_APP_MF
(
   record_type               char(2)        	NULL,
   unique_system_identifier  numeric(9,0)   	NOT NULL,
   uls_file_number           char(14)       	NULL,
   ebf_number                varchar(30)    	NULL,
   call_sign                 char(10)        NULL,
   partitioned_seq_num	      char(6)         NULL,
   lower_frequency          	numeric(16,8)   NULL,
   upper_frequency          	numeric(16,8)   NULL,
   def_und_ind		            char(1)		NULL
)
GO

--MDS/ITFS ADMINISTRATION
CREATE TABLE dbo.PUBACC_APP_MI
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   facility_type_code        char(4)              NULL,
   statement_of_intention    char(1)              NULL,
   license_type_code         char(1)              NULL
)
GO

--MARKET
CREATE TABLE dbo.PUBACC_APP_MK
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   market_code               char(6)              NULL,
   channel_block             char(4)              NULL,
   submarket_code            int                  NULL,
   market_name               char(30)             NULL,
   coverage_partitioning     char(1)              NULL,
   coverage_dissagregation   char(1)              NULL,
   cellular_phase_id         smallint             NULL,
   [population]                numeric(9,0)         NULL,
   tribal_credit_indicator   char(1)              NULL,
   tribal_credit_calculation money                NULL,
   additional_credit_requested money              NULL,
   tribal_credit_awarded     money                NULL,
   additiona_credit_awarded  money                NULL,
   bc_pct			numeric(5,4)	     NULL,
   open_closed_bidding	char(1)		     NULL				
)
GO

--MARKET PARTITION
CREATE TABLE dbo.PUBACC_APP_MP
(
   record_type            	char(2)         NULL,
   unique_system_identifier 	numeric(9,0)    NOT NULL,
   uls_file_number          	char(14)        NULL,
   ebf_number               	varchar(30)     NULL,
   call_sign                 char(10)        NULL,
   market_partition_code   	char(6)         NULL,
   defined_partition_area    varchar(60)     NULL,
   defined_area_population  	numeric(9,0) 	NULL,
   include_exclude_ind       char(1)         NULL,
   partitioned_seq_num	int             NULL,
   action_performed		char(1)         NULL,
   census                   	int		NULL,
   def_und_ind		char(1)		NULL
)
GO

--MICROWAVE
CREATE TABLE dbo.PUBACC_APP_MW
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   pack_indicator            char(1)              NULL,
   pack_registration_num     int                  NULL,
   pack_name                 varchar(50)          NULL,
   type_of_operation         varchar(45)          NULL,
   smsa_code                 char(6)              NULL,
   station_class             char(4)              NULL,
   cum_effect_is_major       char(1)              NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--AREA OF OPERATION TEXT
CREATE TABLE dbo.PUBACC_APP_OP
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   location_number           int                  NULL,
   area_text_sequence_num    int                  NULL,
   area_of_operation         varchar(255)         NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--MICROWAVE PATH
CREATE TABLE dbo.PUBACC_APP_PA
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   path_action_performed     char(1)              NULL,
   path_number               int                  NULL,
   transmit_location_number  int                  NULL,
   transmit_antenna_number   int                  NULL,
   receiver_location_number  int                  NULL,
   receiver_antenna_number   int                  NULL,
   mas_dems_subtype          char(2)              NULL,
   path_type_desc            char(20)             NULL,
   passive_receiver_indicator char(1)             NULL,
   country_code              char(3)              NULL,
   interference_to_gso       char(1)              NULL,
   receiver_callsign         varchar(10)          NULL,
   angular_sep		numeric(3,2)         NULL,
   cert_no_alternative	char(1)		     NULL,
   cert_no_interference	char(1)  	     NULL,
   status_code		char(1)			NULL,
   status_date		char(30)		NULL
)
GO

--POINTS OF COMMUNICATION
CREATE TABLE dbo.PUBACC_APP_PC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   action_performed          char(1)              NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency                 numeric(16,8)        NULL,
   subscriber_call_sign      char(10)             NULL,
   city                      varchar(20)          NULL,
   [state]                     char(2)              NULL,
   lat_degrees               int                  NULL,
   lat_minutes               int                  NULL,
   lat_seconds               numeric(3,1)         NULL,
   lat_direction             char(1)              NULL,
   long_degrees              int                  NULL,
   long_minutes              int                  NULL,
   long_seconds              numeric(3,1)         NULL,
   long_direction            char(1)              NULL,
   point_of_com_frequency    numeric(16,8)        NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--RADIAL
CREATE TABLE dbo.PUBACC_APP_RA
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   radial_action_performed   char(1)              NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   frequency_number	        int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   frequency_upper_band      numeric(16,8)        NULL,
   radial_direction          numeric(3,0)         NULL,
   radial_haat               numeric(5,1)         NULL,
   radial_erp                numeric(7,3)         NULL,
   dist_to_sab               numeric(4,1)         NULL,
   dist_to_cgsa              numeric(4,1)         NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--RECEIVER
CREATE TABLE dbo.PUBACC_APP_RC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   radial_action_performed   char(1)              NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   receiver_make             varchar(25)          NULL,
   receiver_model            varchar(25)          NULL,
   receiver_stability	numeric(6,5)         NULL,
   receiver_noise_figure	numeric(5,2)         NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--REASON
CREATE TABLE dbo.PUBACC_APP_RE
(
   Record_Type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   ULS_File_Number           char(14)             NULL,
   EBF_Number                varchar(30)          NULL,
   Reason                    varchar(255)         NULL
)
GO

--Revenue Information
CREATE TABLE dbo.PUBACC_APP_RI
(
   Record_Type               	char(2)              	NOT NULL,
   unique_system_identifier  	numeric(9,0)         	NOT NULL,
   ULS_File_Number         	char(14)             	NULL,
   EBF_Number               	varchar(30)          	NULL,
   Entity_Type			char(1)			NOT NULL,
   Year_Sequence_ID		smallint		NOT NULL,
   Gross_Revenues			money			NULL,
   Year_End_Date			char(10)		NULL,
   Average_Gross_Revenues		money			NULL,
   Asset_Disclosure		money			NULL,
   Statement_Type                  char(1)                 NULL,
   In_Existence                    char(1)                 NULL
)
GO

--Receive Zone
CREATE TABLE dbo.PUBACC_APP_RZ
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   antenna_action_performed  char(1)              NULL,
   location_number           int                  NULL,
   antenna_number            int                  NULL,
   receive_zone_number       int                  NULL,
   receive_zone              char(6)              NULL
)
GO

--SPECIAL CONDITION
CREATE TABLE dbo.PUBACC_APP_SC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)              NULL,
   ebf_number                varchar(30)           NULL, 
   callsign                  char(10)             NULL ,
   special_condition_type    char(1)              NULL,
   special_condition_code    int                  NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--SHIP EXEMPTION
CREATE TABLE dbo.PUBACC_APP_SE
(
   record_type              char(2)               NULL,
   unique_system_identifier numeric(9,0)          NULL,
   uls_file_number          char(14)              NULL,
   ebf_number               varchar(30)           NULL,
   call_sign                char(10)              NULL,
   ship_call_sign           char(10)              NULL,
   port_registry            varchar(35)           NULL,
   [owner]                    char(1)               NULL,
   operater                 char(1)               NULL,
   charter                  char(1)               NULL,
   agent                    char(1)               NULL,
   radiotelephone_exempt_req char(1)              NULL,
   gmdss_exemp_req          char(1)               NULL,
   radio_dir_exempt_req     char(1)               NULL,
   prev_exempt_file_number  varchar(10)           NULL,
   foreign_port             char(1)               NULL,
   vessel_size_exempt       char(1)               NULL,
   equipment_exempt          char(1)               NULL,
   ltd_routes_exempt        char(1)               NULL,
   cond_voyages_exempt      char(1)               NULL,
   other_exempt             char(1)               NULL,
   other_exempt_desc        varchar(50)           NULL,
   ship_type                char(1)               NULL,
   number_of_crew           int               NULL,
   number_passengers        int               NULL,
   number_others            int               NULL,
   count_vhf                int               NULL,
   count_vhf_dsc            char(1)               NULL,
   count_epirb              int               NULL,
   count_survival           int               NULL,
   count_earth_station      int               NULL,
   count_auto_alarm         int               NULL,
   count_single_side_band   int               NULL,
   single_side_band_type_mf char(1)               NULL,
   single_side_band_type_hf char(1)               NULL,
   single_side_band_type_dsc char(1)              NULL,
   count_of_navtex          int               NULL,
   count_of_9_ghz_radar     int               NULL,
   count_of_500_khz_distress int              NULL,
   count_of_reserve_power   int               NULL,
   count_of_other           int               NULL,
   description_of_other     varchar(50)           NULL
)
GO

--LICENSE FREE FORM SPECIAL CONDITION
CREATE TABLE dbo.PUBACC_APP_SF
(
   record_type               char(2)              NULL ,
   unique_system_identifier  numeric(9,0)         NULL ,
   uls_file_number           char(14)              NULL,
   ebf_number                varchar(30)           NULL, 
   callsign                  char(10)             NULL ,
   lic_freeform_cond_type    char(1)              NULL ,
   unique_lic_freeform_id    numeric(9,0)         NULL ,
   sequence_number           int              NULL ,
   lic_freeform_condition    varchar(255)         NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--MICROWAVE SEGMENTS
CREATE TABLE dbo.PUBACC_APP_SG
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   segment_action_performed  char(1)              NULL,
   path_number               int              NULL,
   transmit_location         int              NULL,
   transmit_antenna          int              NULL,
   receiver_location         int              NULL,
   receiver_antenna          int              NULL,
   segment_number            int              NULL,
   segment_length            numeric(12,6)        NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--SHIP
CREATE TABLE dbo.PUBACC_APP_SH
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   type_of_authorization     char(1)              NULL,
   count_in_fleet            int              NULL,
   general_class             char(3)              NULL,
   special_class             char(3)              NULL,
   ship_name                 varchar(35)          NULL,
   ship_number               char(12)             NULL,
   international_voyages     char(1)              NULL,
   foreign_communications    char(1)              NULL,
   radiotelegraph            char(1)              NULL,
   mmsi_request              char(1)              NULL,
   gross_tonnage             int              NULL,
   ship_length               int              NULL,
   working_freq_s1           char(3)              NULL,
   working_freq_s2           char(3)              NULL,
   self_id_number            char(5)              NULL,
   comsat_id_number          char(7)              NULL,
   station_number            numeric(9,0)         NULL,
   required_cat_a            char(1)              NULL,
   required_cat_b            char(1)              NULL,
   required_cat_c            char(1)              NULL,
   required_cat_d            char(1)              NULL,
   required_cat_e            char(1)              NULL
)
GO

--SIDS
CREATE TABLE dbo.PUBACC_APP_SI
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   [sid]                       char(4)              NULL,
   action_performed          char(1)              NULL
)
GO

--SHIP RESCUE
CREATE TABLE dbo.PUBACC_APP_SR
(
   record_type               char(2)             NULL,
   unique_system_identifier	numeric(9,0)	    NOT NULL,
   uls_file_number    	char(14)            NULL,
   ebf_number	        varchar(30)         NULL,
   call_sign	                char(10)            NULL,
   epirb_identification_code char(15)            NULL,  
   INMARSAT_A            	char(1)             NULL,   
   INMARSAT_B                char(1)             NULL,     
   INMARSAT_C                char(1)             NULL, 
   INMARSAT_M                char(1)             NULL,   
   INMARSAT_Mini             char(1)             NULL,    
   VHF                       char(1)             NULL,        
   MF                        char(1)             NULL,          
   HF                        char(1)             NULL,           
   DSC                       char(1)             NULL,        
   epirb_406_mhz             char(1)             NULL,    
   epirb_121_5_mhz           char(1)             NULL,  
   sart                      char(1)             NULL,           
   raft_count                numeric(6,0)        NULL,  
   lifeboat_count            numeric(6,0)        NULL,
   vessel_capacity           numeric(6,0)        NULL
)
GO

--SHIP VOYAGE
CREATE TABLE dbo.PUBACC_APP_SV
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   voyage_number             int              NULL,
   voyage_description        varchar(255)         NULL
)
GO

--TRANSFER/ASSIGN
CREATE TABLE dbo.PUBACC_APP_TA
(
   Record_Type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   pro_forma                 char(1)              NULL,
   full_assignment           char(1)              NULL,
   method_of_accomplishment  char(1)              NULL,
   method_other_description  varchar(30)          NULL,
   voluntary_involuntary     char(1)              NULL,
   assignor_certifier_first_name varchar(20)      NULL,
   assignor_certifier_mi     varchar(1)           NULL,
   assignor_certifier_last_name char(20)          NULL,
   assignor_certifier_suffix varchar(3)           NULL,
   assignor_certifier_title  varchar(40)          NULL,
   assignee_gross_rev_1      money                NULL,
   assignee_gross_rev_2      money                NULL,
   assignee_gross_rev_3      money                NULL,
   assignee_tot_assets       money                NULL,
   same_small_category       char(1)              NULL,
   applying_for_installments char(1)              NULL,
   notification_of_forebearance char(1)           NULL,
   wireless_need_approval    char(1)              NULL,
   non_wireless_need_approval char(1)             NULL,
   male_or_female            char(1)              NULL,
   african_american          char(1)              NULL,
   native_american           char(1)              NULL,
   native_pacific_islander   char(1)              NULL,
   asian                     char(1)              NULL,
   white                     char(1)              NULL,
   ethnicity                 char(1)              NULL,
   consent_date              char(10)             NULL,
   consummation_date         char(10)             NULL,
   consummation_deadline     char(10)             NULL,
   eligibility_category      varchar(30)          NULL,
   other_wireless_file_num   char(14)             NULL,
   occurred                  char(1)              NULL,
   involuntary_date          char(10)             NULL,
   forbearance_date          char(10)             NULL,
   full_partial_ind          char(1)              NULL,
   geo_overlap               char(1)              NULL,
   tenmhz_geo_overlap        char(1)              NULL,
   reduced_providers         char(1)              NULL,
   multichannel              char(1)              NULL,
   cable_tv                  char(1)              NULL,
   program_reqs              char(1)              NULL,
   ownership_required        char(1)              NULL,
   ownership_file_num        char(14)             NULL,
   other_wireless_app	char(1)              NULL,
   public_safety		char(1)              NULL,
   tl_short_term		char(1)              NULL,
   mw_link_ind		char(1)              NULL
)
GO

--TRIBAL LAND
CREATE TABLE dbo.PUBACC_APP_TL
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   market_code               char(6)              NULL,
   channel_block             char(4)              NULL,
   action_performed          char(1)              NULL,
   tribal_land_name          varchar(80)          NULL,
   tribal_certification      char(1)              NULL,
   tribal_land_type          varchar(10)          NULL,
   square_kilometers         numeric(8,0)         NULL
)
GO

--CELLULAR UNSERVED AREA
CREATE TABLE dbo.PUBACC_APP_UA
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   action_performed          char(1)              NULL,
   cellular_phase            int              NULL,
   market_code               char(6)              NULL,
   submarket_code            int              NULL,
   channel_block             char(4)              NULL
)
GO

--Vanity Call Sign
CREATE TABLE dbo.PUBACC_APP_VC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   request_sequence          int              NULL,
   callsign_requested        char(10)             NULL
)
GO

--Lease Classification
CREATE TABLE dbo.PUBACC_APP_LC
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign			char(10)             NULL,		
   a_ls_class_code		char(2)              NULL,		
   a_ls_allocation_type	char(1)              NULL, 
   a_ls_term			char(1)              NULL
)
GO

--Lease Dates
CREATE TABLE dbo.PUBACC_APP_LD
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   lease_id			char(10)             NULL,		
   issue_date                char(10)	     NULL,
   expired_date              char(10)             NULL, 
   cancellation_date         char(10)             NULL,
   lease_never_comm_ind      char(1)              NULL
)
GO

--Lease Link
CREATE TABLE dbo.PUBACC_APP_LL
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign			char(10)             NULL,		
   lease_id			char(10)             NULL,      
   unique_system_identifier_2   numeric(9,0)         NULL     /*(the licensee) */
)
GO

--Leased Location
CREATE TABLE dbo.PUBACC_APP_L3
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL,  
   location_action_performed char(1)              NULL,
   location_type_code        char(1)              NULL,
   location_class_code       char(1)              NULL,
   location_number           int              NULL,
   site_status               char(1)              NULL,
   corresponding_fixed_location int           NULL,
   location_address          varchar(80)          NULL,
   location_city             char(20)             NULL,
   location_county           varchar(60)          NULL,
   location_state            char(2)              NULL,
   radius_of_operation       numeric(5,1)         NULL,
   area_of_operation_code    char(1)              NULL,
   clearance_indicator       char(1)              NULL,
   ground_elevation          numeric(7,1)         NULL,
   lat_degrees               int              NULL,
   lat_minutes               int              NULL,
   lat_seconds               numeric(3,1)         NULL,
   lat_direction             char(1)              NULL,
   long_degrees              int              NULL,
   long_minutes              int              NULL,
   long_seconds              numeric(3,1)         NULL,
   long_direction            char(1)              NULL,
   max_lat_degrees           int              NULL,
   max_lat_minutes           int              NULL,
   max_lat_seconds           numeric(3,1)         NULL,
   max_lat_direction         char(1)              NULL,
   max_long_degrees          int              NULL,
   max_long_minutes          int              NULL,
   max_long_seconds          numeric(3,1)         NULL,
   max_long_direction        char(1)              NULL,
   nepa                      char(1)              NULL,
   quiet_zone_notification_date char(10)          NULL,
   tower_registration_number char(10)             NULL,
   height_of_support_structure numeric(7,1)       NULL,
   overall_height_of_structure numeric(7,1)       NULL,
   structure_type            char(6)              NULL,
   airport_id                char(4)              NULL,
   location_name             char(20)             NULL,
   units_hand_held           int              NULL,
   units_mobile              int              NULL,
   units_temp_fixed          int              NULL,
   units_aircraft            int              NULL,
   units_itinerant           int              NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--Additional Leased Location
CREATE TABLE dbo.PUBACC_APP_L4
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   location_action_performed	char(1)              NULL,
   location_number           int              NULL,
   registration_required	char(1)              NULL,
   protection_date		char(10)             NULL,
   link_reg_num              varchar(30)          NULL,
   link_reg_action_performed char(1)              NULL,
   mexico_clearance_indicator char(1)	     NULL,
   quiet_zone_consent        char(1)	             NULL,	
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--Leased Location Area of Operation
CREATE TABLE dbo.PUBACC_APP_O2
(
   record_type               char(2)              NOT NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   location_number           int              NULL,
   area_text_sequence_num    int              NULL,
   area_of_operation         varchar(255)         NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--Leased Location Canned Special Conditions
CREATE TABLE dbo.PUBACC_APP_L5
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   call_sign                 char(10)             NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   location_number           int              NULL,
   special_condition_type    char(1)              NULL,
   special_condition_code    int              NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--Lease Location Free-Form Special Conditions
CREATE TABLE dbo.PUBACC_APP_L6
(
   record_type               char(2)              NULL ,
   unique_system_identifier  numeric(9,0)         NULL ,
   callsign                  char(10)             NULL ,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   location_number           int              NULL ,
   loc_freeform_cond_type    char(1)              NULL ,
   unique_loc_freeform_id    numeric(9,0)         NULL ,
   sequence_number           int              NULL ,
   loc_freeform_condition    varchar(255)         NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--Leased Antenna
CREATE TABLE dbo.PUBACC_APP_A3
(
   record_type              	 char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                	char(10)             NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   antenna_action_performed  char(1)              NULL,
   antenna_number            int              NULL,
   location_number          	int              NULL,
   receive_zone_code         char(6)              NULL,
   antenna_type_code         char(1)              NULL,
   height_to_tip            	numeric(5,1)         NULL,
   height_to_center_raat     numeric(5,1)         NULL,
   antenna_make              varchar(25)          NULL,
   antenna_model             varchar(25)          NULL,
   tilt                      numeric(3,1)         NULL,
   polarization_code         char(5)              NULL,
   beamwidth                 numeric(4,1)         NULL,
   gain                      numeric(4,1)         NULL,
   azimuth                   numeric(4,1)         NULL,
   height_above_avg_terrain  numeric(5,1)         NULL,
   diversity_height          numeric(5,1)         NULL,
   diversity_gain            numeric(4,1)         NULL,
   diversity_beam            numeric(4,1)         NULL,
   reflector_height          numeric(5,1)         NULL,
   reflector_width           numeric(4,1)         NULL,
   reflector_separation      numeric(5,1)         NULL,
   repeater_seq_num          int              NULL,
   back_to_back_tx_dish_gain numeric(4,1)         NULL,
   back_to_back_rx_dish_gain numeric(4,1)         NULL,
   location_name             varchar(20)          NULL,
   passive_repeater_id       int              NULL,
   alternative_cgsa_method   char(1)              NULL,
   path_number               int              NULL,
   line_loss                 numeric(3,1)         NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL      
)
GO

--Leased Frequency
CREATE TABLE dbo.PUBACC_APP_F3
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   frequency_action_performed char(1)             NULL,
   location_number           int              NULL,
   antenna_number            int              NULL,
   class_station_code        char(4)              NULL,
   op_altitude_code          char(2)              NULL,
   frequency_assigned        numeric(16,8)        NULL,
   frequency_upper_band      numeric(16,8)        NULL,
   frequency_carrier         numeric(16,8)        NULL,
   time_begin_operations     int              NULL,
   time_end_operations       int              NULL,
   power_output              numeric(15,3)        NULL,
   power_erp                 numeric(15,3)        NULL,
   tolerance                 numeric(6,5)         NULL,
   frequency_ind             char(1)              NULL,
   [status]                    char(1)              NULL,
   eirp                      numeric(7,1)         NULL,
   transmitter_make          varchar(25)          NULL,
   transmitter_model         varchar(25)          NULL,
   auto_transmitter_power_control char(1)         NULL,
   cnt_mobile_units          int              NULL,
   cnt_mob_pagers            int              NULL,
   freq_seq_id               int              NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL      
)
GO

--Additional Leased Frequency
CREATE TABLE dbo.PUBACC_APP_F4
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   lease_id                 char(10)              NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   action_performed          char(1)              NULL, 
   location_number           int                  NULL,
   antenna_number            int		     NULL,
   frequency_number          int                  NULL,
   frequency_assigned        numeric(16,8)        NULL,
   frequency_upper_band      numeric(16,8)        NULL,
   frequency_offset          char(3)              NULL,
   frequency_channel_block   char(4)              NULL,
   equipment_class	        char(2)              NULL, 
   minimum_power_output	numeric(15,3)        NULL,
   date_first_use            char(10)             NULL,
   status_code		char(1)		     NULL,
   status_date		char(10)	     NULL
)
GO

--Leased Frequency Canned Special Conditions
CREATE TABLE dbo.PUBACC_APP_F5
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   call_sign                 char(10)             NULL,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   location_number           int              NULL,
   antenna_number            int              NULL,
   frequency                 numeric(16,8)        NULL,
   frequency_number          int              NULL,
   special_condition_type    char(1)              NULL,
   special_condition_code    int              NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--Leased Frequency Free-Form Special Conditions
CREATE TABLE dbo.PUBACC_APP_F6
(
   record_type               char(2)              NULL ,
   unique_system_identifier  numeric(9,0)         NULL ,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL ,
   lease_id                 char(10)             NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   location_number           int              NULL ,
   antenna_number            int              NULL ,
   frequency_number          int              NULL ,
   frequency                 numeric(16,8)        NULL ,
   freq_freeform_cond_type   char(1)              NULL ,
   unique_freq_freeform_id   numeric(9,0)         NULL ,
   sequence_number           int              NULL ,
   freq_freeform_condition   varchar(255)         NULL,
   status_code		char(1)			NULL,
   status_date		char(30)		NULL
) 
GO

--Leased Microwave Path
CREATE TABLE dbo.PUBACC_APP_P2
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   callsign                  char(10)             NULL,
   lease_id                 char(10)              NULL, 
   ls_site_link_id           numeric(9,0)         NULL, 
   path_action_performed     char(1)              NULL,
   path_number               int                  NULL,
   transmit_location_number  int                  NULL,
   transmit_antenna_number   int                  NULL,
   receiver_location_number  int                  NULL,
   receiver_antenna_number   int                  NULL,
   mas_dems_subtype          char(2)              NULL,
   path_type_desc            char(20)             NULL,
   passive_receiver_indicator char(1)             NULL,
   country_code              char(3)              NULL,
   interference_to_gso       char(1)              NULL,
   receiver_callsign         varchar(10)          NULL,
   angular_sep		numeric(3,2)         NULL,
   cert_no_alternative	char(1)		     NULL,
   cert_no_interference	char(1)  	     NULL,
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

--Transmission Method or Protocol
CREATE TABLE dbo.PUBACC_APP_TP
(
   record_type               char(2)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   uls_file_number           char(14)             NULL,
   ebf_number                varchar(30)          NULL,
   call_sign                 char(10)             NULL,
   location_number           integer              NULL,
   antenna_number            integer              NULL,
   frequency_number          integer              NULL,
   freq_proto_seq_id         integer              NULL,
   freq_proto_code_desc	      varchar(40)	     NOT NULL,
   a_freq_proto_other        varchar(255)         NULL,
   action_performed          char(1)              NULL, 
   status_code		char(1)			NULL,
   status_date		char(10)		NULL
)
GO

-- Antenna registration

CREATE TABLE dbo.TOWER_PUBACC_APP_AT
(
	record_type               char(2)              NULL,
	content_indicator         char(3)              NULL,
	file_number               char(8)              NULL,
	registration_number       char(7)              NULL,
	unique_system_identifier  numeric(9,0)         NOT NULL,
	attachment_code           char(1)              NULL,
	[description]               varchar(60)          NULL,
	[date]                      char(10)             NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_CO
(
	record_type               char(2)              NULL,
	content_indicator         char(3)              NULL,
	file_number               char(8)              NULL,
	registration_number       char(7)              NULL,
	unique_system_identifier  numeric(9,0)         NOT NULL,
	coordinate_type           char(1)              NOT NULL,
	latitude_degrees          int                  NULL,
	latitude_minutes          int                  NULL,
	latitude_seconds          numeric(4,1)         NULL,
	latitude_direction        char(1)              NULL,
	latitude_total_seconds    numeric(8,1)         NULL,
	longitude_degrees         int                  NULL,
	longitude_minutes         int                  NULL,
	longitude_seconds         numeric(4,1)         NULL,
	longitude_direction       char(1)              NULL,
	longitude_total_seconds   numeric(8,1)         NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_DE
(
	record_type               char(2)              NULL,
	faa_study_number          varchar(20)          NOT NULL,
	circular_number           varchar(10)          NULL,
	latitude_degrees          int                  NULL,
	latitude_minutes          int                  NULL,
	latitude_seconds          numeric(4,2)         NULL,
	latitude_direction        char(1)              NULL,
	latitude_total_seconds    numeric(8,2)         NULL,
	longitude_degrees         int                  NULL,
	longitude_minutes         int                  NULL,
	longitude_seconds         numeric(4,2)         NULL,
	longitude_direction       char(1)              NULL,
	longitude_total_seconds   numeric(8,2)         NULL,
	height_ground_elevation   numeric(5,1)         NULL,
	height_overall_structure  numeric(6,1)         NULL,
	height_overall_amsl       numeric(6,1)         NULL,
	faa_date_issued           char(10)             NULL,
	faa_date_keyed            char(10)             NULL,
	faa_date_expiration       char(10)             NULL,
	date_action               char(10)             NULL,
	date_faa_final            char(10)             NULL,
	city                      varchar(20)          NULL,
	state_code                char(2)              NULL,
	business_name             varchar(200)         NULL,
	first_name                varchar(20)          NULL,
	middle_initial            char(1)              NULL,
	last_name                 varchar(20)          NULL,
	suffix                    char(3)              NULL,
	faa_emi_flag              char(1)              NULL,
	[version]                   int                  NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_DP
(
	record_type               char(2)              NULL,
	faa_study_number          varchar(20)          NOT NULL,
	faa_chapter_code          varchar(14)          NULL,
	specification_option      int                  NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_DR
(
	record_type               char(2)              NULL,
	faa_study_number          varchar(20)          NOT NULL,
	date_keyed                char(10)             NULL,
	sequence_number           int                  NULL,
	remark_text               varchar(255)         NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_EN
(
   record_type               char(2)              NULL,
   content_indicator         char(3)              NULL,
   file_number               char(8)              NULL,
   registration_number       char(7)              NULL,
   unique_system_identifier  numeric(9,0)         NOT NULL,
   entity_type               char(1)              NOT NULL,
   licensee_id               char(9)              NULL,
   entity_name               varchar(200)         NULL,
   first_name                varchar(20)          NULL,
   mi                        char(1)              NULL,
   last_name                 varchar(20)          NULL,
   suffix                    char(3)              NULL,
   phone                     varchar(10)          NULL,
   internet_address          varchar(50)          NULL,
   street_address            varchar(35)          NULL,
   po_box                    varchar(20)          NULL,
   city                      varchar(20)          NULL,
   [state]                     char(2)              NULL,
   zip_code                  char(9)              NULL,
   attention                 varchar(35)          NULL,
   frn                       char(10)             NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_HS
(
	record_type               char(2)              NULL,
	content_indicator         char(3)              NULL,
	file_number               char(8)              NULL,
	registration_number       char(7)              NULL,
	unique_system_identifier  numeric(9,0)         NOT NULL,
	[date]                      char(10)             NULL,
	[description]               varchar(50)          NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_RA
(
	RECORD_TYPE               char(2)              NULL,
	CONTENT_INDICATOR         char(3)              NULL,
	FILE_NUMBER               char(8)              NULL,
	REGISTRATION_NUMBER       char(7)              NULL,
	UNIQUE_SYSTEM_IDENTIFIER  numeric(9,0)         NOT NULL,
	APPLICATION_PURPOSE       char(2)              NULL,
	PREVIOUS_PURPOSE          char(2)              NULL,
	INPUT_SOURCE_CODE         char(1)              NULL,
	STATUS_CODE               char(1)              NULL,
	DATE_ENTERED              char(10)             NULL,
	DATE_RECEIVED             char(10)             NULL,
	DATE_ISSUED               char(10)             NULL,
	DATE_CONSTRUCTED          char(10)             NULL,
	DATE_DISMANTLED           char(10)             NULL,
	DATE_ACTION               char(10)             NULL,
	ARCHIVE_FLAG_CODE         char(1)              NULL,
	[VERSION]                   int                  NULL,
	SIGNATURE_FIRST_NAME      varchar(20)          NULL,
	SIGNATURE_MIDDLE_INITIAL  char(1)              NULL,
	SIGNATURE_LAST_NAME       varchar(20)          NULL,
	SIGNATURE_SUFFIX          varchar(3)           NULL,
	SIGNATURE_TITLE           varchar(40)          NULL,
	INVALID_SIGNATURE         char(1)              NULL,
	STRUCTURE_STREET_ADDRESS  varchar(80)          NULL,
	STRUCTURE_CITY            varchar(20)          NULL,
	STRUCTURE_STATE_CODE      char(2)              NULL,
	HEIGHT_OF_STRUCTURE       numeric(5,1)         NULL,
	GROUND_ELEVATION          numeric(6,1)         NULL,
	OVERALL_HEIGHT_ABOVE_GROUND numeric(6,1)       NULL,
	OVERALL_HEIGHT_AMSL       numeric(6,1)         NULL,
	STRUCTURE_TYPE            char(6)              NULL,
	DATE_FAA_DETERMINATION_ISSUED char(10)         NULL,
	FAA_STUDY_NUMBER          varchar(20)          NULL,
	FAA_CIRCULAR_NUMBER       varchar(10)          NULL,
	SPECIFICATION_OPTION      int                  NULL,
	PAINTING_AND_LIGHTING     varchar(100)         NULL,
	FAA_EMI_FLAG              char(1)              NULL,
	NEPA_FLAG                 char(1)              NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_RE
(
	record_type               char(2)              NULL,
	content_indicator         char(3)              NULL,
	file_number               char(8)              NULL,
	registration_number       char(7)              NULL,
	unique_system_identifier  numeric(9,0)         NOT NULL,
	remark_type               char(3)              NOT NULL,
	date_keyed                char(10)             NULL,
	sequence_number           int                  NULL,
	remark_text               varchar(255)         NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_RS
(
	record_type               char(2)              NULL,
	content_indicator         char(3)              NULL,
	file_number               char(8)              NULL,
	registration_number       char(7)              NULL,
	unique_system_identifier  numeric(9,0)         NOT NULL,
	reason_type               char(1)              NULL,
	reason_description        varchar(50)          NULL,
	reason_comment            varchar(255)         NULL,
	reason_date               char(10)             NULL
)
GO

CREATE TABLE dbo.TOWER_PUBACC_APP_SC
(
	record_type               char(2)              NULL,
	content_indicator         char(3)              NULL,
	file_number               char(8)              NULL,
	registration_number       char(7)              NULL,
	unique_system_identifier  numeric(9,0)         NOT NULL,
	date_keyed                char(10)             NULL,
	sequence_number           int                  NULL,
	remark_text               varchar(255)         NULL
)
GO

use tempdb
GO

