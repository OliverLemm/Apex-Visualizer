prompt --application/shared_components/user_interface/lovs/pages
begin
--   Manifest
--     PAGES
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>125633378786110814
,p_default_application_id=>347
,p_default_id_offset=>125634094441118325
,p_default_owner=>'APEX_VISUALIZER'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(449550200431517744)
,p_lov_name=>'PAGES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  page_name || '' ('' || page_id || '')'' page,',
'       page_id ',
'  from apex_application_pages',
'where application_id = :P0_APP_ID',
' order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
wwv_flow_api.component_end;
end;
/
