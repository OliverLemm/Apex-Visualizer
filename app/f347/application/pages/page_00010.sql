prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>125633378786110814
,p_default_application_id=>347
,p_default_id_offset=>125634094441118325
,p_default_owner=>'APEX_VISUALIZER'
);
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(452492531566466351)
,p_name=>'Applications'
,p_step_title=>'Applications'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'OLEMM'
,p_last_upd_yyyymmddhh24miss=>'20170709234241'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(293283138176929182)
,p_plug_name=>'Page Functions'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(452458863643466246)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select application_name app',
'      ,page_function',
'      ,count(page_id) amount',
'from av_applications_v',
'where application_id = :P0_APP_ID or :P0_APP_ID is null',
'group by application_name , page_function',
'order by count(page_id) desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(293283206865929183)
,p_region_id=>wwv_flow_api.id(293283138176929182)
,p_chart_type=>'pie'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(293283368127929184)
,p_chart_id=>wwv_flow_api.id(293283206865929183)
,p_seq=>10
,p_name=>'Applications'
,p_location=>'REGION_SOURCE'
,p_series_name_column_name=>'APP'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PAGE_FUNCTION'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(294199481042781289)
,p_plug_name=>'Complexity'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(452458863643466246)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'    select aa.application_name, aa.application_id, ''Pages'' series_name ,aa.pages series_value from apex_applications aa',
'    union',
'    select j.application_name, j.application_id, ''JavaScript'', sum(j.js_code_length) series_value ',
'    from av_javascript_v j group by application_id,application_name',
'    union',
'    select c.application_name, c.application_id, ''CSS'', sum(c.css_code_length) series_value ',
'    from av_css_v c group by application_id,application_name',
'    union',
'    select p.application_name, p.application_id, ''PL/SQL'', sum(p.code_length) series_value ',
'    from av_plsql_v p group by application_id,application_name',
')',
'where (application_id = :P0_APP_ID or :P0_APP_ID is null)',
'and (lower(series_name) = lower(:P10_COMPLEXITY_CATEGORY) or :P10_COMPLEXITY_CATEGORY is null)',
'order by series_value desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P0_APP_ID,P10_COMPLEXITY_CATEGORY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(294199527605781290)
,p_region_id=>wwv_flow_api.id(294199481042781289)
,p_chart_type=>'bar'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(294199615339781291)
,p_chart_id=>wwv_flow_api.id(294199527605781290)
,p_seq=>10
,p_name=>'Applications'
,p_location=>'REGION_SOURCE'
,p_series_name_column_name=>'APPLICATION_NAME'
,p_items_value_column_name=>'SERIES_VALUE'
,p_items_label_column_name=>'SERIES_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(294199791543781292)
,p_chart_id=>wwv_flow_api.id(294199527605781290)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(294199864183781293)
,p_chart_id=>wwv_flow_api.id(294199527605781290)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(449464884507677315)
,p_plug_name=>'App Attributes <deactivated>'
,p_region_name=>'chart_app_attributes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(452458863643466246)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(291318289212148547)
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(449464968353677316)
,p_region_id=>wwv_flow_api.id(449464884507677315)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449465103767677317)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>10
,p_name=>'Pages'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.pages',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'PAGES'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP::'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449465505690677321)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>20
,p_name=>'Tabs'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.tabs + parent_tabs tabs',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'TABS'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449465626194677322)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>30
,p_name=>'Application Items'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.application_items',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'APPLICATION_ITEMS'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449465667986677323)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>40
,p_name=>'Application Processes'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.application_processes',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'APPLICATION_PROCESSES'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466260053677329)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>50
,p_name=>'Application Computations'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.application_computations',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'APPLICATION_COMPUTATIONS'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466424333677330)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>60
,p_name=>'Shortcuts'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.shortcuts',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'SHORTCUTS'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466534860677331)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>70
,p_name=>'Web Services'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.web_services',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'WEB_SERVICES'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466616839677332)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>80
,p_name=>'Trees'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.trees',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'TREES'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466702359677333)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>90
,p_name=>'Build Options'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.build_options',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'BUILD_OPTIONS'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466830381677334)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>100
,p_name=>'Breadcrumbs'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.breadcrumbs',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'BREADCRUMBS'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466930713677335)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>110
,p_name=>'Navbar Entries'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.nav_bar_entries',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'NAV_BAR_ENTRIES'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449466991764677336)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>120
,p_name=>'Lists'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.lists',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'LISTS'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449467251204677338)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_seq=>130
,p_name=>'Lists of Values'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_name',
'      ,aa.lists_of_values',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null',
''))
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_items_value_column_name=>'LISTS_OF_VALUES'
,p_items_label_column_name=>'APPLICATION_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(449465223418677318)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(449465298832677319)
,p_chart_id=>wwv_flow_api.id(449464968353677316)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(449531401127422725)
,p_plug_name=>'Shared Components'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(452454481275466240)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'    select aa.application_name, aa.application_id, ''Tabs'' series_name ,aa.tabs series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Application Items'' series_name ,aa.application_items series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Application Processes'' series_name ,aa.application_processes series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Application Computations'' series_name ,aa.application_computations series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Shortcuts'' series_name ,aa.shortcuts series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Web Services'' series_name ,aa.web_services series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Trees'' series_name ,aa.trees series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Build Options'' series_name ,aa.build_options series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Breadcrumbs'' series_name ,aa.Breadcrumbs series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Navbar Entries'' series_name ,aa.nav_bar_entries series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''Lists'' series_name ,aa.lists series_value from apex_applications aa',
'    union',
'    select aa.application_name, aa.application_id, ''List of Values'' series_name ,aa.lists_of_values series_value from apex_applications aa)',
'where (application_id = :P0_APP_ID or :P0_APP_ID is null)',
'and (lower(series_name) = :P0_COMPONENT or :P0_COMPONENT is null)'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P0_APP_ID,P0_COMPONENT'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(449531518790422726)
,p_region_id=>wwv_flow_api.id(449531401127422725)
,p_chart_type=>'bar'
,p_height=>'600'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(449531604590422727)
,p_chart_id=>wwv_flow_api.id(449531518790422726)
,p_seq=>10
,p_name=>'Applications'
,p_location=>'REGION_SOURCE'
,p_series_name_column_name=>'APPLICATION_NAME'
,p_items_value_column_name=>'SERIES_VALUE'
,p_items_label_column_name=>'SERIES_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(449531676107422728)
,p_chart_id=>wwv_flow_api.id(449531518790422726)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'log'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(449531787774422729)
,p_chart_id=>wwv_flow_api.id(449531518790422726)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455561419078523493)
,p_plug_name=>'Details'
,p_region_name=>'details'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(452454481275466240)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_id app_id',
'      ,aa.application_name app_name',
'      ,aa.alias',
'      ,aa.owner',
'      ,aa.version',
'      ,aa.availability_status availability',
'      ,aa.build_status',
'      ,aa.last_updated_by',
'      ,aa.last_updated_on',
'      ,aa.compatibility_mode',
'      ,aa.page_template',
'from apex_applications aa',
'where aa.application_id = :P0_APP_ID',
'or :P0_APP_ID is null'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P0_APP_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(293283805228929189)
,p_name=>'APP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APP_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'App id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(293283927222929190)
,p_name=>'APP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APP_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'App name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(293284029483929191)
,p_name=>'AVAILABILITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AVAILABILITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Availability'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414315753475562250)
,p_name=>'ALIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Alias'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414315932370562251)
,p_name=>'OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414316001397562252)
,p_name=>'VERSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VERSION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Version'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414316423432562256)
,p_name=>'BUILD_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUILD_STATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Build status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414316525640562257)
,p_name=>'LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Last updated by'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414316588179562258)
,p_name=>'LAST_UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_ON'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Last updated on'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>125633378786110814
,p_default_application_id=>347
,p_default_id_offset=>125634094441118325
,p_default_owner=>'APEX_VISUALIZER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414316718241562259)
,p_name=>'COMPATIBILITY_MODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPATIBILITY_MODE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Compatibility mode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(414316846415562260)
,p_name=>'PAGE_TEMPLATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_TEMPLATE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Page template'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(414315427523562246)
,p_internal_uid=>123753374311241036
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(449471134182698294)
,p_interactive_grid_id=>wwv_flow_api.id(414315427523562246)
,p_static_id=>'1256353'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(449471236424698295)
,p_report_id=>wwv_flow_api.id(449471134182698294)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(293394802712713918)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(293283805228929189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(293395282458713922)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(293283927222929190)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(293395802307713924)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(293284029483929191)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449473173892698312)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(414315753475562250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449473735520698313)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(414315932370562251)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449474183446698315)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(414316001397562252)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449476216332698323)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(414316423432562256)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449476662535698324)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(414316525640562257)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449477217127698326)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(414316588179562258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449477661811698328)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(414316718241562259)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(449478215940698331)
,p_view_id=>wwv_flow_api.id(449471236424698295)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(414316846415562260)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(449467287482677339)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(449464884507677315)
,p_button_name=>'Stack'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(452481721190466298)
,p_button_image_alt=>'Stack'
,p_button_position=>'TOP'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(449467583147677342)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(449464884507677315)
,p_button_name=>'Unstack'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(452481721190466298)
,p_button_image_alt=>'Unstack'
,p_button_position=>'TOP'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(294269251624521547)
,p_name=>'P10_COMPLEXITY_CATEGORY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(452496424516540365)
,p_prompt=>'Complexity category'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:CSS;CSS,JavaScript;JavaScript,Pages;Pages,PL/SQL;PL/SQL'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'all'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(452481165926466293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(449465803018677324)
,p_name=>'change P0_APP_ID - refresh charts'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_APP_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(294195118376781246)
,p_event_id=>wwv_flow_api.id(449465803018677324)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(449531401127422725)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(294269154307521546)
,p_event_id=>wwv_flow_api.id(449465803018677324)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(294199481042781289)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(294476643654578347)
,p_event_id=>wwv_flow_api.id(449465803018677324)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(293283138176929182)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(449467390098677340)
,p_name=>'stack'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(449467287482677339)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(449467491823677341)
,p_event_id=>wwv_flow_api.id(449467390098677340)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#chart_app_attributes_jet").ojChart({stack: ''on''});'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(449467744660677343)
,p_name=>'unstack'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(449467583147677342)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(449467799476677344)
,p_event_id=>wwv_flow_api.id(449467744660677343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#chart_app_attributes_jet").ojChart({stack: ''off''});'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(293284377367929194)
,p_name=>'change P0_COMPONENT - refresh shared chart'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_COMPONENT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(293284433520929195)
,p_event_id=>wwv_flow_api.id(293284377367929194)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(449531401127422725)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(294269372701521548)
,p_name=>'change P10_COMPLEXITY_CATEGORY'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_COMPLEXITY_CATEGORY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(294269478248521549)
,p_event_id=>wwv_flow_api.id(294269372701521548)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(294199481042781289)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(294476816186578349)
,p_name=>'hide component'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(294476954847578350)
,p_event_id=>wwv_flow_api.id(294476816186578349)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P0_COMPONENT'
,p_attribute_01=>'N'
);
wwv_flow_api.component_end;
end;
/
