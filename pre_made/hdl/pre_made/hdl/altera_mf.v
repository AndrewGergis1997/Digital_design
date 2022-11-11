// Mentor edits to file from Quartus 7.0 bld33 eda/synthesis/altera_mf.v: 3/6/2007
//   1. Add in 'alt_*' interfaces from eda/sim_lib/altera_primtives.v (same as existing altera_mf.v)
//   2. Add in extra cells found in old rtlc altera_mf.v but not in Quartus installation  
//   3. Removed following cells as they exist in technology library also
//       lcell, dffe, carry_sum, soft, cascade, latch, TRI    
// Compatible with Quartusv10.1, Synced on 5/1/2011
`begin_keywords "1364-2001"
module parallel_add (
    data,
    clock,
    aclr,
    clken,
    result) /* synthesis syn_black_box=1 */;
    
    parameter width = 4;        // Required
    parameter size = 2;         // Required
    parameter widthr = 4;       // Required
    parameter shift = 0;
    parameter msw_subtract = "NO";  // or "YES"
    parameter representation = "UNSIGNED";
    parameter pipeline = 0;
    parameter result_alignment = "LSB"; // or "MSB"
    parameter lpm_type = "parallel_add";

    input [width*size-1:0] data;  // Required port
    input clock;                // Required port
    input aclr;                 // Default = 0
    input clken;                // Default = 1

    output [widthr-1:0] result;  //Required port


endmodule  // end of PARALLEL_ADD

//////////////////////////////////////////////////////////////////////////
// alt2gxb parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module alt2gxb(
	aeq_fromgxb,
	aeq_togxb,
	cal_blk_calibrationstatus,
	cal_blk_clk,
	cal_blk_powerdown,
	coreclkout,
	debug_rx_phase_comp_fifo_error,
	debug_tx_phase_comp_fifo_error,
	fixedclk,
	gxb_enable,
	gxb_powerdown,
	pipe8b10binvpolarity,
	pipedatavalid,
	pipeelecidle,
	pipephydonestatus,
	pipestatus,
	pll_inclk,
	pll_inclk_alt,
	pll_inclk_rx_cruclk,
	pll_locked,
	pll_locked_alt,
	powerdn,
	reconfig_clk,
	reconfig_fromgxb,
	reconfig_fromgxb_oe,
	reconfig_togxb,
	rx_a1a2size,
	rx_a1a2sizeout,
	rx_a1detect,
	rx_a2detect,
	rx_analogreset,
	rx_bistdone,
	rx_bisterr,
	rx_bitslip,
	rx_byteorderalignstatus,
	rx_channelaligned,
	rx_clkout,
	rx_coreclk,
	rx_cruclk,
	rx_cruclk_alt,
	rx_ctrldetect,
	rx_datain,
	rx_dataout,
	rx_dataoutfull,
	rx_digitalreset,
	rx_disperr,
	rx_enabyteord,
	rx_enapatternalign,
	rx_errdetect,
	rx_freqlocked,
	rx_invpolarity,
	rx_k1detect,
	rx_k2detect,
	rx_locktodata,
	rx_locktorefclk,
	rx_patterndetect,
	rx_phfifooverflow,
	rx_phfifordenable,
	rx_phfiforeset,
	rx_phfifounderflow,
	rx_phfifowrdisable,
	rx_pll_locked,
	rx_powerdown,
	rx_recovclkout,
	rx_revbitorderwa,
	rx_revbyteorderwa,
	rx_rlv,
	rx_rmfifoalmostempty,
	rx_rmfifoalmostfull,
	rx_rmfifodatadeleted,
	rx_rmfifodatainserted,
	rx_rmfifoempty,
	rx_rmfifofull,
	rx_rmfifordena,
	rx_rmfiforeset,
	rx_rmfifowrena,
	rx_runningdisp,
	rx_seriallpbken,
	rx_signaldetect,
	rx_syncstatus,
	tx_clkout,
	tx_coreclk,
	tx_ctrlenable,
	tx_datain,
	tx_datainfull,
	tx_dataout,
	tx_detectrxloop,
	tx_digitalreset,
	tx_dispval,
	tx_forcedisp,
	tx_forcedispcompliance,
	tx_forceelecidle,
	tx_invpolarity,
	tx_phfifooverflow,
	tx_phfiforeset,
	tx_phfifounderflow,
	tx_revparallellpbken) /* synthesis syn_black_box=1 */;

	parameter	cmu_clk_div_inclk_sel = "auto";
	parameter	cmu_clk_div_use_coreclk_out_post_divider = "false";
	parameter	cmu_offset_all_errors_align = "false";
	parameter	cmu_pll_inclk_log_index = 0;
	parameter	cmu_pll_inclock_period = 5000;
	parameter	cmu_pll_log_index = 0;
	parameter	cmu_pll_loop_filter_resistor_control = 0;
	parameter	cmu_pll_pfd_clk_select = "auto";
	parameter	cmu_pll_reconfig_inclk_log_index = 0;
	parameter	cmu_pll_reconfig_inclock_period = 5000;
	parameter	cmu_pll_reconfig_log_index = 0;
	parameter	cmu_pll_reconfig_loop_filter_resistor_control = 0;
	parameter	cmu_refclk_divider_enable = "auto";
	parameter	number_of_channels = 1;
	parameter	digitalreset_port_width = number_of_channels;
	parameter	en_local_clk_div_ctrl = "false";
	parameter	enable_fast_recovery_pci_mode = "false";
	parameter	enable_pll_cascade = "false";
	parameter	enable_pll_inclk0_divider = "false";
	parameter	enable_pll_inclk1_divider = "false";
	parameter	enable_pll_inclk2_divider = "false";
	parameter	enable_pll_inclk3_divider = "false";
	parameter	enable_pll_inclk4_divider = "false";
	parameter	enable_pll_inclk5_divider = "false";
	parameter	enable_pll_inclk6_divider = "false";
	parameter	enable_pll_inclk_alt_drive_rx_cru = "false";
	parameter	enable_pll_inclk_drive_rx_cru = "false";
	parameter	enable_reconfig_pll_cascade = "false";
	parameter	enable_reconfig_pll_inclk_drive_rx = "true";
	parameter	enforce_reconfig_refclk_divider = "auto";
	parameter	enforce_refclk_divider = "auto";
	parameter	equalizer_ctrl_a_setting = 7;
	parameter	equalizer_ctrl_b_setting = 7;
	parameter	equalizer_ctrl_c_setting = 7;
	parameter	equalizer_ctrl_d_setting = 7;
	parameter	equalizer_ctrl_v_setting = 7;
	parameter	equalizer_dcgain_setting = 0;
	parameter	gen_reconfig_pll = "false";
	parameter	intended_device_family = "stratixiigx";
	parameter	loopback_mode = "none";
	parameter	lpm_hint = "UNUSED";
	parameter	lpm_type = "alt2gxb";
	parameter	operation_mode = "duplex";
	parameter	pll_inclk0_inclock_period = 5000;
	parameter	pll_inclk1_inclock_period = 5000;
	parameter	pll_inclk2_inclock_period = 5000;
	parameter	pll_inclk3_inclock_period = 5000;
	parameter	pll_inclk4_inclock_period = 5000;
	parameter	pll_inclk5_inclock_period = 5000;
	parameter	pll_inclk6_inclock_period = 5000;
	parameter	pll_legal_multiplier_list = "disable_4_5_mult_in_6g";
	parameter	preemphasis_ctrl_1stposttap_setting = 0;
	parameter	preemphasis_ctrl_2ndposttap_inv_setting = "false";
	parameter	preemphasis_ctrl_2ndposttap_setting = 0;
	parameter	preemphasis_ctrl_pretap_inv_setting = "false";
	parameter	preemphasis_ctrl_pretap_setting = 0;
	parameter	protocol = "basic";
	parameter	receiver_termination = "off";
	parameter	reconfig_dprio_mode = 0;
	parameter	reconfig_pll_inclk_width = 1;
	parameter	reconfig_protocol = "basic";
	parameter	reconfig_use_global_clk_divider = "auto";
	parameter	reverse_loopback_mode = "none";
	parameter	rx_8b_10b_compatibility_mode = "false";
	parameter	rx_8b_10b_mode = "none";
	parameter	rx_adaptive_equalization_mode = "none";
	parameter	rx_add_generic_fifo_we_synch_register = "false";
	parameter	rx_align_loss_sync_error_num = 1;
	parameter	rx_align_pattern = "0000000000";
	parameter	rx_align_pattern_length = 10;
	parameter	rx_align_to_deskew_pattern_pos_disp_only = "false";
	parameter	rx_allow_align_polarity_inversion = "false";
	parameter	rx_allow_pipe_polarity_inversion = "false";
	parameter	rx_bandwidth_mode = 1;
	parameter	rx_bitslip_enable = "false";
	parameter	rx_byte_order_pad_pattern = "0";
	parameter	rx_byte_order_pattern = "0";
	parameter	rx_byte_ordering_mode = "none";
	parameter	rx_channel_bonding = "indv";
	parameter	rx_channel_width = 8;
	parameter	rx_common_mode = "0.9V";
	parameter	rx_cru_inclock1_period = 5000;
	parameter	rx_cru_inclock2_period = 5000;
	parameter	rx_cru_inclock3_period = 5000;
	parameter	rx_cru_inclock4_period = 5000;
	parameter	rx_cru_inclock5_period = 5000;
	parameter	rx_cru_inclock6_period = 5000;
	parameter	rx_cru_inclock_period = 5000;
	parameter	rx_cru_log_index = 0;
	parameter	rx_cru_pre_divide_by = 1;
	parameter	rx_cruclk_width = number_of_channels;
	parameter	rx_custom_deskew_pattern = "false";
	parameter	rx_data_rate = 1000;
	parameter	rx_data_rate_remainder = 0;
	parameter	rx_datapath_protocol = "basic";
	parameter	rx_deskew_pattern = "0";
	parameter	rx_digitalreset_port_width = digitalreset_port_width;
	parameter	rx_disable_auto_idle_insertion = "false";
	parameter	rx_disable_running_disp_in_word_align = "false";
	parameter	rx_dprio_mode = "none";
	parameter	rx_enable_bit_reversal = "false";
	parameter	rx_enable_dc_coupling = "false";
	parameter	rx_enable_deep_align_byte_swap = "false";
	parameter	rx_enable_lock_to_data_sig = "false";
	parameter	rx_enable_lock_to_refclk_sig = "false";
	parameter	rx_enable_self_test_mode = "false";
	parameter	rx_enable_true_complement_match_in_word_align = "false";
	parameter	rx_flip_rx_out = "false";
	parameter	rx_force_freq_det_high = "false";
	parameter	rx_force_freq_det_low = "false";
	parameter	rx_force_signal_detect = "false";
	parameter	rx_force_signal_detect_dig = "true";
	parameter	rx_ignore_lock_detect = "false";
	parameter	rx_infiniband_invalid_code = 0;
	parameter	rx_insert_pad_on_underflow = "false";
	parameter	rx_num_align_code_groups_in_ordered_set = 0;
	parameter	rx_num_align_cons_good_data = 1;
	parameter	rx_num_align_cons_pat = 1;
	parameter	rx_pll_sim_clkout_phase_shift = 0;
	parameter	rx_ppmselect = 32;
	parameter	rx_rate_match_almost_empty_threshold = 11;
	parameter	rx_rate_match_almost_full_threshold = 13;
	parameter	rx_rate_match_back_to_back = "false";
	parameter	rx_rate_match_fifo_mode = "none";
	parameter	rx_rate_match_fifo_read_mux_sel = "auto";
	parameter	rx_rate_match_fifo_write_mux_sel = "auto";
	parameter	rx_rate_match_ordered_set_based = "false";
	parameter	rx_rate_match_pattern1 = "0";
	parameter	rx_rate_match_pattern2 = "0";
	parameter	rx_rate_match_pattern_size = 10;
	parameter	rx_rate_match_skip_set_based = "false";
	parameter	rx_reconfig_clk_scheme = "tx_clk_to_rx";
	parameter	rx_run_length = 200;
	parameter	rx_run_length_enable = "true";
	parameter	rx_self_test_mode = "incremental";
	parameter	rx_signal_detect_threshold = 1;
	parameter	rx_use_align_state_machine = "false";
	parameter	rx_use_clkout = "true";
	parameter	rx_use_coreclk = "false";
	parameter	rx_use_cruclk = "false";
	parameter	rx_use_deserializer_double_data_mode = "false";
	parameter	rx_use_deskew_fifo = "false";
	parameter	rx_use_double_data_mode = "false";
	parameter	rx_use_local_refclk = "false";
	parameter	rx_use_pipe8b10binvpolarity = "false";
	parameter	rx_use_rate_match_pattern1_only = "false";
	parameter	rx_use_rising_edge_triggered_pattern_align = "false";
	parameter	sim_dump_dprio_internal_reg_at_time = 0;
	parameter	sim_dump_filename = "sim_dprio_dump.txt";
	parameter	starting_channel_number = 0;
	parameter	transmitter_termination = "off";
	parameter	tx_8b_10b_compatibility_mode = "false";
	parameter	tx_8b_10b_mode = "none";
	parameter	tx_allow_polarity_inversion = "false";
	parameter	tx_analog_power = "1.5V";
	parameter	tx_channel_bonding = "indv";
	parameter	tx_channel_width = 8;
	parameter	tx_common_mode = "0.75V";
	parameter	tx_data_rate = 1000;
	parameter	tx_data_rate_remainder = 0;
	parameter	tx_digitalreset_port_width = digitalreset_port_width;
	parameter	tx_divider_refclk_select = "auto";
	parameter	tx_dprio_mode = "none";
	parameter	tx_enable_bit_reversal = "false";
	parameter	tx_enable_idle_selection = "false";
	parameter	tx_enable_self_test_mode = "false";
	parameter	tx_enable_slew_rate = "false";
	parameter	tx_enable_symbol_swap = "false";
	parameter	tx_flip_tx_in = "false";
	parameter	tx_force_disparity_mode = "false";
	parameter	tx_force_echar = "false";
	parameter	tx_force_kchar = "false";
	parameter	tx_low_speed_test_select = 0;
	parameter	tx_pll_reconfig_sim_clkout_phase_shift = 0;
	parameter	tx_pll_sim_clkout_phase_shift = 0;
	parameter	tx_reconfig_clk_scheme = "tx_ch0_clk_source";
	parameter	tx_reconfig_data_rate = 1000;
	parameter	tx_reconfig_data_rate_remainder = 0;
	parameter	tx_refclk_divide_by = 1;
	parameter	tx_refclk_select = "auto";
	parameter	tx_rxdetect_ctrl = 0;
	parameter	tx_self_test_mode = "incremental";
	parameter	tx_transmit_protocol = "basic";
	parameter	tx_use_coreclk = "false";
	parameter	tx_use_double_data_mode = "false";
	parameter	tx_use_serializer_double_data_mode = "false";
	parameter	use_calibration_block = "true";
	parameter	use_global_clk_divider = "auto";
    parameter	vod_ctrl_setting = 1;
	
	localparam	number_channels_per_quad = 4;
	localparam	num_quad_per_prot = ( operation_mode == "rx" ) ? ( ( ( rx_channel_bonding != "x8" ) && ( rx_channel_bonding != "x8_unbundled" ) ) ? 1 : 2 ) : ( operation_mode == "tx" ) ? ( ( ( tx_channel_bonding != "x8" ) && ( tx_channel_bonding != "x8_unbundled" ) ) ? 1 : 2 ) : ( ( tx_channel_bonding != "x8" ) && ( tx_channel_bonding != "x8_unbundled" ) ) ? 1 : 2;
    localparam	number_of_quads = ( ( number_of_channels / number_channels_per_quad ) <= 0 ) ? 1 : ( ( number_of_channels % number_channels_per_quad ) != 0 ) ? ( number_of_channels / number_channels_per_quad ) + 1 : ( number_of_channels / number_channels_per_quad );
    localparam	int_rx_use_deserializer_double_data_mode = ( ( protocol == "gige" ) || ( protocol == "xaui" ) || ( protocol == "pipe" ) ) ? "false" : rx_use_deserializer_double_data_mode;
	localparam	int_gxb_powerdown_width = ( ( number_of_quads % num_quad_per_prot ) != 0 ) ? ( number_of_quads / num_quad_per_prot ) + 1 : ( number_of_quads / num_quad_per_prot );
	localparam	int_rx_dwidth_factor = ( ( rx_use_double_data_mode == "true" ) && ( int_rx_use_deserializer_double_data_mode == "true" ) ) ? 4 : ( ( rx_use_double_data_mode == "false" ) && ( int_rx_use_deserializer_double_data_mode == "false" ) ) ? 1 : ( ( rx_use_double_data_mode == "true" ) || ( int_rx_use_deserializer_double_data_mode == "true" ) ) ? 2 : 1;
	localparam	int_rx_word_aligner_num_byte = ( rx_use_deserializer_double_data_mode == "true" ) ? 2 : 1;
	localparam	int_tx_dwidth_factor = ( ( tx_use_double_data_mode == "true" ) && ( tx_use_serializer_double_data_mode == "true" ) ) ? 4 : ( ( tx_use_double_data_mode == "false" ) && ( tx_use_serializer_double_data_mode == "false" ) ) ? 1 : ( ( tx_use_double_data_mode == "true" ) || ( tx_use_serializer_double_data_mode == "true" ) ) ? 2 : 1;
	
	output	[(number_of_channels*6)-1:0]	aeq_fromgxb;
	input	[(number_of_channels*4)-1:0]	aeq_togxb;
	output	[4:0]	cal_blk_calibrationstatus;
	input	cal_blk_clk;
	input	cal_blk_powerdown;
	output	[number_of_quads-1:0]	coreclkout;
	output	[(number_of_channels)-1:0]	debug_rx_phase_comp_fifo_error;
	output	[(number_of_channels)-1:0]	debug_tx_phase_comp_fifo_error;
	input	fixedclk;
	input	[0:0]	gxb_enable;
	input	[int_gxb_powerdown_width-1:0]	gxb_powerdown;
	input	[number_of_channels-1:0]	pipe8b10binvpolarity;
	output	[(number_of_channels)-1:0]	pipedatavalid;
	output	[(number_of_channels)-1:0]	pipeelecidle;
	output	[(number_of_channels)-1:0]	pipephydonestatus;
	output	[(number_of_channels*3)-1:0]	pipestatus;
	input	pll_inclk;
	input	pll_inclk_alt;
	input	[reconfig_pll_inclk_width-1:0]	pll_inclk_rx_cruclk;
	output	[number_of_quads-1:0]	pll_locked;
	output	[number_of_quads-1:0]	pll_locked_alt;
	input	[(number_of_channels*2)-1:0]	powerdn;
	input	reconfig_clk;
	output	[number_of_quads-1:0]	reconfig_fromgxb;
	output	[number_of_quads-1:0]	reconfig_fromgxb_oe;
	input	[2:0]	reconfig_togxb;
	input	[number_of_channels-1:0]	rx_a1a2size;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_a1a2sizeout;
	output	[(number_of_channels*int_rx_word_aligner_num_byte)-1:0]	rx_a1detect;
	output	[(number_of_channels*int_rx_word_aligner_num_byte)-1:0]	rx_a2detect;
	input	[rx_digitalreset_port_width-1:0]	rx_analogreset;
	output	[(number_of_channels)-1:0]	rx_bistdone;
	output	[(number_of_channels)-1:0]	rx_bisterr;
	input	[number_of_channels-1:0]	rx_bitslip;
	output	[(number_of_channels)-1:0]	rx_byteorderalignstatus;
	output	[number_of_quads-1:0]	rx_channelaligned;
	output	[(number_of_channels)-1:0]	rx_clkout;
	input	[number_of_channels-1:0]	rx_coreclk;
	input	[rx_cruclk_width-1:0]	rx_cruclk;
	input	[rx_cruclk_width-1:0]	rx_cruclk_alt;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_ctrldetect;
	input	[number_of_channels-1:0]	rx_datain;
	output	[((rx_channel_width*number_of_channels))-1:0]	rx_dataout;
	output	[((64*number_of_channels))-1:0]	rx_dataoutfull;
	input	[rx_digitalreset_port_width-1:0]	rx_digitalreset;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_disperr;
	input	[number_of_channels-1:0]	rx_enabyteord;
	input	[number_of_channels-1:0]	rx_enapatternalign;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_errdetect;
	output	[(number_of_channels)-1:0]	rx_freqlocked;
	input	[number_of_channels-1:0]	rx_invpolarity;
	output	[(number_of_channels*int_rx_word_aligner_num_byte)-1:0]	rx_k1detect;
	output	[(number_of_channels*2)-1:0]	rx_k2detect;
	input	[number_of_channels-1:0]	rx_locktodata;
	input	[number_of_channels-1:0]	rx_locktorefclk;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_patterndetect;
	output	[(number_of_channels)-1:0]	rx_phfifooverflow;
	input	[number_of_channels-1:0]	rx_phfifordenable;
	input	[number_of_channels-1:0]	rx_phfiforeset;
	output	[(number_of_channels)-1:0]	rx_phfifounderflow;
	input	[number_of_channels-1:0]	rx_phfifowrdisable;
	output	[(number_of_channels)-1:0]	rx_pll_locked;
	input	[number_of_channels-1:0]	rx_powerdown;
	output	[(number_of_channels)-1:0]	rx_recovclkout;
	input	[number_of_channels-1:0]	rx_revbitorderwa;
	input	[number_of_channels-1:0]	rx_revbyteorderwa;
	output	[(number_of_channels)-1:0]	rx_rlv;
	output	[(number_of_channels)-1:0]	rx_rmfifoalmostempty;
	output	[(number_of_channels)-1:0]	rx_rmfifoalmostfull;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_rmfifodatadeleted;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_rmfifodatainserted;
	output	[(number_of_channels)-1:0]	rx_rmfifoempty;
	output	[(number_of_channels)-1:0]	rx_rmfifofull;
	input	[number_of_channels-1:0]	rx_rmfifordena;
	input	[number_of_channels-1:0]	rx_rmfiforeset;
	input	[number_of_channels-1:0]	rx_rmfifowrena;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_runningdisp;
	input	[number_of_channels-1:0]	rx_seriallpbken;
	output	[(number_of_channels)-1:0]	rx_signaldetect;
	output	[(number_of_channels*int_rx_dwidth_factor)-1:0]	rx_syncstatus;
	output	[(number_of_channels)-1:0]	tx_clkout;
	input	[number_of_channels-1:0]	tx_coreclk;
	input	[(int_tx_dwidth_factor*number_of_channels)-1:0]	tx_ctrlenable;
	input	[(tx_channel_width*number_of_channels)-1:0]	tx_datain;
	input	[(44*number_of_channels)-1:0]	tx_datainfull;
	output	[(number_of_channels)-1:0]	tx_dataout;
	input	[number_of_channels-1:0]	tx_detectrxloop;
	input	[tx_digitalreset_port_width-1:0]	tx_digitalreset;
	input	[(int_tx_dwidth_factor*number_of_channels)-1:0]	tx_dispval;
	input	[(int_tx_dwidth_factor*number_of_channels)-1:0]	tx_forcedisp;
	input	[number_of_channels-1:0]	tx_forcedispcompliance;
	input	[number_of_channels-1:0]	tx_forceelecidle;
	input	[number_of_channels-1:0]	tx_invpolarity;
	output	[(number_of_channels)-1:0]	tx_phfifooverflow;
	input	[number_of_channels-1:0]	tx_phfiforeset;
	output	[(number_of_channels)-1:0]	tx_phfifounderflow;
	input	[number_of_channels-1:0]	tx_revparallellpbken;

endmodule // alt2gxb

//////////////////////////////////////////////////////////////////////////
// altufm_spi parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altufm_spi
#(	parameter	access_mode = "unused",
	parameter	byte_of_page_write = 8,
	parameter	config_mode = "unused",
	parameter	intended_device_family = "unused",
	parameter	erase_time = 500000000,
	parameter	lpm_file = "UNUSED",
	parameter	osc_frequency = 180000,
	parameter	program_time = 1600000,
	parameter	width_ufm_address = 9,
	parameter	lpm_type = "altufm_spi",
	parameter	lpm_hint = "unused")
(	input	wire	ncs,
	output	wire	osc,
	input	wire	oscena,
	input	wire	sck,
	input	wire	si,
	output	wire	so)/* synthesis syn_black_box=1 */;

endmodule //altufm_spi

//////////////////////////////////////////////////////////////////////////
// altfp_log parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_log
#(	parameter	intended_device_family = "unused",
	parameter	pipeline = 21,
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_log",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	data,
	output	wire	nan,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_log

//////////////////////////////////////////////////////////////////////////
// altfp_exp parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_exp
#(	parameter	intended_device_family = "unused",
	parameter	pipeline = 17,
	parameter	rounding = "TO_NEAREST",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_exp",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	data,
	output	wire	nan,
	output	wire	overflow,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	underflow,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_exp

//////////////////////////////////////////////////////////////////////////
// altfp_div parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_div
#(	parameter	decoder_support = "NO",
	parameter	denormal_support = "YES",
	parameter	intended_device_family = "unused",
	parameter	exception_handling = "YES",
	parameter	optimize = "SPEED",
	parameter	pipeline = 32,
	parameter	reduced_functionality = "NO",
	parameter	rounding = "TO_NEAREST",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_div",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	dataa,
	input	wire	[width_exp+width_man+1-1:0]	datab,
	output	wire	denormal,
	output	wire	division_by_zero,
	output	wire	indefinite,
	output	wire	nan,
	output	wire	overflow,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	underflow,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_div

//////////////////////////////////////////////////////////////////////////
// altfp_compare parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_compare
#(	parameter	intended_device_family = "unused",
	parameter	pipeline = 3,
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_compare",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	output	wire	aeb,
	output	wire	agb,
	output	wire	ageb,
	output	wire	alb,
	output	wire	aleb,
	output	wire	aneb,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	dataa,
	input	wire	[width_exp+width_man+1-1:0]	datab,
	output	wire	unordered)/* synthesis syn_black_box=1 */;

endmodule //altfp_compare

//////////////////////////////////////////////////////////////////////////
// altqpram parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altqpram
#(	parameter	indata_aclr_a = "INACLR_A",
	parameter	indata_aclr_b = "INACLR_B",
	parameter	indata_reg_a = "INCLOCK_A",
	parameter	indata_reg_b = "INCLOCK_B",
	parameter	init_file = "UNUSED",
	parameter	intended_device_family = "unused",
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altqpram",
	parameter	maximum_depth = 4096,
	parameter	numwords_read_a = 1,
	parameter	numwords_read_b = 1,
	parameter	numwords_write_a = 1,
	parameter	numwords_write_b = 1,
	parameter	operation_mode = "QUAD_PORT",
	parameter	outdata_aclr_a = "OUTACLR_A",
	parameter	outdata_aclr_b = "OUTACLR_B",
	parameter	outdata_reg_a = "UNREGISTERED",
	parameter	outdata_reg_b = "UNREGISTERED",
	parameter	rdaddress_aclr_a = "OUTACLR_A",
	parameter	rdaddress_aclr_b = "OUTACLR_B",
	parameter	rdaddress_reg_a = "OUTCLOCK_A",
	parameter	rdaddress_reg_b = "OUTCLOCK_B",
	parameter	rdcontrol_aclr_a = "OUTACLR_A",
	parameter	rdcontrol_aclr_b = "OUTACLR_B",
	parameter	rdcontrol_reg_a = "OUTCLOCK_A",
	parameter	rdcontrol_reg_b = "OUTCLOCK_B",
	parameter	suppress_memory_conversion_warnings = "OFF",
	parameter	width_read_a = 1,
	parameter	width_read_b = 1,
	parameter	width_write_a = 1,
	parameter	width_write_b = 1,
	parameter	widthad_read_a = 1,
	parameter	widthad_read_b = 1,
	parameter	widthad_write_a = 1,
	parameter	widthad_write_b = 1,
	parameter	wraddress_aclr_a = "INACLR_A",
	parameter	wraddress_aclr_b = "INACLR_B",
	parameter	wrcontrol_aclr_a = "INACLR_A",
	parameter	wrcontrol_aclr_b = "INACLR_B",
	parameter	wrcontrol_wraddress_reg_a = "INCLOCK_A",
	parameter	wrcontrol_wraddress_reg_b = "INCLOCK_B")
(	input	wire	[width_write_a-1:0]	data_a,
	input	wire	[width_write_b-1:0]	data_b,
	input	wire	inaclr_a,
	input	wire	inaclr_b,
	input	wire	inclock_a,
	input	wire	inclock_b,
	input	wire	inclocken_a,
	input	wire	inclocken_b,
	input	wire	outaclr_a,
	input	wire	outaclr_b,
	input	wire	outclock_a,
	input	wire	outclock_b,
	input	wire	outclocken_a,
	input	wire	outclocken_b,
	output	wire	[width_read_a-1:0]	q_a,
	output	wire	[width_read_b-1:0]	q_b,
	input	wire	[widthad_read_a-1:0]	rdaddress_a,
	input	wire	[widthad_read_b-1:0]	rdaddress_b,
	input	wire	rden_a,
	input	wire	rden_b,
	input	wire	[widthad_write_a-1:0]	wraddress_a,
	input	wire	[widthad_write_b-1:0]	wraddress_b,
	input	wire	wren_a,
	input	wire	wren_b);
endmodule // altqpram

//////////////////////////////////////////////////////////////////////////
// alt_oct parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_oct
#(	parameter	allow_serial_data_from_core = "FALSE",
	parameter	intended_device_family = "unused",
	parameter	enable_parallel_termination = "FALSE",
	parameter	oct_block_number = 0,
	parameter	power_down = "TRUE",
	parameter	test_mode = "FALSE",
	parameter	width_ptc = 14,
	parameter	width_stc = 14,
	parameter	lpm_type = "alt_oct",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	output	wire	[oct_block_number-1:0]	cal_shift_busy,
	output	wire	[oct_block_number-1:0]	calibration_busy,
	output	wire	[oct_block_number-1:0]	calibration_done,
	input	wire	[oct_block_number-1:0]	calibration_only_req,
	input	wire	[oct_block_number-1:0]	calibration_request,
	input	wire	[oct_block_number-1:0]	calibration_wait,
	input	wire	clken,
	input	wire	clock,
	output	wire	incrdn,
	output	wire	incrup,
	output	wire	[oct_block_number * width_ptc-1:0]	parallelterminationcontrol,
	input	wire	[oct_block_number-1:0]	rdn,
	input	wire	[oct_block_number-1:0]	rup,
	input	wire	[oct_block_number-1:0]	rzqin,
	input	wire	[oct_block_number-1:0]	s2pload,
	output	wire	scanout,
	output	wire	[oct_block_number * width_stc-1:0]	seriesterminationcontrol,
	output	wire	[oct_block_number-1:0]	shift_busy,
	input	wire	[oct_block_number-1:0]	shift_only_req,
	output	wire	shiftregisterprobe,
	output	wire	[16 * oct_block_number-1:0]	termination_control,
	output	wire	terminationcontrolprobe)/* synthesis syn_black_box=1 */;

endmodule //alt_oct

//////////////////////////////////////////////////////////////////////////
// dcfifo parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	dcfifo
#(	parameter	add_ram_output_register = "OFF",
	parameter	add_usedw_msb_bit = "OFF",
	parameter	clocks_are_synchronized = "FALSE",
	parameter	delay_rdusedw = 1,
	parameter	delay_wrusedw = 1,
	parameter	intended_device_family = "unused",
	parameter	lpm_numwords = 1,
	parameter	lpm_showahead = "OFF",
	parameter	lpm_width = 1,
	parameter	lpm_widthu = 1,
	parameter	overflow_checking = "ON",
	parameter	rdsync_delaypipe = 0,
	parameter	underflow_checking = "ON",
	parameter	use_eab = "ON",
	parameter	write_aclr_synch = "OFF",
	parameter	wrsync_delaypipe = 0,
	parameter	lpm_type = "dcfifo",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	[lpm_width-1:0]	data,
	output	wire	[lpm_width-1:0]	q,
	input	wire	rdclk,
	output	wire	rdempty,
	output	wire	rdfull,
	input	wire	rdreq,
	output	wire	[lpm_widthu-1:0]	rdusedw,
	input	wire	wrclk,
	output	wire	wrempty,
	output	wire	wrfull,
	input	wire	wrreq,
	output	wire	[lpm_widthu-1:0]	wrusedw)/* synthesis syn_black_box=1 */;

endmodule //dcfifo

//////////////////////////////////////////////////////////////////////////
// sld_virtual_jtag parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module sld_virtual_jtag
#(	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "sld_virtual_jtag",
	parameter	sld_auto_instance_index = "NO",
	parameter	sld_instance_index = 0,
	parameter	sld_ir_width = 1,
	parameter	sld_sim_action = "UNUSED",
	parameter	sld_sim_n_scan = 0,
	parameter	sld_sim_total_length = 0)
(	output	wire	[sld_ir_width-1:0]	ir_in,
	input	wire	[sld_ir_width-1:0]	ir_out,
	output	wire	jtag_state_cdr,
	output	wire	jtag_state_cir,
	output	wire	jtag_state_e1dr,
	output	wire	jtag_state_e1ir,
	output	wire	jtag_state_e2dr,
	output	wire	jtag_state_e2ir,
	output	wire	jtag_state_pdr,
	output	wire	jtag_state_pir,
	output	wire	jtag_state_rti,
	output	wire	jtag_state_sdr,
	output	wire	jtag_state_sdrs,
	output	wire	jtag_state_sir,
	output	wire	jtag_state_sirs,
	output	wire	jtag_state_tlr,
	output	wire	jtag_state_udr,
	output	wire	jtag_state_uir,
	output	wire	tck,
	output	wire	tdi,
	input	wire	tdo,
	output	wire	tms,
	output	wire	virtual_state_cdr,
	output	wire	virtual_state_cir,
	output	wire	virtual_state_e1dr,
	output	wire	virtual_state_e2dr,
	output	wire	virtual_state_pdr,
	output	wire	virtual_state_sdr,
	output	wire	virtual_state_udr,
	output	wire	virtual_state_uir) /* synthesis syn_black_box=1 */;
endmodule // sld_virtual_jtag

//////////////////////////////////////////////////////////////////////////
// alt2gxb_reconfig parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt2gxb_reconfig
#(	parameter	aeq_fromgxb_width = 6,
	parameter	aeq_mode = "RUN",
	parameter	aeq_togxb_width = 4,
	parameter	aeq_translate_eqs = "YES",
	parameter	avmm_slave_addr_width = 16,
	parameter	avmm_slave_rdata_width = 16,
	parameter	avmm_slave_wdata_width = 16,
	parameter	base_port_width = 1,
	parameter	channel_address_width = 1,
	parameter	data_latency = 0,
	parameter	intended_device_family = "unused",
	parameter	enable_aeq = "OFF",
	parameter	enable_buf_cal = "FALSE",
	parameter	enable_buf_cal_func_sim = "FALSE",
	parameter	enable_chl_addr_for_analog_ctrl = "FALSE",
	parameter	enable_dfe = "OFF",
	parameter	enable_eye_monitor = "OFF",
	parameter	enable_full_write = "FALSE",
	parameter	enable_illegal_mode_check = "FALSE",
	parameter	enable_rx_tx_duplex_sel = "FALSE",
	parameter	enable_self_recovery = "FALSE",
	parameter	enable_stratixiv_rx_equalization = "FALSE",
	parameter	logical_pll_sel_width = 1,
	parameter	mif_address_width = 5,
	parameter	number_of_channels = 1,
	parameter	number_of_reconfig_ports = 1,
	parameter	read_base_port_width = 1,
	parameter	reconfig_fromgxb_width = 1,
	parameter	reconfig_mode_sel_width = 3,
	parameter	reconfig_togxb_width = 3,
	parameter	rx_eqdcgain_port_width = 2,
	parameter	tx_preemp_port_width = 4,
	parameter	lpm_type = "alt2gxb_reconfig",
	parameter	lpm_hint = "unused")
(	output	wire	adce_cal_busy,
	input	wire	[aeq_fromgxb_width-1:0]	aeq_fromgxb,
	output	wire	[aeq_togxb_width-1:0]	aeq_togxb,
	output	wire	busy,
	output	wire	channel_reconfig_done,
	output	wire	[number_of_channels-1:0]	conv_error,
	input	wire	[avmm_slave_addr_width-1:0]	ctrl_address,
	input	wire	ctrl_read,
	output	wire	[avmm_slave_rdata_width-1:0]	ctrl_readdata,
	output	wire	ctrl_waitrequest,
	input	wire	ctrl_write,
	input	wire	[avmm_slave_wdata_width-1:0]	ctrl_writedata,
	output	wire	data_valid,
	output	wire	[3:0]	eqout,
	output	wire	error,
	input	wire	[3-1:0]	gxb_address,
	input	wire	[channel_address_width-1:0]	logical_channel_address,
	input	wire	[logical_pll_sel_width-1:0]	logical_tx_pll_sel,
	input	wire	logical_tx_pll_sel_en,
	input	wire	offset_cancellation_reset,
	input	wire	[2-1:0]	rate_switch_ctrl,
	output	wire	[2-1:0]	rate_switch_out,
	input	wire	read,
	input	wire	[mif_address_width-1:0]	reconfig_address,
	output	wire	reconfig_address_en,
	output	wire	[mif_address_width-1:0]	reconfig_address_out,
	input	wire	reconfig_clk,
	input	wire	[16-1:0]	reconfig_data,
	input	wire	[16-1:0]	reconfig_data_mask,
	output	wire	[16-1:0]	reconfig_data_out,
	input	wire	[reconfig_fromgxb_width-1:0]	reconfig_fromgxb,
	input	wire	[reconfig_mode_sel_width-1:0]	reconfig_mode_sel,
	input	wire	reconfig_reset,
	output	wire	[reconfig_togxb_width-1:0]	reconfig_togxb,
	input	wire	reset_reconfig_address,
	input	wire	[base_port_width*4-1:0]	rx_eqctrl,
	output	wire	[read_base_port_width*4-1:0]	rx_eqctrl_out,
	input	wire	[base_port_width*rx_eqdcgain_port_width-1:0]	rx_eqdcgain,
	output	wire	[read_base_port_width*rx_eqdcgain_port_width-1:0]	rx_eqdcgain_out,
	input	wire	[2-1:0]	rx_tx_duplex_sel,
	input	wire	start,
	output	wire	timeout,
	input	wire	transceiver_init,
	input	wire	[base_port_width*tx_preemp_port_width-1:0]	tx_preemp_0t,
	output	wire	[read_base_port_width*tx_preemp_port_width-1:0]	tx_preemp_0t_out,
	input	wire	[base_port_width*tx_preemp_port_width-1:0]	tx_preemp_1t,
	output	wire	[read_base_port_width*tx_preemp_port_width-1:0]	tx_preemp_1t_out,
	input	wire	[base_port_width*tx_preemp_port_width-1:0]	tx_preemp_1ta,
	output	wire	[read_base_port_width*tx_preemp_port_width-1:0]	tx_preemp_1ta_out,
	input	wire	[base_port_width*tx_preemp_port_width-1:0]	tx_preemp_1tb,
	output	wire	[read_base_port_width*tx_preemp_port_width-1:0]	tx_preemp_1tb_out,
	input	wire	[base_port_width*tx_preemp_port_width-1:0]	tx_preemp_2t,
	output	wire	[read_base_port_width*tx_preemp_port_width-1:0]	tx_preemp_2t_out,
	input	wire	[base_port_width*3-1:0]	tx_vodctrl,
	output	wire	[read_base_port_width*3-1:0]	tx_vodctrl_out,
	input	wire	[base_port_width*3-1:0]	tx_vodctrla,
	output	wire	[read_base_port_width*3-1:0]	tx_vodctrla_out,
	input	wire	write_all)/* synthesis syn_black_box=1 */;

endmodule //alt2gxb_reconfig

//////////////////////////////////////////////////////////////////////////
// altmemmult parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altmemmult
#(	parameter	coeff_representation = "SIGNED",
	parameter	coefficient0 = "UNUSED",
	parameter	data_representation = "SIGNED",
	parameter	intended_device_family = "unused",
	parameter	max_clock_cycles_per_result = 1,
	parameter	number_of_coefficients = 1,
	parameter	ram_block_type = "AUTO",
	parameter	total_latency = 1,
	parameter	width_c = 1,
	parameter	width_d = 1,
	parameter	width_r = 1,
	parameter	width_s = 1,
	parameter	lpm_type = "altmemmult",
	parameter	lpm_hint = "unused")
(	input	wire	clock,
	input	wire	[width_c-1:0]	coeff_in,
	input	wire	[width_d-1:0]	data_in,
	output	wire	load_done,
	output	wire	[width_r-1:0]	result,
	output	wire	result_valid,
	input	wire	sclr,
	input	wire	[width_s-1:0]	sel,
	input	wire	sload_coeff,
	input	wire	sload_data)/* synthesis syn_black_box=1 */;

endmodule //altmemmult

//////////////////////////////////////////////////////////////////////////
// altshift_taps parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altshift_taps
#(	parameter	intended_device_family = "unused",
	parameter	number_of_taps = 1,
	parameter	power_up_state = "CLEARED",
	parameter	tap_distance = 1,
	parameter	width = 1,
	parameter	lpm_type = "altshift_taps",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clken,
	input	wire	clock,
	input	wire	[width-1:0]	shiftin,
	output	wire	[width-1:0]	shiftout,
	output	wire	[width*number_of_taps-1:0]	taps)/* synthesis syn_black_box=1 */;

endmodule //altshift_taps

//////////////////////////////////////////////////////////////////////////
// altpll_reconfig parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altpll_reconfig
#(	parameter	intended_device_family = "unused",
	parameter	init_from_rom = "NO",
	parameter	pll_type = "UNUSED",
	parameter	scan_chain = "UNUSED",
	parameter	scan_init_file = "UNUSED",
	parameter	use_scanclk_sync_register = "NO",
	parameter	lpm_type = "altpll_reconfig",
	parameter	lpm_hint = "unused")
(	output	wire	busy,
	input	wire	clock,
	input	wire	[2:0]	counter_param,
	input	wire	[3:0]	counter_type,
	input	wire	[8:0]	data_in,
	output	wire	[8:0]	data_out,
	output	wire	pll_areset,
	input	wire	pll_areset_in,
	output	wire	pll_configupdate,
	output	wire	pll_scanaclr,
	output	wire	pll_scanclk,
	output	wire	pll_scanclkena,
	output	wire	pll_scandata,
	input	wire	pll_scandataout,
	input	wire	pll_scandone,
	output	wire	pll_scanread,
	output	wire	pll_scanwrite,
	input	wire	read_param,
	input	wire	reconfig,
	input	wire	reset,
	input	wire	reset_rom_address,
	output	wire	[7:0]	rom_address_out,
	input	wire	rom_data_in,
	input	wire	write_from_rom,
	input	wire	write_param,
	output	wire	write_rom_ena)/* synthesis syn_black_box=1 */;

endmodule //altpll_reconfig

//////////////////////////////////////////////////////////////////////////
// altcal_dpa_pll parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altcal_dpa_pll
#(	parameter	calibrate_for_all_channels = "OFF",
	parameter	calibration_start_threshold = 256,
	parameter	calibration_wait_timer = 1024,
	parameter	number_of_channels = 1,
	parameter	lpm_type = "altcal_dpa_pll",
	parameter	lpm_hint = "unused")
(	output	wire	calibration_busy,
	input	wire	clock,
	output	wire	[number_of_channels-1:0]	dpa_fifo_reset,
	output	wire	[number_of_channels-1:0]	dpa_lock_out,
	output	wire	[number_of_channels-1:0]	dpa_lock_reset,
	input	wire	[number_of_channels-1:0]	dpa_locked,
	input	wire	[number_of_channels-1:0]	dpa_reset,
	input	wire	pll_locked,
	output	wire	[3:0]	pll_phasecounterselect,
	input	wire	pll_phasedone,
	output	wire	pll_phasestep,
	output	wire	pll_phaseupdown,
	input	wire	pll_scanclk,
	input	wire	recalibrate)/* synthesis syn_black_box=1 */;

endmodule //altcal_dpa_pll

//////////////////////////////////////////////////////////////////////////
// alt4gxb parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt4gxb
#(	parameter	advanced_calibration_clocking = "false",
	parameter	base_data_rate = "UNUSED",
	parameter	clk_div_use_vco_bypass = "false",
	parameter	cmu_clk_div_use_coreclk_out_post_divider = "false",
	parameter	cmu_offset_all_errors_align = "false",
	parameter	cmu_pll1_inclk_log_index = 0,
	parameter	cmu_pll1_log_index = 0,
	parameter	cmu_pll2_inclk_log_index = 0,
	parameter	cmu_pll2_log_index = 0,
	parameter	cmu_pll3_inclk_log_index = 0,
	parameter	cmu_pll3_log_index = 0,
	parameter	cmu_pll_inclk_log_index = 0,
	parameter	cmu_pll_log_index = 0,
	parameter	cmu_pll_reconfig_inclk_log_index = 0,
	parameter	cmu_pll_reconfig_log_index = 0,
	parameter	coreclkout_control_width = 1,
	parameter	intended_device_family = "unused",
	parameter	effective_data_rate = "UNUSED",
	parameter	elec_idle_infer_enable = "false",
	parameter	enable_0ppm = "false",
	parameter	enable_lc_tx_pll = "false",
	parameter	enable_pcie_gen2_reset = "false",
	parameter	enable_pcie_gen2_x8_es = "false",
	parameter	enable_pll_cascade = "false",
	parameter	enable_pll_inclk_drive_rx_cru = "false",
	parameter	enable_pma_direct = "false",
	parameter	enable_pma_xn_bonding = "false",
	parameter	equalizer_ctrl_a_setting = 7,
	parameter	equalizer_ctrl_b_setting = 7,
	parameter	equalizer_ctrl_c_setting = 7,
	parameter	equalizer_ctrl_d_setting = 7,
	parameter	equalizer_ctrl_v_setting = 7,
	parameter	equalizer_dcgain_setting = 0,
	parameter	gen_reconfig_pll = "false",
	parameter	gx_channel_type = "auto",
	parameter	gxb_analog_power = "AUTO",
	parameter	gxb_powerdown_width = 1,
	parameter	hip_enable = "false",
	parameter	input_clock_frequency = "UNUSED",
	parameter	intended_device_speed_grade = "UNUSED",
	parameter	intended_device_variant = "UNUSED",
	parameter	loopback_mode = "none",
	parameter	number_of_channels = 1,
	parameter	number_of_quads = 1,
	parameter	operation_mode = "duplex",
	parameter	pcie_sw_width = 1,
	parameter	pll1_control_width = 1,
	parameter	pll2_control_width = 1,
	parameter	pll3_control_width = 1,
	parameter	pll_control_width = 1,
	parameter	pll_pfd_fb_mode = "internal",
	parameter	preemphasis_ctrl_1stposttap_setting = 0,
	parameter	preemphasis_ctrl_2ndposttap_inv_setting = "false",
	parameter	preemphasis_ctrl_2ndposttap_setting = 0,
	parameter	preemphasis_ctrl_pretap_inv_setting = "false",
	parameter	preemphasis_ctrl_pretap_setting = 0,
	parameter	protocol = "basic",
	parameter	rateswitch_control_width = 1,
	parameter	receiver_termination = "OCT_100_OHMS",
	parameter	reconfig_base_data_rate = "UNUSED",
	parameter	reconfig_calibration = "false",
	parameter	reconfig_dprio_mode = 0,
	parameter	reconfig_fromgxb_port_width = 1,
	parameter	reconfig_input_clock_frequency = "UNUSED",
	parameter	reconfig_pll_inclk_width = 1,
	parameter	reconfig_protocol = "basic",
	parameter	reconfig_togxb_port_width = 3,
	parameter	rx_0ppm_core_clock = "false",
	parameter	rx_8b_10b_compatibility_mode = "true",
	parameter	rx_8b_10b_mode = "none",
	parameter	rx_adaptive_equalization_mode = "none",
	parameter	rx_align_loss_sync_error_num = 1,
	parameter	rx_align_pattern = "0000000000",
	parameter	rx_align_pattern_length = 10,
	parameter	rx_align_to_deskew_pattern_pos_disp_only = "false",
	parameter	rx_allow_align_polarity_inversion = "false",
	parameter	rx_allow_pipe_polarity_inversion = "false",
	parameter	rx_bitslip_enable = "false",
	parameter	rx_byte_order_pad_pattern = "0",
	parameter	rx_byte_order_pattern = "0",
	parameter	rx_byte_order_pld_ctrl_enable = "false",
	parameter	rx_byte_ordering_mode = "none",
	parameter	rx_cdrctrl_enable = "false",
	parameter	rx_channel_bonding = "indv",
	parameter	rx_channel_width = 8,
	parameter	rx_common_mode = "0.82v",
	parameter	rx_cru_bandwidth_type = "auto",
	parameter	rx_cru_inclk_log_index = 0,
	parameter	rx_cru_inclock0_period = 5000,
	parameter	rx_cru_inclock1_period = 5000,
	parameter	rx_cru_inclock2_period = 5000,
	parameter	rx_cru_inclock3_period = 5000,
	parameter	rx_cru_inclock4_period = 5000,
	parameter	rx_cru_inclock5_period = 5000,
	parameter	rx_cru_inclock6_period = 5000,
	parameter	rx_cru_inclock7_period = 5000,
	parameter	rx_cru_inclock8_period = 5000,
	parameter	rx_cru_inclock9_period = 5000,
	parameter	rx_cru_m_divider = 0,
	parameter	rx_cru_n_divider = 1,
	parameter	rx_cru_refclk_divide_by = 0,
	parameter	rx_cru_refclk_divider = 0,
	parameter	rx_cru_refclk_multiply_by = 0,
	parameter	rx_cru_use_refclk_pin = "false",
	parameter	rx_cru_vco_post_scale_divider = 1,
	parameter	rx_custom_deskew_pattern = "false",
	parameter	rx_data_rate = 1000,
	parameter	rx_data_rate_remainder = 0,
	parameter	rx_dataoutfull_width = 64,
	parameter	rx_datapath_low_latency_mode = "false",
	parameter	rx_datapath_protocol = "basic",
	parameter	rx_deskew_pattern = "0",
	parameter	rx_digitalreset_port_width = 1,
	parameter	rx_disable_auto_idle_insertion = "false",
	parameter	rx_disable_running_disp_in_word_align = "false",
	parameter	rx_dprio_mode = "none",
	parameter	rx_dwidth_factor = 2,
	parameter	rx_enable_bit_reversal = "false",
	parameter	rx_enable_dc_coupling = "false",
	parameter	rx_enable_deep_align_byte_swap = "false",
	parameter	rx_enable_lock_to_data_sig = "false",
	parameter	rx_enable_lock_to_refclk_sig = "false",
	parameter	rx_enable_self_test_mode = "false",
	parameter	rx_enable_true_complement_match_in_word_align = "false",
	parameter	rx_eyemonitor_bandwidth = 0,
	parameter	rx_flip_rx_out = "false",
	parameter	rx_force_freq_det_high = "false",
	parameter	rx_force_freq_det_low = "false",
	parameter	rx_force_signal_detect = "false",
	parameter	rx_force_signal_detect_dig = "true",
	parameter	rx_ignore_lock_detect = "false",
	parameter	rx_infiniband_invalid_code = 0,
	parameter	rx_insert_pad_on_underflow = "false",
	parameter	rx_num_align_code_groups_in_ordered_set = 0,
	parameter	rx_num_align_cons_good_data = 1,
	parameter	rx_num_align_cons_pat = 1,
	parameter	rx_phfiforegmode = "false",
	parameter	rx_pll_fast_lock_control = "false",
	parameter	rx_pll_sim_clkout_phase_shift = 0,
	parameter	rx_ppmselect = 32,
	parameter	rx_rate_match_almost_empty_threshold = 11,
	parameter	rx_rate_match_almost_full_threshold = 13,
	parameter	rx_rate_match_back_to_back = "false",
	parameter	rx_rate_match_delete_threshold = 0,
	parameter	rx_rate_match_empty_threshold = 0,
	parameter	rx_rate_match_fifo_mode = "none",
	parameter	rx_rate_match_fifo_mode_manual_control = "normal",
	parameter	rx_rate_match_full_threshold = 0,
	parameter	rx_rate_match_insert_threshold = 0,
	parameter	rx_rate_match_ordered_set_based = "false",
	parameter	rx_rate_match_pattern1 = "0",
	parameter	rx_rate_match_pattern2 = "0",
	parameter	rx_rate_match_pattern_size = 10,
	parameter	rx_rate_match_reset_enable = "false",
	parameter	rx_rate_match_skip_set_based = "false",
	parameter	rx_rate_match_start_threshold = 0,
	parameter	rx_reconfig_clk_scheme = "tx_clk_to_rx",
	parameter	rx_run_length = 40,
	parameter	rx_run_length_enable = "true",
	parameter	rx_self_test_mode = "incremental",
	parameter	rx_signal_detect_loss_threshold = 0,
	parameter	rx_signal_detect_threshold = 0,
	parameter	rx_signal_detect_valid_threshold = 0,
	parameter	rx_use_align_state_machine = "false",
	parameter	rx_use_clkout = "true",
	parameter	rx_use_coreclk = "false",
	parameter	rx_use_cruclk = "false",
	parameter	rx_use_deserializer_double_data_mode = "false",
	parameter	rx_use_deskew_fifo = "false",
	parameter	rx_use_double_data_mode = "false",
	parameter	rx_use_external_termination = "false",
	parameter	rx_use_pipe8b10binvpolarity = "false",
	parameter	rx_use_rate_match_pattern1_only = "false",
	parameter	rx_use_rising_edge_triggered_pattern_align = "false",
	parameter	rx_word_aligner_num_byte = 1,
	parameter	sim_dump_dprio_internal_reg_at_time = 0,
	parameter	sim_dump_filename = "sim_dprio_dump.txt",
	parameter	starting_channel_number = 0,
	parameter	transmitter_termination = "OCT_100_OHMS",
	parameter	tx_0ppm_core_clock = "false",
	parameter	tx_8b_10b_compatibility_mode = "true",
	parameter	tx_8b_10b_mode = "none",
	parameter	tx_allow_polarity_inversion = "false",
	parameter	tx_analog_power = "auto",
	parameter	tx_bitslip_enable = "false",
	parameter	tx_channel_bonding = "indv",
	parameter	tx_channel_width = 8,
	parameter	tx_clkout_width = 1,
	parameter	tx_common_mode = "0.65v",
	parameter	tx_data_rate = 1000,
	parameter	tx_data_rate_remainder = 0,
	parameter	tx_datainfull_width = 44,
	parameter	tx_datapath_low_latency_mode = "false",
	parameter	tx_digitalreset_port_width = 1,
	parameter	tx_dprio_mode = "none",
	parameter	tx_dwidth_factor = 2,
	parameter	tx_elec_idle_delay = 3,
	parameter	tx_enable_bit_reversal = "false",
	parameter	tx_enable_idle_selection = "false",
	parameter	tx_enable_self_test_mode = "false",
	parameter	tx_enable_symbol_swap = "false",
	parameter	tx_flip_tx_in = "false",
	parameter	tx_force_disparity_mode = "false",
	parameter	tx_force_echar = "false",
	parameter	tx_force_kchar = "false",
	parameter	tx_low_speed_test_select = 0,
	parameter	tx_phfiforegmode = "false",
	parameter	tx_pll1_bandwidth_type = "auto",
	parameter	tx_pll1_base_data_rate = "UNUSED",
	parameter	tx_pll1_input_clock_frequency = "UNUSED",
	parameter	tx_pll1_m_divider = 1,
	parameter	tx_pll1_n_divider = 1,
	parameter	tx_pll1_protocol = "basic",
	parameter	tx_pll1_type = "CMU",
	parameter	tx_pll1_vco_post_scale_divider = 1,
	parameter	tx_pll2_bandwidth_type = "auto",
	parameter	tx_pll2_base_data_rate = "UNUSED",
	parameter	tx_pll2_input_clock_frequency = "UNUSED",
	parameter	tx_pll2_m_divider = 1,
	parameter	tx_pll2_n_divider = 1,
	parameter	tx_pll2_protocol = "basic",
	parameter	tx_pll2_type = "CMU",
	parameter	tx_pll2_vco_post_scale_divider = 1,
	parameter	tx_pll3_bandwidth_type = "auto",
	parameter	tx_pll3_base_data_rate = "UNUSED",
	parameter	tx_pll3_input_clock_frequency = "UNUSED",
	parameter	tx_pll3_m_divider = 1,
	parameter	tx_pll3_n_divider = 1,
	parameter	tx_pll3_protocol = "basic",
	parameter	tx_pll3_type = "CMU",
	parameter	tx_pll3_vco_post_scale_divider = 1,
	parameter	tx_pll_bandwidth_type = "auto",
	parameter	tx_pll_clock_post_divider = 1,
	parameter	tx_pll_count = 0,
	parameter	tx_pll_inclk0_period = 5000,
	parameter	tx_pll_inclk1_period = 5000,
	parameter	tx_pll_inclk2_period = 5000,
	parameter	tx_pll_inclk3_period = 5000,
	parameter	tx_pll_inclk4_period = 5000,
	parameter	tx_pll_inclk5_period = 5000,
	parameter	tx_pll_inclk6_period = 5000,
	parameter	tx_pll_inclk7_period = 5000,
	parameter	tx_pll_inclk8_period = 5000,
	parameter	tx_pll_inclk9_period = 5000,
	parameter	tx_pll_m_divider = 0,
	parameter	tx_pll_n_divider = 1,
	parameter	tx_pll_pfd_clk_select = 1,
	parameter	tx_pll_refclk_divide_by = 0,
	parameter	tx_pll_refclk_divider = 0,
	parameter	tx_pll_refclk_multiply_by = 0,
	parameter	tx_pll_sim_clkout_phase_shift = 0,
	parameter	tx_pll_type = "CMU",
	parameter	tx_pll_use_refclk_pin = "false",
	parameter	tx_pll_vco_post_scale_divider = 1,
	parameter	tx_reconfig_clk_scheme = "tx_ch0_clk_source",
	parameter	tx_reconfig_data_rate = 1000,
	parameter	tx_reconfig_data_rate_remainder = 0,
	parameter	tx_reconfig_pll_bandwidth_type = "auto",
	parameter	tx_reconfig_pll_m_divider = 1,
	parameter	tx_reconfig_pll_n_divider = 1,
	parameter	tx_reconfig_pll_vco_post_scale_divider = 1,
	parameter	tx_refclk_divide_by = 1,
	parameter	tx_self_test_mode = "incremental",
	parameter	tx_slew_rate = "off",
	parameter	tx_transmit_protocol = "basic",
	parameter	tx_use_coreclk = "false",
	parameter	tx_use_double_data_mode = "false",
	parameter	tx_use_external_termination = "false",
	parameter	tx_use_serializer_double_data_mode = "false",
	parameter	use_calibration_block = "true",
	parameter	use_global_clk_divider = "auto",
	parameter	vod_ctrl_setting = 0,
	parameter	lpm_type = "alt4gxb",
	parameter	lpm_hint = "unused")
(	output	wire	[number_of_quads*4*8-1:0]	aeq_fromgxb,
	input	wire	[number_of_quads*4*6-1:0]	aeq_togxb,
	output	wire	[4:0]	cal_blk_calibrationstatus,
	input	wire	cal_blk_clk,
	input	wire	cal_blk_powerdown,
	input	wire	[number_of_quads-1:0]	cmu_rateswitchin,
	output	wire	[coreclkout_control_width-1:0]	coreclkout,
	input	wire	fixedclk,
	input	wire	[6*number_of_quads-1:0]	fixedclk_fast,
	input	wire	[gxb_powerdown_width-1:0]	gxb_powerdown,
	output	wire	[number_of_channels-1:0]	hip_tx_clkout,
	output	wire	[pcie_sw_width-1:0]	pcie_sw,
	input	wire	[number_of_channels-1:0]	pipe8b10binvpolarity,
	output	wire	[number_of_channels-1:0]	pipedatavalid,
	output	wire	[number_of_channels-1:0]	pipeelecidle,
	output	wire	[number_of_channels-1:0]	pipephydonestatus,
	output	wire	[number_of_channels*3-1:0]	pipestatus,
	output	wire	[pll1_control_width-1:0]	pll1_locked,
	input	wire	[pll1_control_width-1:0]	pll1_powerdown,
	output	wire	[pll2_control_width-1:0]	pll2_locked,
	input	wire	[pll2_control_width-1:0]	pll2_powerdown,
	output	wire	[pll3_control_width-1:0]	pll3_locked,
	input	wire	[pll3_control_width-1:0]	pll3_powerdown,
	input	wire	pll_inclk,
	input	wire	[reconfig_pll_inclk_width-1:0]	pll_inclk_rx_cruclk,
	input	wire	pll_inclk_slave,
	output	wire	[pll_control_width-1:0]	pll_locked,
	output	wire	[pll_control_width-1:0]	pll_locked_alt,
	input	wire	[pll_control_width-1:0]	pll_powerdown,
	input	wire	[pll_control_width-1:0]	pll_powerdown_alt,
	input	wire	[number_of_channels*2-1:0]	powerdn,
	input	wire	[rateswitch_control_width-1:0]	rateswitch,
	output	wire	[number_of_quads-1:0]	rateswitchbaseclock,
	input	wire	reconfig_clk,
	output	wire	[reconfig_fromgxb_port_width-1:0]	reconfig_fromgxb,
	output	wire	[number_of_quads-1:0]	reconfig_fromgxb_oe,
	input	wire	[reconfig_togxb_port_width-1:0]	reconfig_togxb,
	input	wire	[number_of_channels-1:0]	rx_a1a2size,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_a1a2sizeout,
	output	wire	[number_of_channels*rx_word_aligner_num_byte-1:0]	rx_a1detect,
	output	wire	[number_of_channels*rx_word_aligner_num_byte-1:0]	rx_a2detect,
	input	wire	[rx_digitalreset_port_width-1:0]	rx_analogreset,
	output	wire	[number_of_channels-1:0]	rx_bistdone,
	output	wire	[number_of_channels-1:0]	rx_bisterr,
	input	wire	[number_of_channels-1:0]	rx_bitslip,
	output	wire	[number_of_channels*5-1:0]	rx_bitslipboundaryselectout,
	output	wire	[number_of_channels-1:0]	rx_byteorderalignstatus,
	output	wire	[number_of_quads-1:0]	rx_channelaligned,
	output	wire	[number_of_channels-1:0]	rx_clkout,
	input	wire	[number_of_channels-1:0]	rx_coreclk,
	input	wire	[number_of_channels-1:0]	rx_cruclk,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_ctrldetect,
	input	wire	[number_of_channels-1:0]	rx_datain,
	output	wire	[rx_channel_width*number_of_channels-1:0]	rx_dataout,
	output	wire	[rx_dataoutfull_width*number_of_channels-1:0]	rx_dataoutfull,
	input	wire	[rx_digitalreset_port_width-1:0]	rx_digitalreset,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_disperr,
	input	wire	[number_of_channels*3-1:0]	rx_elecidleinfersel,
	input	wire	[number_of_channels-1:0]	rx_enabyteord,
	input	wire	[number_of_channels-1:0]	rx_enapatternalign,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_errdetect,
	output	wire	[number_of_channels-1:0]	rx_freqlocked,
	input	wire	[number_of_channels-1:0]	rx_invpolarity,
	output	wire	[number_of_channels*rx_word_aligner_num_byte-1:0]	rx_k1detect,
	output	wire	[number_of_channels*2-1:0]	rx_k2detect,
	input	wire	[number_of_channels-1:0]	rx_locktodata,
	input	wire	[number_of_channels-1:0]	rx_locktorefclk,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_patterndetect,
	output	wire	[number_of_channels-1:0]	rx_phase_comp_fifo_error,
	output	wire	[number_of_channels-1:0]	rx_phfifooverflow,
	input	wire	[number_of_channels-1:0]	rx_phfifordenable,
	input	wire	[number_of_channels-1:0]	rx_phfiforeset,
	output	wire	[number_of_channels-1:0]	rx_phfifounderflow,
	input	wire	[number_of_channels-1:0]	rx_phfifowrdisable,
	output	wire	[number_of_channels*4-1:0]	rx_pipebufferstat,
	output	wire	[number_of_channels-1:0]	rx_pll_locked,
	input	wire	[number_of_channels-1:0]	rx_powerdown,
	input	wire	[number_of_channels-1:0]	rx_prbscidenable,
	output	wire	[number_of_channels-1:0]	rx_recovclkout,
	input	wire	[number_of_channels-1:0]	rx_revbitorderwa,
	input	wire	[number_of_channels-1:0]	rx_revbyteorderwa,
	output	wire	[number_of_channels-1:0]	rx_revseriallpbkout,
	output	wire	[number_of_channels-1:0]	rx_rlv,
	output	wire	[number_of_channels-1:0]	rx_rmfifoalmostempty,
	output	wire	[number_of_channels-1:0]	rx_rmfifoalmostfull,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_rmfifodatadeleted,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_rmfifodatainserted,
	output	wire	[number_of_channels-1:0]	rx_rmfifoempty,
	output	wire	[number_of_channels-1:0]	rx_rmfifofull,
	input	wire	[number_of_channels-1:0]	rx_rmfifordena,
	input	wire	[number_of_channels-1:0]	rx_rmfiforeset,
	input	wire	[number_of_channels-1:0]	rx_rmfifowrena,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_runningdisp,
	input	wire	[number_of_channels-1:0]	rx_seriallpbken,
	input	wire	[number_of_channels-1:0]	rx_seriallpbkin,
	output	wire	[number_of_channels-1:0]	rx_signaldetect,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_syncstatus,
	input	wire	scanclk,
	input	wire	[22:0]	scanin,
	input	wire	scanmode,
	input	wire	scanshift,
	input	wire	[999:0]	testin,
	input	wire	[number_of_channels*5-1:0]	tx_bitslipboundaryselect,
	output	wire	[tx_clkout_width-1:0]	tx_clkout,
	input	wire	[number_of_channels-1:0]	tx_coreclk,
	input	wire	[number_of_channels*tx_dwidth_factor-1:0]	tx_ctrlenable,
	input	wire	[tx_channel_width*number_of_channels-1:0]	tx_datain,
	input	wire	[tx_datainfull_width*number_of_channels-1:0]	tx_datainfull,
	output	wire	[number_of_channels-1:0]	tx_dataout,
	input	wire	[number_of_channels-1:0]	tx_detectrxloop,
	input	wire	[tx_digitalreset_port_width-1:0]	tx_digitalreset,
	input	wire	[number_of_channels*tx_dwidth_factor-1:0]	tx_dispval,
	input	wire	[number_of_channels*tx_dwidth_factor-1:0]	tx_forcedisp,
	input	wire	[number_of_channels-1:0]	tx_forcedispcompliance,
	input	wire	[number_of_channels-1:0]	tx_forceelecidle,
	input	wire	[number_of_channels-1:0]	tx_invpolarity,
	output	wire	[number_of_channels-1:0]	tx_phase_comp_fifo_error,
	output	wire	[number_of_channels-1:0]	tx_phfifooverflow,
	input	wire	[number_of_channels-1:0]	tx_phfiforeset,
	output	wire	[number_of_channels-1:0]	tx_phfifounderflow,
	input	wire	[number_of_channels-1:0]	tx_pipedeemph,
	input	wire	[number_of_channels*3-1:0]	tx_pipemargin,
	input	wire	[number_of_channels-1:0]	tx_pipeswing,
	input	wire	tx_pllreset,
	input	wire	[number_of_channels-1:0]	tx_revparallellpbken,
	input	wire	[number_of_channels-1:0]	tx_revseriallpbkin,
	output	wire	[number_of_channels-1:0]	tx_seriallpbkout)/* synthesis syn_black_box=1 */;

endmodule //alt4gxb

//////////////////////////////////////////////////////////////////////////
// sld_mod_ram_rom parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module sld_mod_ram_rom
#(	parameter	cvalue = 1,
	parameter	is_data_in_ram = 1,
	parameter	is_readable = 1,
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "sld_mod_ram_rom",
	parameter	node_name = 0,
	parameter	numwords = 1,
	parameter	shift_count_bits = 4,
	parameter	width_word = 8,
	parameter	widthad = 16)
(	output	wire	[widthad-1:0]	address,
	input	wire	[width_word-1:0]	data_read,
	output	wire	[width_word-1:0]	data_write,
	output	wire	enable_write,
	output	wire	tck_usr) /* synthesis syn_black_box=1 */;
endmodule // sld_mod_ram_rom

//////////////////////////////////////////////////////////////////////////
// altremote_update parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altremote_update
#(	parameter	check_app_pof = "false",
	parameter	intended_device_family = "unused",
	parameter	in_data_width = 12,
	parameter	operation_mode = "remote",
	parameter	out_data_width = 12,
	parameter	sim_init_config = "factory",
	parameter	sim_init_page_select = 0,
	parameter	sim_init_status = 0,
	parameter	sim_init_watchdog_value = 0,
	parameter	lpm_type = "altremote_update",
	parameter	lpm_hint = "unused")
(	output	wire	[23:0]	asmi_addr,
	input	wire	asmi_busy,
	input	wire	asmi_data_valid,
	input	wire	[7:0]	asmi_dataout,
	output	wire	asmi_rden,
	output	wire	asmi_read,
	output	wire	busy,
	input	wire	clock,
	input	wire	[in_data_width-1:0]	data_in,
	output	wire	[out_data_width-1:0]	data_out,
	input	wire	[2:0]	param,
	output	wire	[2:0]	pgmout,
	output	wire	pof_error,
	input	wire	read_param,
	input	wire	[1:0]	read_source,
	input	wire	reconfig,
	input	wire	reset,
	input	wire	reset_timer,
	input	wire	write_param)/* synthesis syn_black_box=1 */;

endmodule //altremote_update

//////////////////////////////////////////////////////////////////////////
// altecc_decoder parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altecc_decoder
#(	parameter	intended_device_family = "unused",
	parameter	lpm_pipeline = 0,
	parameter	width_codeword = 8,
	parameter	width_dataword = 8,
	parameter	lpm_type = "altecc_decoder",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clock,
	input	wire	clocken,
	input	wire	[width_codeword-1:0]	data,
	output	wire	err_corrected,
	output	wire	err_detected,
	output	wire	err_fatal,
	output	wire	[width_dataword-1:0]	q)/* synthesis syn_black_box=1 */;

endmodule //altecc_decoder

//////////////////////////////////////////////////////////////////////////
// altotp parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altotp
#(	parameter	intended_device_family = "unused",
	parameter	init_data = "unused",
	parameter	lpm_type = "altotp",
	parameter	lpm_hint = "unused")
(	input	wire	otp_clk,
	input	wire	otp_clken,
	output	wire	otp_dout,
	input	wire	otp_shiftnld)/* synthesis syn_black_box=1 */;

endmodule //altotp

//////////////////////////////////////////////////////////////////////////
// altfp_add_sub parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_add_sub
#(	parameter	denormal_support = "YES",
	parameter	intended_device_family = "unused",
	parameter	direction = "ADD",
	parameter	exception_handling = "YES",
	parameter	optimize = "SPEED",
	parameter	pipeline = 11,
	parameter	reduced_functionality = "NO",
	parameter	rounding = "TO_NEAREST",
	parameter	speed_optimized = "STRATIX_ONLY",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_add_sub",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	add_sub,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	dataa,
	input	wire	[width_exp+width_man+1-1:0]	datab,
	output	wire	denormal,
	output	wire	indefinite,
	output	wire	nan,
	output	wire	overflow,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	underflow,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_add_sub

//////////////////////////////////////////////////////////////////////////
// altddio_out parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altddio_out
#(	parameter	intended_device_family = "unused",
	parameter	extend_oe_disable = "OFF",
	parameter	invert_output = "OFF",
	parameter	oe_reg = "UNREGISTERED",
	parameter	power_up_high = "OFF",
	parameter	width = 1,
	parameter	lpm_type = "altddio_out",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	aset,
	input	wire	[width-1:0]	datain_h,
	input	wire	[width-1:0]	datain_l,
	output	wire	[width-1:0]	dataout,
	input	wire	oe,
	output	wire	[width-1:0]	oe_out,
	input	wire	outclock,
	input	wire	outclocken,
	input	wire	sclr,
	input	wire	sset)/* synthesis syn_black_box=1 */;

endmodule //altddio_out

//////////////////////////////////////////////////////////////////////////
// a_graycounter parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	a_graycounter
#(	parameter	intended_device_family = "unused",
	parameter	pvalue = 0,
	parameter	width = 8,
	parameter	lpm_type = "a_graycounter",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	cnt_en,
	output	wire	[width-1:0]	q,
	output	wire	[width-1:0]	qbin,
	input	wire	sclr,
	input	wire	updown)/* synthesis syn_black_box=1 */;

endmodule //a_graycounter

//////////////////////////////////////////////////////////////////////////
// altasmi_parallel parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altasmi_parallel
#(	parameter	intended_device_family = "unused",
	parameter	epcs_type = "EPCS4",
	parameter	page_size = 1,
	parameter	port_bulk_erase = "PORT_UNUSED",
	parameter	port_fast_read = "PORT_UNUSED",
	parameter	port_illegal_erase = "PORT_UNUSED",
	parameter	port_illegal_write = "PORT_UNUSED",
	parameter	port_rdid_out = "PORT_UNUSED",
	parameter	port_read_address = "PORT_UNUSED",
	parameter	port_read_rdid = "PORT_UNUSED",
	parameter	port_read_sid = "PORT_UNUSED",
	parameter	port_read_status = "PORT_UNUSED",
	parameter	port_sector_erase = "PORT_UNUSED",
	parameter	port_sector_protect = "PORT_UNUSED",
	parameter	port_shift_bytes = "PORT_UNUSED",
	parameter	port_wren = "PORT_UNUSED",
	parameter	port_write = "PORT_UNUSED",
	parameter	use_eab = "ON",
	parameter	lpm_type = "altasmi_parallel",
	parameter	lpm_hint = "unused")
(	input	wire	[23:0]	addr,
	input	wire	bulk_erase,
	output	wire	busy,
	input	wire	clkin,
	output	wire	data_valid,
	input	wire	[7:0]	datain,
	output	wire	[7:0]	dataout,
	output	wire	[7:0]	epcs_id,
	input	wire	fast_read,
	output	wire	illegal_erase,
	output	wire	illegal_write,
	input	wire	rden,
	output	wire	[7:0]	rdid_out,
	input	wire	read,
	output	wire	[23:0]	read_address,
	input	wire	read_rdid,
	input	wire	read_sid,
	input	wire	read_status,
	input	wire	sector_erase,
	input	wire	sector_protect,
	input	wire	shift_bytes,
	output	wire	[7:0]	status_out,
	input	wire	wren,
	input	wire	write)/* synthesis syn_black_box=1 */;

endmodule //altasmi_parallel

//////////////////////////////////////////////////////////////////////////
// altmult_complex parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altmult_complex
#(	parameter	intended_device_family = "unused",
	parameter	implementation_style = "AUTO",
	parameter	pipeline = 4,
	parameter	representation_a = "SIGNED",
	parameter	representation_b = "SIGNED",
	parameter	width_a = 1,
	parameter	width_b = 1,
	parameter	width_result = 1,
	parameter	lpm_type = "altmult_complex",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clock,
	input	wire	complex,
	input	wire	[width_a-1:0]	dataa_imag,
	input	wire	[width_a-1:0]	dataa_real,
	input	wire	[width_b-1:0]	datab_imag,
	input	wire	[width_b-1:0]	datab_real,
	input	wire	ena,
	output	wire	[width_result-1:0]	result_imag,
	output	wire	[width_result-1:0]	result_real)/* synthesis syn_black_box=1 */;

endmodule //altmult_complex

//////////////////////////////////////////////////////////////////////////
// altserial_flash_loader parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altserial_flash_loader
#(	parameter	enable_quad_spi_support = 0,
	parameter	enable_shared_access = "OFF",
	parameter	enhanced_mode = 0,
	parameter	intended_device_family = "Cyclone",
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altserial_flash_loader")
(	input	wire	asmi_access_granted,
	output	wire	asmi_access_request,
	input	wire	data0in,
	input	wire	data0oe,
	output	wire	data0out,
	input	wire	data1in,
	input	wire	data1oe,
	output	wire	data1out,
	input	wire	data2in,
	input	wire	data2oe,
	output	wire	data2out,
	input	wire	data3in,
	input	wire	data3oe,
	output	wire	data3out,
	input	wire	dclkin,
	input	wire	noe,
	input	wire	scein,
	input	wire	sdoin) /* synthesis syn_black_box=1 */;
endmodule // altserial_flash_loader

//////////////////////////////////////////////////////////////////////////
// altfp_matrix_mult parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_matrix_mult
#(	parameter	blocks = 0,
	parameter	cluster = 8,
	parameter	columnsaa = 0,
	parameter	columnsbb = 0,
	parameter	intended_device_family = "unused",
	parameter	rowsaa = 0,
	parameter	vectorsize = 0,
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_matrix_mult",
	parameter	lpm_hint = "unused")
(	input	wire	calcmatrix,
	output	wire	done,
	input	wire	enable,
	input	wire	loadaa,
	input	wire	loadbb,
	input	wire	[width_exp+width_man+1-1:0]	loaddata,
	input	wire	[width_exp+width_man+1-1:0]	loaddataimag,
	input	wire	[width_exp+width_man+1-1:0]	loaddatareal,
	output	wire	[width_exp+width_man+1-1:0]	outdata,
	output	wire	[width_exp+width_man+1-1:0]	outdataimag,
	output	wire	[width_exp+width_man+1-1:0]	outdatareal,
	output	wire	outvalid,
	output	wire	ready,
	input	wire	reset,
	output	wire	[width_exp+width_man+1-1:0]	result,
	input	wire	selbus,
	input	wire	sysclk,
	input	wire	[255:0]	vector_l_data,
	input	wire	[255:0]	vector_m_data)/* synthesis syn_black_box=1 */;

endmodule //altfp_matrix_mult

//////////////////////////////////////////////////////////////////////////
// altstratixii_oct parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altstratixii_oct
#(	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altstratixii_oct")
(	input	wire	rdn,
	input	wire	rup,
	input	wire	terminationclock,
	input	wire	terminationenable) /* synthesis syn_black_box=1 */;
endmodule // altstratixii_oct

//////////////////////////////////////////////////////////////////////////
// altdll parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altdll
#(	parameter	delay_buffer_mode = "low",
	parameter	delay_chain_length = 12,
	parameter	delayctrlout_width = 6,
	parameter	intended_device_family = "unused",
	parameter	dll_offset_ctrl_a_static_offset = "unused",
	parameter	dll_offset_ctrl_a_use_offset = "false",
	parameter	dll_offset_ctrl_b_static_offset = "unused",
	parameter	dll_offset_ctrl_b_use_offset = "false",
	parameter	input_frequency = "unused",
	parameter	jitter_reduction = "false",
	parameter	use_dll_offset_ctrl_a = "false",
	parameter	use_dll_offset_ctrl_b = "false",
	parameter	lpm_type = "altdll",
	parameter	lpm_hint = "unused")
(	input	wire	dll_aload,
	input	wire	[0:0]	dll_clk,
	output	wire	[delayctrlout_width-1:0]	dll_delayctrlout,
	output	wire	dll_dqsupdate,
	input	wire	dll_offset_ctrl_a_addnsub,
	input	wire	[delayctrlout_width-1:0]	dll_offset_ctrl_a_offset,
	output	wire	[delayctrlout_width-1:0]	dll_offset_ctrl_a_offsetctrlout,
	input	wire	dll_offset_ctrl_b_addnsub,
	input	wire	[delayctrlout_width-1:0]	dll_offset_ctrl_b_offset,
	output	wire	[delayctrlout_width-1:0]	dll_offset_ctrl_b_offsetctrlout)/* synthesis syn_black_box=1 */;

endmodule //altdll

//////////////////////////////////////////////////////////////////////////
// altiobuf_out parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altiobuf_out
#(	parameter	intended_device_family = "unused",
	parameter	enable_bus_hold = "FALSE",
	parameter	left_shift_series_termination_control = "FALSE",
	parameter	number_of_channels = 1,
	parameter	open_drain_output = "FALSE",
	parameter	pseudo_differential_mode = "FALSE",
	parameter	use_differential_mode = "FALSE",
	parameter	use_oe = "FALSE",
	parameter	use_out_dynamic_delay_chain1 = "FALSE",
	parameter	use_out_dynamic_delay_chain2 = "FALSE",
	parameter	use_termination_control = "FALSE",
	parameter	width_ptc = 14,
	parameter	width_stc = 14,
	parameter	lpm_type = "altiobuf_out",
	parameter	lpm_hint = "unused")
(	input	wire	[number_of_channels-1:0]	datain,
	output	wire	[number_of_channels-1:0]	dataout,
	output	wire	[number_of_channels-1:0]	dataout_b,
	input	wire	io_config_clk,
	input	wire	[number_of_channels-1:0]	io_config_clkena,
	input	wire	io_config_datain,
	input	wire	io_config_update,
	input	wire	[number_of_channels-1:0]	oe,
	input	wire	[number_of_channels-1:0]	oe_b,
	input	wire	[width_ptc * number_of_channels-1:0]	parallelterminationcontrol,
	input	wire	[width_ptc * number_of_channels-1:0]	parallelterminationcontrol_b,
	input	wire	[width_stc * number_of_channels-1:0]	seriesterminationcontrol,
	input	wire	[width_stc * number_of_channels-1:0]	seriesterminationcontrol_b)/* synthesis syn_black_box=1 */;

endmodule //altiobuf_out

//////////////////////////////////////////////////////////////////////////
// altddio_bidir parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altddio_bidir
#(	parameter	intended_device_family = "unused",
	parameter	extend_oe_disable = "OFF",
	parameter	implement_input_in_lcell = "OFF",
	parameter	invert_output = "OFF",
	parameter	oe_reg = "UNREGISTERED",
	parameter	power_up_high = "OFF",
	parameter	width = 1,
	parameter	lpm_type = "altddio_bidir",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	aset,
	output	wire	[width-1:0]	combout,
	input	wire	[width-1:0]	datain_h,
	input	wire	[width-1:0]	datain_l,
	output	wire	[width-1:0]	dataout_h,
	output	wire	[width-1:0]	dataout_l,
	output	wire	[width-1:0]	dqsundelayedout,
	input	wire	inclock,
	input	wire	inclocken,
	input	wire	oe,
	output	wire	[width-1:0]	oe_out,
	input	wire	outclock,
	input	wire	outclocken,
	inout	wire	[width-1:0]	padio,
	input	wire	sclr,
	input	wire	sset)/* synthesis syn_black_box=1 */;

endmodule //altddio_bidir

//////////////////////////////////////////////////////////////////////////
// altmult_add parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altmult_add
#(	parameter	accum_direction = "ADD",
	parameter	accum_sload_aclr = "ACLR0",
	parameter	accum_sload_pipeline_aclr = "ACLR0",
	parameter	accum_sload_pipeline_register = "CLOCK0",
	parameter	accum_sload_register = "CLOCK0",
	parameter	accumulator = "NO",
	parameter	adder1_rounding = "NO",
	parameter	adder3_rounding = "NO",
	parameter	addnsub1_round_aclr = "ACLR0",
	parameter	addnsub1_round_pipeline_aclr = "ACLR0",
	parameter	addnsub1_round_pipeline_register = "CLOCK0",
	parameter	addnsub1_round_register = "CLOCK0",
	parameter	addnsub3_round_aclr = "ACLR0",
	parameter	addnsub3_round_pipeline_aclr = "ACLR0",
	parameter	addnsub3_round_pipeline_register = "CLOCK0",
	parameter	addnsub3_round_register = "CLOCK0",
	parameter	addnsub_multiplier_aclr1 = "ACLR0",
	parameter	addnsub_multiplier_aclr3 = "ACLR0",
	parameter	addnsub_multiplier_pipeline_aclr1 = "ACLR0",
	parameter	addnsub_multiplier_pipeline_aclr3 = "ACLR0",
	parameter	addnsub_multiplier_pipeline_register1 = "CLOCK0",
	parameter	addnsub_multiplier_pipeline_register3 = "CLOCK0",
	parameter	addnsub_multiplier_register1 = "CLOCK0",
	parameter	addnsub_multiplier_register3 = "CLOCK0",
	parameter	chainout_aclr = "ACLR0",
	parameter	chainout_adder = "NO",
	parameter	chainout_register = "CLOCK0",
	parameter	chainout_round_aclr = "ACLR0",
	parameter	chainout_round_output_aclr = "ACLR0",
	parameter	chainout_round_output_register = "CLOCK0",
	parameter	chainout_round_pipeline_aclr = "ACLR0",
	parameter	chainout_round_pipeline_register = "CLOCK0",
	parameter	chainout_round_register = "CLOCK0",
	parameter	chainout_rounding = "NO",
	parameter	chainout_saturate_aclr = "ACLR0",
	parameter	chainout_saturate_output_aclr = "ACLR0",
	parameter	chainout_saturate_output_register = "CLOCK0",
	parameter	chainout_saturate_pipeline_aclr = "ACLR0",
	parameter	chainout_saturate_pipeline_register = "CLOCK0",
	parameter	chainout_saturate_register = "CLOCK0",
	parameter	chainout_saturation = "NO",
	parameter	coef0_0 = 0,
	parameter	coef0_1 = 0,
	parameter	coef0_2 = 0,
	parameter	coef0_3 = 0,
	parameter	coef0_4 = 0,
	parameter	coef0_5 = 0,
	parameter	coef0_6 = 0,
	parameter	coef0_7 = 0,
	parameter	coef1_0 = 0,
	parameter	coef1_1 = 0,
	parameter	coef1_2 = 0,
	parameter	coef1_3 = 0,
	parameter	coef1_4 = 0,
	parameter	coef1_5 = 0,
	parameter	coef1_6 = 0,
	parameter	coef1_7 = 0,
	parameter	coef2_0 = 0,
	parameter	coef2_1 = 0,
	parameter	coef2_2 = 0,
	parameter	coef2_3 = 0,
	parameter	coef2_4 = 0,
	parameter	coef2_5 = 0,
	parameter	coef2_6 = 0,
	parameter	coef2_7 = 0,
	parameter	coef3_0 = 0,
	parameter	coef3_1 = 0,
	parameter	coef3_2 = 0,
	parameter	coef3_3 = 0,
	parameter	coef3_4 = 0,
	parameter	coef3_5 = 0,
	parameter	coef3_6 = 0,
	parameter	coef3_7 = 0,
	parameter	coefsel0_aclr = "ACLR0",
	parameter	coefsel0_register = "CLOCK0",
	parameter	coefsel1_aclr = "ACLR0",
	parameter	coefsel1_register = "CLOCK0",
	parameter	coefsel2_aclr = "ACLR0",
	parameter	coefsel2_register = "CLOCK0",
	parameter	coefsel3_aclr = "ACLR0",
	parameter	coefsel3_register = "CLOCK0",
	parameter	dedicated_multiplier_circuitry = "AUTO",
	parameter	intended_device_family = "unused",
	parameter	dsp_block_balancing = "Auto",
	parameter	extra_latency = 0,
	parameter	input_aclr_a0 = "ACLR0",
	parameter	input_aclr_a1 = "ACLR0",
	parameter	input_aclr_a2 = "ACLR0",
	parameter	input_aclr_a3 = "ACLR0",
	parameter	input_aclr_b0 = "ACLR0",
	parameter	input_aclr_b1 = "ACLR0",
	parameter	input_aclr_b2 = "ACLR0",
	parameter	input_aclr_b3 = "ACLR0",
	parameter	input_aclr_c0 = "ACLR0",
	parameter	input_aclr_c1 = "ACLR0",
	parameter	input_aclr_c2 = "ACLR0",
	parameter	input_aclr_c3 = "ACLR0",
	parameter	input_register_a0 = "CLOCK0",
	parameter	input_register_a1 = "CLOCK0",
	parameter	input_register_a2 = "CLOCK0",
	parameter	input_register_a3 = "CLOCK0",
	parameter	input_register_b0 = "CLOCK0",
	parameter	input_register_b1 = "CLOCK0",
	parameter	input_register_b2 = "CLOCK0",
	parameter	input_register_b3 = "CLOCK0",
	parameter	input_register_c0 = "CLOCK0",
	parameter	input_register_c1 = "CLOCK0",
	parameter	input_register_c2 = "CLOCK0",
	parameter	input_register_c3 = "CLOCK0",
	parameter	input_source_a0 = "DATAA",
	parameter	input_source_a1 = "DATAA",
	parameter	input_source_a2 = "DATAA",
	parameter	input_source_a3 = "DATAA",
	parameter	input_source_b0 = "DATAB",
	parameter	input_source_b1 = "DATAB",
	parameter	input_source_b2 = "DATAB",
	parameter	input_source_b3 = "DATAB",
	parameter	loadconst_control_aclr = "ACLR0",
	parameter	loadconst_control_register = "CLOCK0",
	parameter	loadconst_value = 64,
	parameter	mult01_round_aclr = "ACLR0",
	parameter	mult01_round_register = "CLOCK0",
	parameter	mult01_saturation_aclr = "ACLR1",
	parameter	mult01_saturation_register = "CLOCK0",
	parameter	mult23_round_aclr = "ACLR0",
	parameter	mult23_round_register = "CLOCK0",
	parameter	mult23_saturation_aclr = "ACLR0",
	parameter	mult23_saturation_register = "CLOCK0",
	parameter	multiplier01_rounding = "NO",
	parameter	multiplier01_saturation = "NO",
	parameter	multiplier1_direction = "ADD",
	parameter	multiplier23_rounding = "NO",
	parameter	multiplier23_saturation = "NO",
	parameter	multiplier3_direction = "ADD",
	parameter	multiplier_aclr0 = "ACLR0",
	parameter	multiplier_aclr1 = "ACLR0",
	parameter	multiplier_aclr2 = "ACLR0",
	parameter	multiplier_aclr3 = "ACLR0",
	parameter	multiplier_register0 = "CLOCK0",
	parameter	multiplier_register1 = "CLOCK0",
	parameter	multiplier_register2 = "CLOCK0",
	parameter	multiplier_register3 = "CLOCK0",
	parameter	number_of_multipliers = 1,
	parameter	output_aclr = "ACLR0",
	parameter	output_register = "CLOCK0",
	parameter	output_round_aclr = "ACLR0",
	parameter	output_round_pipeline_aclr = "ACLR0",
	parameter	output_round_pipeline_register = "CLOCK0",
	parameter	output_round_register = "CLOCK0",
	parameter	output_round_type = "NEAREST_INTEGER",
	parameter	output_rounding = "NO",
	parameter	output_saturate_aclr = "ACLR0",
	parameter	output_saturate_pipeline_aclr = "ACLR0",
	parameter	output_saturate_pipeline_register = "CLOCK0",
	parameter	output_saturate_register = "CLOCK0",
	parameter	output_saturate_type = "ASYMMETRIC",
	parameter	output_saturation = "NO",
	parameter	port_addnsub1 = "PORT_CONNECTIVITY",
	parameter	port_addnsub3 = "PORT_CONNECTIVITY",
	parameter	port_chainout_sat_is_overflow = "PORT_UNUSED",
	parameter	port_mult0_is_saturated = "UNUSED",
	parameter	port_mult1_is_saturated = "UNUSED",
	parameter	port_mult2_is_saturated = "UNUSED",
	parameter	port_mult3_is_saturated = "UNUSED",
	parameter	port_output_is_overflow = "PORT_UNUSED",
	parameter	port_signa = "PORT_CONNECTIVITY",
	parameter	port_signb = "PORT_CONNECTIVITY",
	parameter	preadder_direction_0 = "ADD",
	parameter	preadder_direction_1 = "ADD",
	parameter	preadder_direction_2 = "ADD",
	parameter	preadder_direction_3 = "ADD",
	parameter	preadder_mode = "SIMPLE",
	parameter	representation_a = "UNSIGNED",
	parameter	representation_b = "UNSIGNED",
	parameter	rotate_aclr = "ACLR0",
	parameter	rotate_output_aclr = "ACLR0",
	parameter	rotate_output_register = "CLOCK0",
	parameter	rotate_pipeline_aclr = "ACLR0",
	parameter	rotate_pipeline_register = "CLOCK0",
	parameter	rotate_register = "CLOCK0",
	parameter	scanouta_aclr = "ACLR0",
	parameter	scanouta_register = "UNREGISTERED",
	parameter	shift_mode = "NO",
	parameter	shift_right_aclr = "ACLR0",
	parameter	shift_right_output_aclr = "ACLR0",
	parameter	shift_right_output_register = "CLOCK0",
	parameter	shift_right_pipeline_aclr = "ACLR0",
	parameter	shift_right_pipeline_register = "CLOCK0",
	parameter	shift_right_register = "CLOCK0",
	parameter	signed_aclr_a = "ACLR0",
	parameter	signed_aclr_b = "ACLR0",
	parameter	signed_pipeline_aclr_a = "ACLR0",
	parameter	signed_pipeline_aclr_b = "ACLR0",
	parameter	signed_pipeline_register_a = "CLOCK0",
	parameter	signed_pipeline_register_b = "CLOCK0",
	parameter	signed_register_a = "CLOCK0",
	parameter	signed_register_b = "CLOCK0",
	parameter	systolic_aclr1 = "ACLR0",
	parameter	systolic_aclr3 = "ACLR0",
	parameter	systolic_delay1 = "UNREGISTERED",
	parameter	systolic_delay3 = "UNREGISTERED",
	parameter	width_a = 1,
	parameter	width_b = 1,
	parameter	width_c = 22,
	parameter	width_chainin = 1,
	parameter	width_coef = 18,
	parameter	width_msb = 17,
	parameter	width_result = 1,
	parameter	width_saturate_sign = 1,
	parameter	zero_chainout_output_aclr = "ACLR0",
	parameter	zero_chainout_output_register = "CLOCK0",
	parameter	zero_loopback_aclr = "ACLR0",
	parameter	zero_loopback_output_aclr = "ACLR0",
	parameter	zero_loopback_output_register = "CLOCK0",
	parameter	zero_loopback_pipeline_aclr = "ACLR0",
	parameter	zero_loopback_pipeline_register = "CLOCK0",
	parameter	zero_loopback_register = "CLOCK0",
	parameter	lpm_type = "altmult_add",
	parameter	lpm_hint = "unused")
(	input	wire	accum_sload,
	input	wire	aclr0,
	input	wire	aclr1,
	input	wire	aclr2,
	input	wire	aclr3,
	input	wire	addnsub1,
	input	wire	addnsub1_round,
	input	wire	addnsub3,
	input	wire	addnsub3_round,
	input	wire	[width_chainin-1:0]	chainin,
	input	wire	chainout_round,
	output	wire	chainout_sat_overflow,
	input	wire	chainout_saturate,
	input	wire	clock0,
	input	wire	clock1,
	input	wire	clock2,
	input	wire	clock3,
	input	wire	[2:0]	coefsel0,
	input	wire	[2:0]	coefsel1,
	input	wire	[2:0]	coefsel2,
	input	wire	[2:0]	coefsel3,
	input	wire	[width_a*number_of_multipliers-1:0]	dataa,
	input	wire	[width_b*number_of_multipliers-1:0]	datab,
	input	wire	[width_c-1:0]	datac,
	input	wire	ena0,
	input	wire	ena1,
	input	wire	ena2,
	input	wire	ena3,
	input	wire	mult01_round,
	input	wire	mult01_saturation,
	output	wire	mult0_is_saturated,
	output	wire	mult1_is_saturated,
	input	wire	mult23_round,
	input	wire	mult23_saturation,
	output	wire	mult2_is_saturated,
	output	wire	mult3_is_saturated,
	input	wire	output_round,
	input	wire	output_saturate,
	output	wire	overflow,
	output	wire	[width_result-1:0]	result,
	input	wire	rotate,
	input	wire	[width_a-1:0]	scanina,
	input	wire	[width_b-1:0]	scaninb,
	output	wire	[width_a-1:0]	scanouta,
	output	wire	[width_b-1:0]	scanoutb,
	input	wire	shift_right,
	input	wire	signa,
	input	wire	signb,
	input	wire	[number_of_multipliers-1:0]	sourcea,
	input	wire	[number_of_multipliers-1:0]	sourceb,
	input	wire	zero_chainout,
	input	wire	zero_loopback)/* synthesis syn_black_box=1 */;

endmodule //altmult_add

//////////////////////////////////////////////////////////////////////////
// altecc_encoder parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altecc_encoder
#(	parameter	intended_device_family = "unused",
	parameter	lpm_pipeline = 0,
	parameter	width_codeword = 8,
	parameter	width_dataword = 8,
	parameter	lpm_type = "altecc_encoder",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clock,
	input	wire	clocken,
	input	wire	[width_dataword-1:0]	data,
	output	wire	[width_codeword-1:0]	q)/* synthesis syn_black_box=1 */;

endmodule //altecc_encoder

//////////////////////////////////////////////////////////////////////////
// altdq parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altdq
#(	parameter	ddioinclk_input = "NEGATED_INCLK",
	parameter	intended_device_family = "unused",
	parameter	extend_oe_disable = "OFF",
	parameter	invert_input_clocks = "ON",
	parameter	number_of_dq = 1,
	parameter	oe_reg = "UNREGISTERED",
	parameter	power_up_high = "OFF",
	parameter	lpm_type = "altdq",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	aset,
	input	wire	[number_of_dq-1:0]	datain_h,
	input	wire	[number_of_dq-1:0]	datain_l,
	output	wire	[number_of_dq-1:0]	dataout_h,
	output	wire	[number_of_dq-1:0]	dataout_l,
	input	wire	ddioinclk,
	input	wire	inclock,
	input	wire	inclocken,
	input	wire	oe,
	input	wire	outclock,
	input	wire	outclocken,
	inout	wire	[number_of_dq-1:0]	padio)/* synthesis syn_black_box=1 */;

endmodule //altdq

//////////////////////////////////////////////////////////////////////////
// dcfifo_mixed_widths parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	dcfifo_mixed_widths
#(	parameter	add_ram_output_register = "OFF",
	parameter	add_usedw_msb_bit = "OFF",
	parameter	clocks_are_synchronized = "FALSE",
	parameter	delay_rdusedw = 1,
	parameter	delay_wrusedw = 1,
	parameter	intended_device_family = "unused",
	parameter	lpm_numwords = 1,
	parameter	lpm_showahead = "OFF",
	parameter	lpm_width = 1,
	parameter	lpm_width_r = 0,
	parameter	lpm_widthu = 1,
	parameter	lpm_widthu_r = 1,
	parameter	overflow_checking = "ON",
	parameter	rdsync_delaypipe = 0,
	parameter	underflow_checking = "ON",
	parameter	use_eab = "ON",
	parameter	write_aclr_synch = "OFF",
	parameter	wrsync_delaypipe = 0,
	parameter	lpm_type = "dcfifo_mixed_widths",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	[lpm_width-1:0]	data,
	output	wire	[lpm_width_r-1:0]	q,
	input	wire	rdclk,
	output	wire	rdempty,
	output	wire	rdfull,
	input	wire	rdreq,
	output	wire	[lpm_widthu_r-1:0]	rdusedw,
	input	wire	wrclk,
	output	wire	wrempty,
	output	wire	wrfull,
	input	wire	wrreq,
	output	wire	[lpm_widthu-1:0]	wrusedw)/* synthesis syn_black_box=1 */;

endmodule //dcfifo_mixed_widths

//////////////////////////////////////////////////////////////////////////
// altufm_i2c parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altufm_i2c
#(	parameter	access_mode = "READ_WRITE",
	parameter	intended_device_family = "unused",
	parameter	erase_method = "MEM_ADD",
	parameter	erase_time = 500000000,
	parameter	fixed_device_add = "UNUSED",
	parameter	lpm_file = "UNUSED",
	parameter	mem_add_erase0 = "UNUSED",
	parameter	mem_add_erase1 = "UNUSED",
	parameter	mem_protect = "FULL",
	parameter	memory_size = "4K",
	parameter	osc_frequency = 180000,
	parameter	page_write_size = 16,
	parameter	port_global_reset = "PORT_UNUSED",
	parameter	program_time = 1600000,
	parameter	write_mode = "SINGLE_BYTE",
	parameter	lpm_type = "altufm_i2c",
	parameter	lpm_hint = "unused")
(	input	wire	a0,
	input	wire	a1,
	input	wire	a2,
	input	wire	global_reset,
	output	wire	osc,
	input	wire	oscena,
	inout	wire	scl,
	inout	wire	sda,
	input	wire	wp)/* synthesis syn_black_box=1 */;

endmodule //altufm_i2c

//////////////////////////////////////////////////////////////////////////
// altfp_sincos parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_sincos
#(	parameter	cordic_depth = 0,
	parameter	cordic_width = 0,
	parameter	intended_device_family = "unused",
	parameter	indexpoint = 0,
	parameter	operation = "unused",
	parameter	pipeline = 20,
	parameter	rounding = "TO_NEAREST",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_sincos",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	data,
	output	wire	nan,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_sincos

//////////////////////////////////////////////////////////////////////////
// altpll parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altpll
#(	parameter	bandwidth = 0,
	parameter	bandwidth_type = "AUTO",
	parameter	c0_high = 0,
	parameter	c0_initial = 0,
	parameter	c0_low = 0,
	parameter	c0_mode = "BYPASS",
	parameter	c0_ph = 0,
	parameter	c0_test_source = 5,
	parameter	c1_high = 0,
	parameter	c1_initial = 0,
	parameter	c1_low = 0,
	parameter	c1_mode = "BYPASS",
	parameter	c1_ph = 0,
	parameter	c1_test_source = 5,
	parameter	c1_use_casc_in = "OFF",
	parameter	c2_high = 0,
	parameter	c2_initial = 0,
	parameter	c2_low = 0,
	parameter	c2_mode = "BYPASS",
	parameter	c2_ph = 0,
	parameter	c2_test_source = 5,
	parameter	c2_use_casc_in = "OFF",
	parameter	c3_high = 0,
	parameter	c3_initial = 0,
	parameter	c3_low = 0,
	parameter	c3_mode = "BYPASS",
	parameter	c3_ph = 0,
	parameter	c3_test_source = 5,
	parameter	c3_use_casc_in = "OFF",
	parameter	c4_high = 0,
	parameter	c4_initial = 0,
	parameter	c4_low = 0,
	parameter	c4_mode = "BYPASS",
	parameter	c4_ph = 0,
	parameter	c4_test_source = 5,
	parameter	c4_use_casc_in = "OFF",
	parameter	c5_high = 0,
	parameter	c5_initial = 0,
	parameter	c5_low = 0,
	parameter	c5_mode = "BYPASS",
	parameter	c5_ph = 0,
	parameter	c5_test_source = 5,
	parameter	c5_use_casc_in = "OFF",
	parameter	c6_high = 0,
	parameter	c6_initial = 0,
	parameter	c6_low = 0,
	parameter	c6_mode = "BYPASS",
	parameter	c6_ph = 0,
	parameter	c6_test_source = 5,
	parameter	c6_use_casc_in = "OFF",
	parameter	c7_high = 0,
	parameter	c7_initial = 0,
	parameter	c7_low = 0,
	parameter	c7_mode = "BYPASS",
	parameter	c7_ph = 0,
	parameter	c7_test_source = 5,
	parameter	c7_use_casc_in = "OFF",
	parameter	c8_high = 0,
	parameter	c8_initial = 0,
	parameter	c8_low = 0,
	parameter	c8_mode = "BYPASS",
	parameter	c8_ph = 0,
	parameter	c8_test_source = 5,
	parameter	c8_use_casc_in = "OFF",
	parameter	c9_high = 0,
	parameter	c9_initial = 0,
	parameter	c9_low = 0,
	parameter	c9_mode = "BYPASS",
	parameter	c9_ph = 0,
	parameter	c9_test_source = 5,
	parameter	c9_use_casc_in = "OFF",
	parameter	charge_pump_current = 2,
	parameter	charge_pump_current_bits = 9999,
	parameter	clk0_counter = "G0",
	parameter	clk0_divide_by = 1,
	parameter	clk0_duty_cycle = 50,
	parameter	clk0_multiply_by = 1,
	parameter	clk0_output_frequency = 0,
	parameter	clk0_phase_shift = "0",
	parameter	clk0_time_delay = "0",
	parameter	clk0_use_even_counter_mode = "OFF",
	parameter	clk0_use_even_counter_value = "OFF",
	parameter	clk1_counter = "G0",
	parameter	clk1_divide_by = 1,
	parameter	clk1_duty_cycle = 50,
	parameter	clk1_multiply_by = 1,
	parameter	clk1_output_frequency = 0,
	parameter	clk1_phase_shift = "0",
	parameter	clk1_time_delay = "0",
	parameter	clk1_use_even_counter_mode = "OFF",
	parameter	clk1_use_even_counter_value = "OFF",
	parameter	clk2_counter = "G0",
	parameter	clk2_divide_by = 1,
	parameter	clk2_duty_cycle = 50,
	parameter	clk2_multiply_by = 1,
	parameter	clk2_output_frequency = 0,
	parameter	clk2_phase_shift = "0",
	parameter	clk2_time_delay = "0",
	parameter	clk2_use_even_counter_mode = "OFF",
	parameter	clk2_use_even_counter_value = "OFF",
	parameter	clk3_counter = "G0",
	parameter	clk3_divide_by = 1,
	parameter	clk3_duty_cycle = 50,
	parameter	clk3_multiply_by = 1,
	parameter	clk3_phase_shift = "0",
	parameter	clk3_time_delay = "0",
	parameter	clk3_use_even_counter_mode = "OFF",
	parameter	clk3_use_even_counter_value = "OFF",
	parameter	clk4_counter = "G0",
	parameter	clk4_divide_by = 1,
	parameter	clk4_duty_cycle = 50,
	parameter	clk4_multiply_by = 1,
	parameter	clk4_phase_shift = "0",
	parameter	clk4_time_delay = "0",
	parameter	clk4_use_even_counter_mode = "OFF",
	parameter	clk4_use_even_counter_value = "OFF",
	parameter	clk5_counter = "G0",
	parameter	clk5_divide_by = 1,
	parameter	clk5_duty_cycle = 50,
	parameter	clk5_multiply_by = 1,
	parameter	clk5_phase_shift = "0",
	parameter	clk5_time_delay = "0",
	parameter	clk5_use_even_counter_mode = "OFF",
	parameter	clk5_use_even_counter_value = "OFF",
	parameter	clk6_counter = "E0",
	parameter	clk6_divide_by = 0,
	parameter	clk6_duty_cycle = 50,
	parameter	clk6_multiply_by = 0,
	parameter	clk6_phase_shift = "0",
	parameter	clk6_use_even_counter_mode = "OFF",
	parameter	clk6_use_even_counter_value = "OFF",
	parameter	clk7_counter = "E1",
	parameter	clk7_divide_by = 0,
	parameter	clk7_duty_cycle = 50,
	parameter	clk7_multiply_by = 0,
	parameter	clk7_phase_shift = "0",
	parameter	clk7_use_even_counter_mode = "OFF",
	parameter	clk7_use_even_counter_value = "OFF",
	parameter	clk8_counter = "E2",
	parameter	clk8_divide_by = 0,
	parameter	clk8_duty_cycle = 50,
	parameter	clk8_multiply_by = 0,
	parameter	clk8_phase_shift = "0",
	parameter	clk8_use_even_counter_mode = "OFF",
	parameter	clk8_use_even_counter_value = "OFF",
	parameter	clk9_counter = "E3",
	parameter	clk9_divide_by = 0,
	parameter	clk9_duty_cycle = 50,
	parameter	clk9_multiply_by = 0,
	parameter	clk9_phase_shift = "0",
	parameter	clk9_use_even_counter_mode = "OFF",
	parameter	clk9_use_even_counter_value = "OFF",
	parameter	compensate_clock = "CLK0",
	parameter	down_spread = "0",
	parameter	dpa_divide_by = 1,
	parameter	dpa_divider = 0,
	parameter	dpa_multiply_by = 0,
	parameter	e0_high = 1,
	parameter	e0_initial = 1,
	parameter	e0_low = 1,
	parameter	e0_mode = "BYPASS",
	parameter	e0_ph = 0,
	parameter	e0_time_delay = 0,
	parameter	e1_high = 1,
	parameter	e1_initial = 1,
	parameter	e1_low = 1,
	parameter	e1_mode = "BYPASS",
	parameter	e1_ph = 0,
	parameter	e1_time_delay = 0,
	parameter	e2_high = 1,
	parameter	e2_initial = 1,
	parameter	e2_low = 1,
	parameter	e2_mode = "BYPASS",
	parameter	e2_ph = 0,
	parameter	e2_time_delay = 0,
	parameter	e3_high = 1,
	parameter	e3_initial = 1,
	parameter	e3_low = 1,
	parameter	e3_mode = "BYPASS",
	parameter	e3_ph = 0,
	parameter	e3_time_delay = 0,
	parameter	enable0_counter = "L0",
	parameter	enable1_counter = "L0",
	parameter	enable_switch_over_counter = "OFF",
	parameter	extclk0_counter = "E0",
	parameter	extclk0_divide_by = 1,
	parameter	extclk0_duty_cycle = 50,
	parameter	extclk0_multiply_by = 1,
	parameter	extclk0_phase_shift = "0",
	parameter	extclk0_time_delay = "0",
	parameter	extclk1_counter = "E1",
	parameter	extclk1_divide_by = 1,
	parameter	extclk1_duty_cycle = 50,
	parameter	extclk1_multiply_by = 1,
	parameter	extclk1_phase_shift = "0",
	parameter	extclk1_time_delay = "0",
	parameter	extclk2_counter = "E2",
	parameter	extclk2_divide_by = 1,
	parameter	extclk2_duty_cycle = 50,
	parameter	extclk2_multiply_by = 1,
	parameter	extclk2_phase_shift = "0",
	parameter	extclk2_time_delay = "0",
	parameter	extclk3_counter = "E3",
	parameter	extclk3_divide_by = 1,
	parameter	extclk3_duty_cycle = 50,
	parameter	extclk3_multiply_by = 1,
	parameter	extclk3_phase_shift = "0",
	parameter	extclk3_time_delay = "0",
	parameter	feedback_source = "EXTCLK0",
	parameter	g0_high = 1,
	parameter	g0_initial = 1,
	parameter	g0_low = 1,
	parameter	g0_mode = "BYPASS",
	parameter	g0_ph = 0,
	parameter	g0_time_delay = 0,
	parameter	g1_high = 1,
	parameter	g1_initial = 1,
	parameter	g1_low = 1,
	parameter	g1_mode = "BYPASS",
	parameter	g1_ph = 0,
	parameter	g1_time_delay = 0,
	parameter	g2_high = 1,
	parameter	g2_initial = 1,
	parameter	g2_low = 1,
	parameter	g2_mode = "BYPASS",
	parameter	g2_ph = 0,
	parameter	g2_time_delay = 0,
	parameter	g3_high = 1,
	parameter	g3_initial = 1,
	parameter	g3_low = 1,
	parameter	g3_mode = "BYPASS",
	parameter	g3_ph = 0,
	parameter	g3_time_delay = 0,
	parameter	gate_lock_counter = 0,
	parameter	gate_lock_signal = "NO",
	parameter	inclk0_input_frequency = 1,
	parameter	inclk1_input_frequency = 0,
	parameter	intended_device_family = "NONE",
	parameter	invalid_lock_multiplier = 5,
	parameter	l0_high = 1,
	parameter	l0_initial = 1,
	parameter	l0_low = 1,
	parameter	l0_mode = "BYPASS",
	parameter	l0_ph = 0,
	parameter	l0_time_delay = 0,
	parameter	l1_high = 1,
	parameter	l1_initial = 1,
	parameter	l1_low = 1,
	parameter	l1_mode = "BYPASS",
	parameter	l1_ph = 0,
	parameter	l1_time_delay = 0,
	parameter	lock_high = 1,
	parameter	lock_low = 1,
	parameter	lock_window_ui = " 0.05",
	parameter	lock_window_ui_bits = "UNUSED",
	parameter	loop_filter_c = 5,
	parameter	loop_filter_c_bits = 9999,
	parameter	loop_filter_r = " 1.000000",
	parameter	loop_filter_r_bits = 9999,
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altpll",
	parameter	m = 0,
	parameter	m2 = 1,
	parameter	m_initial = 0,
	parameter	m_ph = 0,
	parameter	m_test_source = 5,
	parameter	m_time_delay = 0,
	parameter	n = 1,
	parameter	n2 = 1,
	parameter	n_time_delay = 0,
	parameter	operation_mode = "unused",
	parameter	pfd_max = 0,
	parameter	pfd_min = 0,
	parameter	pll_type = "AUTO",
	parameter	port_activeclock = "PORT_CONNECTIVITY",
	parameter	port_areset = "PORT_CONNECTIVITY",
	parameter	port_clk0 = "PORT_CONNECTIVITY",
	parameter	port_clk1 = "PORT_CONNECTIVITY",
	parameter	port_clk2 = "PORT_CONNECTIVITY",
	parameter	port_clk3 = "PORT_CONNECTIVITY",
	parameter	port_clk4 = "PORT_CONNECTIVITY",
	parameter	port_clk5 = "PORT_CONNECTIVITY",
	parameter	port_clk6 = "PORT_UNUSED",
	parameter	port_clk7 = "PORT_UNUSED",
	parameter	port_clk8 = "PORT_UNUSED",
	parameter	port_clk9 = "PORT_UNUSED",
	parameter	port_clkbad0 = "PORT_CONNECTIVITY",
	parameter	port_clkbad1 = "PORT_CONNECTIVITY",
	parameter	port_clkena0 = "PORT_CONNECTIVITY",
	parameter	port_clkena1 = "PORT_CONNECTIVITY",
	parameter	port_clkena2 = "PORT_CONNECTIVITY",
	parameter	port_clkena3 = "PORT_CONNECTIVITY",
	parameter	port_clkena4 = "PORT_CONNECTIVITY",
	parameter	port_clkena5 = "PORT_CONNECTIVITY",
	parameter	port_clkloss = "PORT_CONNECTIVITY",
	parameter	port_clkswitch = "PORT_CONNECTIVITY",
	parameter	port_configupdate = "PORT_CONNECTIVITY",
	parameter	port_enable0 = "PORT_CONNECTIVITY",
	parameter	port_enable1 = "PORT_CONNECTIVITY",
	parameter	port_extclk0 = "PORT_CONNECTIVITY",
	parameter	port_extclk1 = "PORT_CONNECTIVITY",
	parameter	port_extclk2 = "PORT_CONNECTIVITY",
	parameter	port_extclk3 = "PORT_CONNECTIVITY",
	parameter	port_extclkena0 = "PORT_CONNECTIVITY",
	parameter	port_extclkena1 = "PORT_CONNECTIVITY",
	parameter	port_extclkena2 = "PORT_CONNECTIVITY",
	parameter	port_extclkena3 = "PORT_CONNECTIVITY",
	parameter	port_fbin = "PORT_CONNECTIVITY",
	parameter	port_fbout = "PORT_CONNECTIVITY",
	parameter	port_inclk0 = "PORT_CONNECTIVITY",
	parameter	port_inclk1 = "PORT_CONNECTIVITY",
	parameter	port_locked = "PORT_CONNECTIVITY",
	parameter	port_pfdena = "PORT_CONNECTIVITY",
	parameter	port_phasecounterselect = "PORT_CONNECTIVITY",
	parameter	port_phasedone = "PORT_CONNECTIVITY",
	parameter	port_phasestep = "PORT_CONNECTIVITY",
	parameter	port_phaseupdown = "PORT_CONNECTIVITY",
	parameter	port_pllena = "PORT_CONNECTIVITY",
	parameter	port_scanaclr = "PORT_CONNECTIVITY",
	parameter	port_scanclk = "PORT_CONNECTIVITY",
	parameter	port_scanclkena = "PORT_CONNECTIVITY",
	parameter	port_scandata = "PORT_CONNECTIVITY",
	parameter	port_scandataout = "PORT_CONNECTIVITY",
	parameter	port_scandone = "PORT_CONNECTIVITY",
	parameter	port_scanread = "PORT_CONNECTIVITY",
	parameter	port_scanwrite = "PORT_CONNECTIVITY",
	parameter	port_sclkout0 = "PORT_CONNECTIVITY",
	parameter	port_sclkout1 = "PORT_CONNECTIVITY",
	parameter	port_vcooverrange = "PORT_CONNECTIVITY",
	parameter	port_vcounderrange = "PORT_CONNECTIVITY",
	parameter	primary_clock = "INCLK0",
	parameter	qualify_conf_done = "OFF",
	parameter	scan_chain = "LONG",
	parameter	scan_chain_mif_file = "UNUSED",
	parameter	sclkout0_phase_shift = "0",
	parameter	sclkout1_phase_shift = "0",
	parameter	self_reset_on_gated_loss_lock = "OFF",
	parameter	self_reset_on_loss_lock = "OFF",
	parameter	sim_gate_lock_device_behavior = "OFF",
	parameter	skip_vco = "OFF",
	parameter	spread_frequency = 0,
	parameter	ss = 1,
	parameter	switch_over_counter = 0,
	parameter	switch_over_on_gated_lock = "OFF",
	parameter	switch_over_on_lossclk = "OFF",
	parameter	switch_over_type = "AUTO",
	parameter	using_fbmimicbidir_port = "OFF",
	parameter	valid_lock_multiplier = 1,
	parameter	vco_center = 0,
	parameter	vco_divide_by = 0,
	parameter	vco_frequency_control = "AUTO",
	parameter	vco_max = 0,
	parameter	vco_min = 0,
	parameter	vco_multiply_by = 0,
	parameter	vco_phase_shift_step = 0,
	parameter	vco_post_scale = 0,
	parameter	vco_range_detector_high_bits = "UNUSED",
	parameter	vco_range_detector_low_bits = "UNUSED",
	parameter	width_clock = 6,
	parameter	width_phasecounterselect = 4)
(	output	wire	activeclock,
	input	wire	areset,
	output	wire	[width_clock-1:0]	clk,
	output	wire	[1:0]	clkbad,
	input	wire	[5:0]	clkena,
	output	wire	clkloss,
	input	wire	clkswitch,
	input	wire	configupdate,
	output	wire	enable0,
	output	wire	enable1,
	output	wire	[3:0]	extclk,
	input	wire	[3:0]	extclkena,
	input	wire	fbin,
	inout	wire	fbmimicbidir,
	output	wire	fbout,
	output	wire	fref,
	output	wire	icdrclk,
	input	wire	[1:0]	inclk,
	output	wire	locked,
	input	wire	pfdena,
	input	wire	[width_phasecounterselect-1:0]	phasecounterselect,
	output	wire	phasedone,
	input	wire	phasestep,
	input	wire	phaseupdown,
	input	wire	pllena,
	input	wire	scanaclr,
	input	wire	scanclk,
	input	wire	scanclkena,
	input	wire	scandata,
	output	wire	scandataout,
	output	wire	scandone,
	input	wire	scanread,
	input	wire	scanwrite,
	output	wire	sclkout0,
	output	wire	sclkout1,
	output	wire	vcooverrange,
	output	wire	vcounderrange) /* synthesis syn_black_box=1 */;
endmodule // altpll

//////////////////////////////////////////////////////////////////////////
// altufm_none parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altufm_none
#(	parameter	intended_device_family = "unused",
	parameter	erase_time = 500000000,
	parameter	lpm_file = "UNUSED",
	parameter	osc_frequency = 180000,
	parameter	port_arclkena = "PORT_UNUSED",
	parameter	port_drclkena = "PORT_UNUSED",
	parameter	program_time = 1600000,
	parameter	width_ufm_address = 9,
	parameter	lpm_type = "altufm_none",
	parameter	lpm_hint = "unused")
(	input	wire	arclk,
	input	wire	arclkena,
	input	wire	ardin,
	input	wire	arshft,
	output	wire	busy,
	input	wire	drclk,
	input	wire	drclkena,
	input	wire	drdin,
	output	wire	drdout,
	input	wire	drshft,
	input	wire	erase,
	output	wire	osc,
	input	wire	oscena,
	input	wire	program,
	output	wire	rtpbusy)/* synthesis syn_black_box=1 */;

endmodule //altufm_none

//////////////////////////////////////////////////////////////////////////
// scfifo parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	scfifo
#(	parameter	add_ram_output_register = "OFF",
	parameter	allow_rwcycle_when_full = "OFF",
	parameter	almost_empty_value = 0,
	parameter	almost_full_value = 0,
	parameter	intended_device_family = "unused",
	parameter	lpm_numwords = 1,
	parameter	lpm_showahead = "OFF",
	parameter	lpm_width = 1,
	parameter	lpm_widthu = 1,
	parameter	overflow_checking = "ON",
	parameter	underflow_checking = "ON",
	parameter	use_eab = "ON",
	parameter	lpm_type = "scfifo",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	output	wire	almost_empty,
	output	wire	almost_full,
	input	wire	clock,
	input	wire	[lpm_width-1:0]	data,
	output	wire	empty,
	output	wire	full,
	output	wire	[lpm_width-1:0]	q,
	input	wire	rdreq,
	input	wire	sclr,
	output	wire	[lpm_widthu-1:0]	usedw,
	input	wire	wrreq)/* synthesis syn_black_box=1 */;

endmodule //scfifo

//////////////////////////////////////////////////////////////////////////
// altsquare parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altsquare
#(	parameter	data_width = 1,
	parameter	intended_device_family = "unused",
	parameter	pipeline = 1,
	parameter	representation = "UNSIGNED",
	parameter	result_alignment = "LSB",
	parameter	result_width = 1,
	parameter	lpm_type = "altsquare",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clock,
	input	wire	[data_width-1:0]	data,
	input	wire	ena,
	output	wire	[result_width-1:0]	result)/* synthesis syn_black_box=1 */;

endmodule //altsquare

//////////////////////////////////////////////////////////////////////////
// sld_virtual_jtag_basic parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module sld_virtual_jtag_basic
#(	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "sld_virtual_jtag_basic",
	parameter	sld_auto_instance_index = "NO",
	parameter	sld_instance_index = 0,
	parameter	sld_ir_width = 1,
	parameter	sld_mfg_id = 0,
	parameter	sld_sim_action = "UNUSED",
	parameter	sld_sim_n_scan = 0,
	parameter	sld_sim_total_length = 0,
	parameter	sld_type_id = 0,
	parameter	sld_version = 0)
(	output	wire	[sld_ir_width-1:0]	ir_in,
	input	wire	[sld_ir_width-1:0]	ir_out,
	output	wire	jtag_state_cdr,
	output	wire	jtag_state_cir,
	output	wire	jtag_state_e1dr,
	output	wire	jtag_state_e1ir,
	output	wire	jtag_state_e2dr,
	output	wire	jtag_state_e2ir,
	output	wire	jtag_state_pdr,
	output	wire	jtag_state_pir,
	output	wire	jtag_state_rti,
	output	wire	jtag_state_sdr,
	output	wire	jtag_state_sdrs,
	output	wire	jtag_state_sir,
	output	wire	jtag_state_sirs,
	output	wire	jtag_state_tlr,
	output	wire	jtag_state_udr,
	output	wire	jtag_state_uir,
	output	wire	tck,
	output	wire	tdi,
	input	wire	tdo,
	output	wire	tms,
	output	wire	virtual_state_cdr,
	output	wire	virtual_state_cir,
	output	wire	virtual_state_e1dr,
	output	wire	virtual_state_e2dr,
	output	wire	virtual_state_pdr,
	output	wire	virtual_state_sdr,
	output	wire	virtual_state_udr,
	output	wire	virtual_state_uir) /* synthesis syn_black_box=1 */;
endmodule // sld_virtual_jtag_basic

//////////////////////////////////////////////////////////////////////////
// alt_adv_seu_detection parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module alt_adv_seu_detection(
	clk,
	crcerror_core,
	crcerror_pin,
	critical_error,
	mem_addr,
	mem_bytesel,
	mem_critical,
	mem_data,
	mem_rd,
	mem_wait,
	noncritical_error,
	nreset) /* synthesis syn_black_box=1 */;

	parameter	cache_depth = 10;
	parameter	clock_frequency = 50;
	parameter	enable_virtual_jtag = 1;
	parameter	error_clock_divisor = 2;
	parameter	error_delay_cycles = 0;
	parameter	intended_device_family = "UNUSED";
	parameter	lpm_hint = "UNUSED";
	parameter	lpm_type = "alt_adv_seu_detection";
	parameter	mem_addr_width = 32;
	parameter	start_address = 0;

	localparam	mem_data_width = 32;

	input	clk;
	output	crcerror_core;
	output	crcerror_pin;
	output	critical_error;
	output	[mem_addr_width-1:0]	mem_addr;
	output	[3:0]	mem_bytesel;
	input	mem_critical;
	input	[mem_data_width-1:0]	mem_data;
	output	mem_rd;
	input	mem_wait;
	output	noncritical_error;
	input	nreset;

endmodule // alt_adv_seu_detection

//////////////////////////////////////////////////////////////////////////
// altmem_init parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altmem_init
#(	parameter	intended_device_family = "unused",
	parameter	init_file = "UNUSED",
	parameter	init_to_zero = "YES",
	parameter	numwords = 16,
	parameter	port_rom_data_ready = "PORT_UNUSED",
	parameter	rom_read_latency = 1,
	parameter	width = 1,
	parameter	widthad = 1,
	parameter	lpm_type = "altmem_init",
	parameter	lpm_hint = "unused")
(	input	wire	clken,
	input	wire	clock,
	input	wire	[width-1:0]	datain,
	output	wire	[width-1:0]	dataout,
	input	wire	init,
	output	wire	init_busy,
	output	wire	[widthad-1:0]	ram_address,
	output	wire	ram_wren,
	output	wire	[widthad-1:0]	rom_address,
	input	wire	rom_data_ready,
	output	wire	rom_rden)/* synthesis syn_black_box=1 */;

endmodule //altmem_init

//////////////////////////////////////////////////////////////////////////
// altlvds_tx parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altlvds_tx
#(	parameter	center_align_msb = "UNUSED",
	parameter	common_rx_tx_pll = "ON",
	parameter	coreclock_divide_by = 2,
	parameter	data_rate = "UNUSED",
	parameter	deserialization_factor = 4,
	parameter	intended_device_family = "unused",
	parameter	differential_drive = 0,
	parameter	implement_in_les = "OFF",
	parameter	inclock_boost = 0,
	parameter	inclock_data_alignment = "EDGE_ALIGNED",
	parameter	inclock_period = 0,
	parameter	inclock_phase_shift = 0,
	parameter	multi_clock = "OFF",
	parameter	number_of_channels = 1,
	parameter	outclock_alignment = "EDGE_ALIGNED",
	parameter	outclock_divide_by = 1,
	parameter	outclock_duty_cycle = 50,
	parameter	outclock_multiply_by = 1,
	parameter	outclock_phase_shift = 0,
	parameter	outclock_resource = "AUTO",
	parameter	output_data_rate = 0,
	parameter	pll_self_reset_on_loss_lock = "OFF",
	parameter	preemphasis_setting = 0,
	parameter	refclk_frequency = "UNUSED",
	parameter	registered_input = "ON",
	parameter	use_external_pll = "OFF",
	parameter	use_no_phase_shift = "ON",
	parameter	vod_setting = 0,
	parameter	lpm_type = "altlvds_tx",
	parameter	lpm_hint = "unused")
(	input	wire	pll_areset,
	input	wire	sync_inclock,
	output	wire	tx_coreclock,
	input	wire	tx_data_reset,
	input	wire	tx_enable,
	input	wire	[deserialization_factor*number_of_channels-1:0]	tx_in,
	input	wire	tx_inclock,
	output	wire	tx_locked,
	output	wire	[number_of_channels-1:0]	tx_out,
	output	wire	tx_outclock,
	input	wire	tx_pll_enable,
	input	wire	tx_syncclock)/* synthesis syn_black_box=1 */;

endmodule //altlvds_tx

//////////////////////////////////////////////////////////////////////////
// altfp_inv parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_inv
#(	parameter	intended_device_family = "unused",
	parameter	pipeline = 20,
	parameter	rounding = "TO_NEAREST",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_inv",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	data,
	output	wire	division_by_zero,
	output	wire	nan,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	underflow,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_inv

//////////////////////////////////////////////////////////////////////////
// altufm_osc parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altufm_osc
#(	parameter	osc_frequency = 180000,
	parameter	lpm_type = "altufm_osc",
	parameter	lpm_hint = "unused")
(	output	wire	osc,
	input	wire	oscena)/* synthesis syn_black_box=1 */;

endmodule //altufm_osc

//////////////////////////////////////////////////////////////////////////
// alt3pram parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module alt3pram
#(	parameter	indata_aclr = "ON",
	parameter	indata_reg = "INCLOCK",
	parameter	intended_device_family = "unused",
	parameter	lpm_file = "UNUSED",
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "alt3pram",
	parameter	maximum_depth = 0,
	parameter	numwords = 0,
	parameter	outdata_aclr_a = "ON",
	parameter	outdata_aclr_b = "ON",
	parameter	outdata_reg_a = "OUTCLOCK",
	parameter	outdata_reg_b = "OUTCLOCK",
	parameter	ram_block_type = "AUTO",
	parameter	rdaddress_aclr_a = "ON",
	parameter	rdaddress_aclr_b = "ON",
	parameter	rdaddress_reg_a = "INCLOCK",
	parameter	rdaddress_reg_b = "INCLOCK",
	parameter	rdcontrol_aclr_a = "ON",
	parameter	rdcontrol_aclr_b = "ON",
	parameter	rdcontrol_reg_a = "INCLOCK",
	parameter	rdcontrol_reg_b = "INCLOCK",
	parameter	use_eab = "ON",
	parameter	width = 1,
	parameter	widthad = 1,
	parameter	write_aclr = "ON",
	parameter	write_reg = "INCLOCK")
(	input	wire	aclr,
	input	wire	[width-1:0]	data,
	input	wire	inclock,
	input	wire	inclocken,
	input	wire	outclock,
	input	wire	outclocken,
	output	wire	[width-1:0]	qa,
	output	wire	[width-1:0]	qb,
	input	wire	[widthad-1:0]	rdaddress_a,
	input	wire	[widthad-1:0]	rdaddress_b,
	input	wire	rden_a,
	input	wire	rden_b,
	input	wire	[widthad-1:0]	wraddress,
	input	wire	wren) /* synthesis syn_black_box=1 */;
endmodule // alt3pram

//////////////////////////////////////////////////////////////////////////
// altfp_inv_sqrt parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_inv_sqrt
#(	parameter	intended_device_family = "unused",
	parameter	pipeline = 26,
	parameter	rounding = "TO_NEAREST",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_inv_sqrt",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	data,
	output	wire	division_by_zero,
	output	wire	nan,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_inv_sqrt

//////////////////////////////////////////////////////////////////////////
// alt_mac_mult parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_mac_mult
#(	parameter	bypass_multiplier = "NO",
	parameter	dataa_clear = "NONE",
	parameter	dataa_clock = "NONE",
	parameter	dataa_width = 1,
	parameter	datab_clear = "NONE",
	parameter	datab_clock = "NONE",
	parameter	datab_width = 1,
	parameter	dsp_block_balancing = "UNUSED",
	parameter	dynamic_scan_chain_supported = "NO",
	parameter	extra_output_clear = "NONE",
	parameter	extra_output_clock = "NONE",
	parameter	extra_signa_clear = "NONE",
	parameter	extra_signa_clock = "NONE",
	parameter	extra_signb_clear = "NONE",
	parameter	extra_signb_clock = "NONE",
	parameter	mult_clear = "NONE",
	parameter	mult_clock = "NONE",
	parameter	mult_input_a_is_constant = "NO",
	parameter	mult_input_b_is_constant = "NO",
	parameter	mult_maximize_speed = 5,
	parameter	mult_pipeline = 0,
	parameter	mult_representation_a = "VARIABLE",
	parameter	mult_representation_b = "VARIABLE",
	parameter	output_clear = "NONE",
	parameter	output_clock = "NONE",
	parameter	output_width = 1,
	parameter	round_clear = "NONE",
	parameter	round_clock = "NONE",
	parameter	saturate_clear = "NONE",
	parameter	saturate_clock = "NONE",
	parameter	signa_clear = "NONE",
	parameter	signa_clock = "NONE",
	parameter	signb_clear = "NONE",
	parameter	signb_clock = "NONE",
	parameter	using_rounding = "NO",
	parameter	using_saturation = "NO",
	parameter	lpm_type = "alt_mac_mult",
	parameter	lpm_hint = "unused")
(	input	wire	[3:0]	aclr,
	input	wire	[3:0]	clk,
	input	wire	[dataa_width-1:0]	dataa,
	input	wire	[datab_width-1:0]	datab,
	output	wire	[output_width-1:0]	dataout,
	input	wire	[3:0]	ena,
	input	wire	round,
	input	wire	saturate,
	input	wire	[dataa_width-1:0]	scanina,
	input	wire	[datab_width-1:0]	scaninb,
	output	wire	[dataa_width-1:0]	scanouta,
	output	wire	[datab_width-1:0]	scanoutb,
	input	wire	signa,
	input	wire	signb,
	input	wire	sourcea,
	input	wire	sourceb)/* synthesis syn_black_box=1 */;

endmodule //alt_mac_mult

//////////////////////////////////////////////////////////////////////////
// altdpram parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altdpram
#(	parameter	byte_size = 0,
	parameter	intended_device_family = "unused",
	parameter	indata_aclr = "ON",
	parameter	indata_reg = "INCLOCK",
	parameter	lpm_file = "UNUSED",
	parameter	maximum_depth = 0,
	parameter	numwords = 0,
	parameter	outdata_aclr = "ON",
	parameter	outdata_reg = "UNREGISTERED",
	parameter	ram_block_type = "AUTO",
	parameter	rdaddress_aclr = "ON",
	parameter	rdaddress_reg = "OUTCLOCK",
	parameter	rdcontrol_aclr = "ON",
	parameter	rdcontrol_reg = "OUTCLOCK",
	parameter	read_during_write_mode_mixed_ports = "DONT_CARE",
	parameter	use_eab = "ON",
	parameter	width = 1,
	parameter	width_byteena = 1,
	parameter	widthad = 1,
	parameter	wraddress_aclr = "ON",
	parameter	wraddress_reg = "INCLOCK",
	parameter	wrcontrol_aclr = "ON",
	parameter	wrcontrol_reg = "INCLOCK",
	parameter	lpm_type = "altdpram",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	[width_byteena-1:0]	byteena,
	input	wire	[width-1:0]	data,
	input	wire	inclock,
	input	wire	inclocken,
	input	wire	outclock,
	input	wire	outclocken,
	output	wire	[width-1:0]	q,
	input	wire	[widthad-1:0]	rdaddress,
	input	wire	rdaddressstall,
	input	wire	rden,
	input	wire	[widthad-1:0]	wraddress,
	input	wire	wraddressstall,
	input	wire	wren)/* synthesis syn_black_box=1 */;

endmodule //altdpram

//////////////////////////////////////////////////////////////////////////
// altmult_accum parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altmult_accum
#(	parameter	accum_direction = "ADD",
	parameter	accum_round_aclr = "ACLR0",
	parameter	accum_round_pipeline_aclr = "ACLR0",
	parameter	accum_round_pipeline_reg = "CLOCK0",
	parameter	accum_round_reg = "CLOCK0",
	parameter	accum_saturation_aclr = "ACLR0",
	parameter	accum_saturation_pipeline_aclr = "ACLR0",
	parameter	accum_saturation_pipeline_reg = "CLOCK0",
	parameter	accum_saturation_reg = "CLOCK0",
	parameter	accum_sload_aclr = "ACLR0",
	parameter	accum_sload_pipeline_aclr = "ACLR0",
	parameter	accum_sload_pipeline_reg = "CLOCK0",
	parameter	accum_sload_reg = "CLOCK0",
	parameter	accum_sload_upper_data_aclr = "ACLR0",
	parameter	accum_sload_upper_data_pipeline_aclr = "ACLR0",
	parameter	accum_sload_upper_data_pipeline_reg = "CLOCK0",
	parameter	accum_sload_upper_data_reg = "CLOCK0",
	parameter	accumulator_rounding = "NO",
	parameter	accumulator_saturation = "NO",
	parameter	addnsub_aclr = "ACLR0",
	parameter	addnsub_pipeline_aclr = "ACLR0",
	parameter	addnsub_pipeline_reg = "CLOCK0",
	parameter	addnsub_reg = "CLOCK0",
	parameter	coef0_0 = 0,
	parameter	coef0_1 = 0,
	parameter	coef0_2 = 0,
	parameter	coef0_3 = 0,
	parameter	coef0_4 = 0,
	parameter	coef0_5 = 0,
	parameter	coef0_6 = 0,
	parameter	coef0_7 = 0,
	parameter	coef1_0 = 0,
	parameter	coef1_1 = 0,
	parameter	coef1_2 = 0,
	parameter	coef1_3 = 0,
	parameter	coef1_4 = 0,
	parameter	coef1_5 = 0,
	parameter	coef1_6 = 0,
	parameter	coef1_7 = 0,
	parameter	coef2_0 = 0,
	parameter	coef2_1 = 0,
	parameter	coef2_2 = 0,
	parameter	coef2_3 = 0,
	parameter	coef2_4 = 0,
	parameter	coef2_5 = 0,
	parameter	coef2_6 = 0,
	parameter	coef2_7 = 0,
	parameter	coef3_0 = 0,
	parameter	coef3_1 = 0,
	parameter	coef3_2 = 0,
	parameter	coef3_3 = 0,
	parameter	coef3_4 = 0,
	parameter	coef3_5 = 0,
	parameter	coef3_6 = 0,
	parameter	coef3_7 = 0,
	parameter	coefsel0_aclr = "ACLR0",
	parameter	coefsel0_register = "CLOCK0",
	parameter	coefsel1_aclr = "ACLR0",
	parameter	coefsel1_register = "CLOCK0",
	parameter	coefsel2_aclr = "ACLR0",
	parameter	coefsel2_register = "CLOCK0",
	parameter	coefsel3_aclr = "ACLR0",
	parameter	coefsel3_register = "CLOCK0",
	parameter	dedicated_multiplier_circuitry = "AUTO",
	parameter	intended_device_family = "unused",
	parameter	dsp_block_balancing = "Auto",
	parameter	extra_accumulator_latency = 0,
	parameter	extra_multiplier_latency = 0,
	parameter	input_aclr_a = "ACLR0",
	parameter	input_aclr_b = "ACLR0",
	parameter	input_aclr_c0 = "ACLR0",
	parameter	input_aclr_c1 = "ACLR0",
	parameter	input_aclr_c2 = "ACLR0",
	parameter	input_aclr_c3 = "ACLR0",
	parameter	input_reg_a = "CLOCK0",
	parameter	input_reg_b = "CLOCK0",
	parameter	input_register_c0 = "CLOCK0",
	parameter	input_register_c1 = "CLOCK0",
	parameter	input_register_c2 = "CLOCK0",
	parameter	input_register_c3 = "CLOCK0",
	parameter	input_source_a = "DATAA",
	parameter	input_source_b = "DATAB",
	parameter	loadconst_control_aclr = "ACLR0",
	parameter	loadconst_control_register = "CLOCK0",
	parameter	loadconst_value = 64,
	parameter	mult_round_aclr = "ACLR0",
	parameter	mult_round_reg = "CLOCK0",
	parameter	mult_saturation_aclr = "ACLR0",
	parameter	mult_saturation_reg = "CLOCK0",
	parameter	multiplier1_direction = "ADD",
	parameter	multiplier3_direction = "ADD",
	parameter	multiplier_aclr = "ACLR0",
	parameter	multiplier_reg = "CLOCK0",
	parameter	multiplier_rounding = "NO",
	parameter	multiplier_saturation = "NO",
	parameter	number_of_multipliers = 1,
	parameter	output_aclr = "ACLR0",
	parameter	output_reg = "CLOCK0",
	parameter	port_accum_is_saturated = "UNUSED",
	parameter	port_addnsub = "PORT_CONNECTIVITY",
	parameter	port_mult_is_saturated = "UNUSED",
	parameter	port_signa = "PORT_CONNECTIVITY",
	parameter	port_signb = "PORT_CONNECTIVITY",
	parameter	preadder_direction_0 = "ADD",
	parameter	preadder_direction_1 = "ADD",
	parameter	preadder_direction_2 = "ADD",
	parameter	preadder_direction_3 = "ADD",
	parameter	preadder_mode = "SIMPLE",
	parameter	representation_a = "UNSIGNED",
	parameter	representation_b = "UNSIGNED",
	parameter	sign_aclr_a = "ACLR0",
	parameter	sign_aclr_b = "ACLR0",
	parameter	sign_pipeline_aclr_a = "ACLR0",
	parameter	sign_pipeline_aclr_b = "ACLR0",
	parameter	sign_pipeline_reg_a = "CLOCK0",
	parameter	sign_pipeline_reg_b = "CLOCK0",
	parameter	sign_reg_a = "CLOCK0",
	parameter	sign_reg_b = "CLOCK0",
	parameter	systolic_aclr1 = "ACLR0",
	parameter	systolic_aclr3 = "ACLR0",
	parameter	systolic_delay1 = "UNREGISTERED",
	parameter	systolic_delay3 = "UNREGISTERED",
	parameter	width_a = 1,
	parameter	width_b = 1,
	parameter	width_c = 22,
	parameter	width_coef = 18,
	parameter	width_result = 1,
	parameter	width_upper_data = 1,
	parameter	lpm_type = "altmult_accum",
	parameter	lpm_hint = "unused")
(	output	wire	accum_is_saturated,
	input	wire	accum_round,
	input	wire	accum_saturation,
	input	wire	accum_sload,
	input	wire	[width_upper_data-1:0]	accum_sload_upper_data,
	input	wire	aclr0,
	input	wire	aclr1,
	input	wire	aclr2,
	input	wire	aclr3,
	input	wire	addnsub,
	input	wire	clock0,
	input	wire	clock1,
	input	wire	clock2,
	input	wire	clock3,
	input	wire	[2:0]	coefsel0,
	input	wire	[2:0]	coefsel1,
	input	wire	[2:0]	coefsel2,
	input	wire	[2:0]	coefsel3,
	input	wire	[width_a-1:0]	dataa,
	input	wire	[width_b-1:0]	datab,
	input	wire	[width_c-1:0]	datac,
	input	wire	ena0,
	input	wire	ena1,
	input	wire	ena2,
	input	wire	ena3,
	output	wire	mult_is_saturated,
	input	wire	mult_round,
	input	wire	mult_saturation,
	output	wire	overflow,
	output	wire	[width_result-1:0]	result,
	input	wire	[width_a-1:0]	scanina,
	input	wire	[width_b-1:0]	scaninb,
	output	wire	[width_a-1:0]	scanouta,
	output	wire	[width_b-1:0]	scanoutb,
	input	wire	signa,
	input	wire	signb,
	input	wire	sourcea,
	input	wire	sourceb)/* synthesis syn_black_box=1 */;

endmodule //altmult_accum

//////////////////////////////////////////////////////////////////////////
// altfp_convert parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_convert
#(	parameter	intended_device_family = "unused",
	parameter	operation = "INT2FLOAT",
	parameter	rounding = "TO_NEAREST",
	parameter	width_data = 32,
	parameter	width_exp_input = 8,
	parameter	width_exp_output = 8,
	parameter	width_int = 32,
	parameter	width_man_input = 23,
	parameter	width_man_output = 23,
	parameter	width_result = 32,
	parameter	lpm_type = "altfp_convert",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_data-1:0]	dataa,
	output	wire	nan,
	output	wire	overflow,
	output	wire	[width_result-1:0]	result,
	output	wire	underflow)/* synthesis syn_black_box=1 */;

endmodule //altfp_convert

//////////////////////////////////////////////////////////////////////////
// alt_oct_power parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_oct_power
#(	parameter	intended_device_family = "unused",
	parameter	width_ptc = 14,
	parameter	width_stc = 14,
	parameter	lpm_type = "alt_oct_power",
	parameter	lpm_hint = "unused")
(	output	wire	[width_ptc-1:0]	parallelterminationcontrol,
	input	wire	[0:0]	rdn,
	input	wire	[0:0]	rup,
	input	wire	[0:0]	rzqin,
	output	wire	serdata,
	output	wire	[width_stc-1:0]	seriesterminationcontrol,
	output	wire	[16-1:0]	termination_control,
	output	wire	terminationclock,
	output	wire	terminationdata,
	output	wire	terminationselect)/* synthesis syn_black_box=1 */;

endmodule //alt_oct_power

//////////////////////////////////////////////////////////////////////////
// altfp_matrix_inv parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_matrix_inv
#(	parameter	blocks = 2,
	parameter	cluster = 8,
	parameter	intended_device_family = "unused",
	parameter	dimension = 8,
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_matrix_inv",
	parameter	lpm_hint = "unused")
(	output	wire	busy,
	input	wire	[width_exp+width_man+1-1:0]	datain,
	output	wire	[width_exp+width_man+1-1:0]	dataout,
	output	wire	done,
	input	wire	enable,
	input	wire	load,
	output	wire	outvalid,
	input	wire	reset,
	input	wire	sysclk)/* synthesis syn_black_box=1 */;

endmodule //altfp_matrix_inv

//////////////////////////////////////////////////////////////////////////
// altaccumulate parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altaccumulate
#(	parameter	carry_chain = "MANUAL",
	parameter	carry_chain_length = 32,
	parameter	intended_device_family = "unused",
	parameter	extra_latency = 0,
	parameter	lpm_representation = "UNSIGNED",
	parameter	right_shift_distance = 0,
	parameter	use_wys = "ON",
	parameter	width_in = 1,
	parameter	width_out = 1,
	parameter	lpm_type = "altaccumulate",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	add_sub,
	input	wire	cin,
	input	wire	clken,
	input	wire	clock,
	output	wire	cout,
	input	wire	[width_in-1:0]	data,
	output	wire	overflow,
	output	wire	[width_out-1:0]	result,
	input	wire	sign_data,
	input	wire	sload)/* synthesis syn_black_box=1 */;

endmodule //altaccumulate

//////////////////////////////////////////////////////////////////////////
// altiobuf_in parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altiobuf_in
#(	parameter	intended_device_family = "unused",
	parameter	enable_bus_hold = "FALSE",
	parameter	number_of_channels = 1,
	parameter	use_differential_mode = "FALSE",
	parameter	use_dynamic_termination_control = "FALSE",
	parameter	use_in_dynamic_delay_chain = "FALSE",
	parameter	lpm_type = "altiobuf_in",
	parameter	lpm_hint = "unused")
(	input	wire	[number_of_channels-1:0]	datain,
	input	wire	[number_of_channels-1:0]	datain_b,
	output	wire	[number_of_channels-1:0]	dataout,
	input	wire	[number_of_channels-1:0]	dynamicterminationcontrol,
	input	wire	io_config_clk,
	input	wire	[number_of_channels-1:0]	io_config_clkena,
	input	wire	io_config_datain,
	input	wire	io_config_update)/* synthesis syn_black_box=1 */;

endmodule //altiobuf_in

//////////////////////////////////////////////////////////////////////////
// alt_c3gxb parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_c3gxb
#(	parameter	intended_device_family = "unused",
	parameter	effective_data_rate = "UNUSED",
	parameter	elec_idle_infer_enable = "false",
	parameter	enable_0ppm = "false",
	parameter	equalization_setting = 1,
	parameter	equalizer_dcgain_setting = 0,
	parameter	gxb_powerdown_width = 1,
	parameter	hip_enable = "false",
	parameter	loopback_mode = "none",
	parameter	number_of_channels = 1,
	parameter	number_of_quads = 1,
	parameter	number_of_rx_pll = 1,
	parameter	operation_mode = "duplex",
	parameter	pll_bandwidth_type = "auto",
	parameter	pll_control_width = 1,
	parameter	pll_divide_by = "UNUSED",
	parameter	pll_en_switchover = "false",
	parameter	pll_inclk1_period = 5000,
	parameter	pll_inclk_period = 5000,
	parameter	pll_multiply_by = "UNUSED",
	parameter	pll_pfd_fb_mode = "internal",
	parameter	preemphasis_ctrl_1stposttap_setting = 0,
	parameter	protocol = "gige",
	parameter	receiver_termination = "OCT_100_OHMS",
	parameter	reconfig_calibration = "false",
	parameter	reconfig_dprio_mode = 0,
	parameter	reconfig_pll_control_width = 1,
	parameter	rx_0ppm_core_clock = "false",
	parameter	rx_8b_10b_mode = "none",
	parameter	rx_align_loss_sync_error_num = 1,
	parameter	rx_align_pattern = "0000000",
	parameter	rx_align_pattern_length = 7,
	parameter	rx_allow_align_polarity_inversion = "false",
	parameter	rx_allow_pipe_polarity_inversion = "false",
	parameter	rx_bitslip_enable = "false",
	parameter	rx_byte_order_pad_pattern = "0",
	parameter	rx_byte_order_pattern = "0",
	parameter	rx_byte_order_pld_ctrl_enable = "false",
	parameter	rx_byte_ordering_mode = "none",
	parameter	rx_cdrctrl_enable = "false",
	parameter	rx_channel_bonding = "indv",
	parameter	rx_channel_width = 8,
	parameter	rx_common_mode = "0.82v",
	parameter	rx_dataoutfull_width = 32,
	parameter	rx_datapath_low_latency_mode = "false",
	parameter	rx_datapath_protocol = "basic",
	parameter	rx_deskew_pattern = "0",
	parameter	rx_digitalreset_port_width = 1,
	parameter	rx_disable_running_disp_in_word_align = "false",
	parameter	rx_dwidth_factor = 2,
	parameter	rx_enable_bit_reversal = "false",
	parameter	rx_enable_local_divider = "false",
	parameter	rx_enable_lock_to_data_sig = "false",
	parameter	rx_enable_lock_to_refclk_sig = "false",
	parameter	rx_enable_second_order_loop = "false",
	parameter	rx_enable_self_test_mode = "false",
	parameter	rx_flip_rx_out = "false",
	parameter	rx_force_signal_detect = "false",
	parameter	rx_force_signal_detect_dig = "true",
	parameter	rx_infiniband_invalid_code = 0,
	parameter	rx_insert_pad_on_underflow = "false",
	parameter	rx_loop_1_digital_filter = 8,
	parameter	rx_num_align_code_groups_in_ordered_set = 0,
	parameter	rx_num_align_cons_good_data = 1,
	parameter	rx_num_align_cons_pat = 1,
	parameter	rx_phfiforegmode = "false",
	parameter	rx_ppmselect = 8,
	parameter	rx_rate_match_back_to_back = "false",
	parameter	rx_rate_match_fifo_mode = "none",
	parameter	rx_rate_match_fifo_mode_manual_control = "normal",
	parameter	rx_rate_match_pattern1 = "0",
	parameter	rx_rate_match_pattern2 = "0",
	parameter	rx_rate_match_pattern_size = 10,
	parameter	rx_rate_match_reset_enable = "false",
	parameter	rx_reconfig_clk_scheme = "tx_clk_to_rx",
	parameter	rx_run_length = 4,
	parameter	rx_run_length_enable = "true",
	parameter	rx_self_test_mode = "incremental",
	parameter	rx_signal_detect_loss_threshold = 3,
	parameter	rx_signal_detect_threshold = 3,
	parameter	rx_signal_detect_valid_threshold = 2,
	parameter	rx_use_align_state_machine = "false",
	parameter	rx_use_clkout = "true",
	parameter	rx_use_coreclk = "false",
	parameter	rx_use_deskew_fifo = "false",
	parameter	rx_use_double_data_mode = "false",
	parameter	rx_use_external_termination = "false",
	parameter	rx_use_pipe8b10binvpolarity = "false",
	parameter	rx_word_aligner_num_byte = 1,
	parameter	sim_en_pll_fs_res = "false",
	parameter	starting_channel_number = 0,
	parameter	top_module_name = "DPRIO_ONLY",
	parameter	transmitter_termination = "OCT_100_OHMS",
	parameter	tx_0ppm_core_clock = "false",
	parameter	tx_8b_10b_mode = "none",
	parameter	tx_allow_polarity_inversion = "false",
	parameter	tx_bitslip_enable = "false",
	parameter	tx_channel_bonding = "indv",
	parameter	tx_channel_width = 8,
	parameter	tx_clkout_width = 1,
	parameter	tx_common_mode = "0.65v",
	parameter	tx_datainfull_width = 22,
	parameter	tx_datapath_low_latency_mode = "false",
	parameter	tx_digitalreset_port_width = 1,
	parameter	tx_dwidth_factor = 2,
	parameter	tx_elec_idle_delay = 3,
	parameter	tx_enable_bit_reversal = "false",
	parameter	tx_enable_idle_selection = "false",
	parameter	tx_enable_self_test_mode = "false",
	parameter	tx_flip_tx_in = "false",
	parameter	tx_force_disparity_mode = "false",
	parameter	tx_phfiforegmode = "false",
	parameter	tx_reconfig_clk_scheme = "tx_ch0_clk_source",
	parameter	tx_self_test_mode = "incremental",
	parameter	tx_slew_rate = "low",
	parameter	tx_transmit_protocol = "basic",
	parameter	tx_use_coreclk = "false",
	parameter	tx_use_double_data_mode = "false",
	parameter	tx_use_external_termination = "false",
	parameter	use_calibration_block = "true",
	parameter	vod_ctrl_setting = 0,
	parameter	lpm_type = "alt_c3gxb",
	parameter	lpm_hint = "unused")
(	input	wire	cal_blk_clk,
	input	wire	cal_blk_powerdown,
	output	wire	[number_of_quads-1:0]	coreclkout,
	input	wire	fixedclk,
	input	wire	[4*number_of_quads-1:0]	fixedclk_fast,
	input	wire	[gxb_powerdown_width-1:0]	gxb_powerdown,
	output	wire	[number_of_channels-1:0]	hip_tx_clkout,
	input	wire	[number_of_channels-1:0]	pipe8b10binvpolarity,
	output	wire	[number_of_channels-1:0]	pipedatavalid,
	output	wire	[number_of_channels-1:0]	pipeelecidle,
	output	wire	[number_of_channels-1:0]	pipephydonestatus,
	output	wire	[number_of_channels*3-1:0]	pipestatus,
	input	wire	[reconfig_pll_control_width-1:0]	pll_areset,
	input	wire	[number_of_rx_pll-1:0]	pll_clkswitch,
	input	wire	[reconfig_pll_control_width-1:0]	pll_configupdate,
	input	wire	[pll_control_width-1:0]	pll_inclk,
	input	wire	[number_of_rx_pll-1:0]	pll_inclk1,
	output	wire	[pll_control_width-1:0]	pll_locked,
	input	wire	[pll_control_width-1:0]	pll_powerdown,
	output	wire	[reconfig_pll_control_width-1:0]	pll_reconfig_done,
	input	wire	[reconfig_pll_control_width-1:0]	pll_scanclk,
	input	wire	[reconfig_pll_control_width-1:0]	pll_scanclkena,
	input	wire	[reconfig_pll_control_width-1:0]	pll_scandata,
	output	wire	[reconfig_pll_control_width-1:0]	pll_scandataout,
	input	wire	[number_of_channels*2-1:0]	powerdn,
	input	wire	reconfig_clk,
	output	wire	[5*number_of_quads-1:0]	reconfig_fromgxb,
	input	wire	[3:0]	reconfig_togxb,
	input	wire	[number_of_channels-1:0]	rx_a1a2size,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_a1a2sizeout,
	output	wire	[number_of_channels*rx_word_aligner_num_byte-1:0]	rx_a1detect,
	output	wire	[number_of_channels*rx_word_aligner_num_byte-1:0]	rx_a2detect,
	input	wire	[rx_digitalreset_port_width-1:0]	rx_analogreset,
	output	wire	[number_of_channels-1:0]	rx_bistdone,
	output	wire	[number_of_channels-1:0]	rx_bisterr,
	input	wire	[number_of_channels-1:0]	rx_bitslip,
	output	wire	[number_of_channels*5-1:0]	rx_bitslipboundaryselectout,
	output	wire	[number_of_channels-1:0]	rx_byteorderalignstatus,
	output	wire	[number_of_quads-1:0]	rx_channelaligned,
	output	wire	[number_of_channels-1:0]	rx_clkout,
	input	wire	[number_of_channels-1:0]	rx_coreclk,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_ctrldetect,
	input	wire	[number_of_channels-1:0]	rx_datain,
	output	wire	[rx_channel_width*number_of_channels-1:0]	rx_dataout,
	output	wire	[rx_dataoutfull_width*number_of_channels-1:0]	rx_dataoutfull,
	input	wire	[rx_digitalreset_port_width-1:0]	rx_digitalreset,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_disperr,
	input	wire	[number_of_channels*3-1:0]	rx_elecidleinfersel,
	input	wire	[number_of_channels-1:0]	rx_enabyteord,
	input	wire	[number_of_channels-1:0]	rx_enapatternalign,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_errdetect,
	output	wire	[number_of_channels-1:0]	rx_freqlocked,
	input	wire	[number_of_channels-1:0]	rx_invpolarity,
	output	wire	[number_of_channels*rx_word_aligner_num_byte-1:0]	rx_k1detect,
	output	wire	[number_of_channels*2-1:0]	rx_k2detect,
	input	wire	[number_of_channels-1:0]	rx_locktodata,
	input	wire	[number_of_channels-1:0]	rx_locktorefclk,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_patterndetect,
	output	wire	[number_of_channels-1:0]	rx_phase_comp_fifo_error,
	output	wire	[number_of_channels-1:0]	rx_phfifooverflow,
	input	wire	[number_of_channels-1:0]	rx_phfifordenable,
	input	wire	[number_of_channels-1:0]	rx_phfiforeset,
	output	wire	[number_of_channels-1:0]	rx_phfifounderflow,
	input	wire	[number_of_channels-1:0]	rx_phfifowrdisable,
	output	wire	[number_of_channels*4-1:0]	rx_pipebufferstat,
	input	wire	[number_of_channels-1:0]	rx_powerdown,
	input	wire	[number_of_channels-1:0]	rx_prbscidenable,
	output	wire	[number_of_channels-1:0]	rx_recovclkout,
	input	wire	[number_of_channels-1:0]	rx_revbitorderwa,
	output	wire	[number_of_channels-1:0]	rx_revseriallpbkout,
	output	wire	[number_of_channels-1:0]	rx_rlv,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_rmfifodatadeleted,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_rmfifodatainserted,
	output	wire	[number_of_channels-1:0]	rx_rmfifoempty,
	output	wire	[number_of_channels-1:0]	rx_rmfifofull,
	input	wire	[number_of_channels-1:0]	rx_rmfifordena,
	input	wire	[number_of_channels-1:0]	rx_rmfiforeset,
	input	wire	[number_of_channels-1:0]	rx_rmfifowrena,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_runningdisp,
	input	wire	[number_of_channels-1:0]	rx_seriallpbkin,
	output	wire	[number_of_channels-1:0]	rx_signaldetect,
	output	wire	[number_of_channels*rx_dwidth_factor-1:0]	rx_syncstatus,
	input	wire	[number_of_channels*5-1:0]	tx_bitslipboundaryselect,
	output	wire	[tx_clkout_width-1:0]	tx_clkout,
	input	wire	[number_of_channels-1:0]	tx_coreclk,
	input	wire	[number_of_channels*tx_dwidth_factor-1:0]	tx_ctrlenable,
	input	wire	[tx_channel_width*number_of_channels-1:0]	tx_datain,
	input	wire	[tx_datainfull_width*number_of_channels-1:0]	tx_datainfull,
	output	wire	[number_of_channels-1:0]	tx_dataout,
	input	wire	[number_of_channels-1:0]	tx_detectrxloop,
	input	wire	[tx_digitalreset_port_width-1:0]	tx_digitalreset,
	input	wire	[number_of_channels*tx_dwidth_factor-1:0]	tx_dispval,
	input	wire	[number_of_channels*tx_dwidth_factor-1:0]	tx_forcedisp,
	input	wire	[number_of_channels-1:0]	tx_forcedispcompliance,
	input	wire	[number_of_channels-1:0]	tx_forceelecidle,
	input	wire	[number_of_channels-1:0]	tx_invpolarity,
	output	wire	[number_of_channels-1:0]	tx_phase_comp_fifo_error,
	output	wire	[number_of_channels-1:0]	tx_phfifooverflow,
	input	wire	[number_of_channels-1:0]	tx_phfiforeset,
	output	wire	[number_of_channels-1:0]	tx_phfifounderflow,
	input	wire	[number_of_channels-1:0]	tx_revparallellpbken,
	input	wire	[number_of_channels-1:0]	tx_revseriallpbkin,
	output	wire	[number_of_channels-1:0]	tx_seriallpbkout)/* synthesis syn_black_box=1 */;

endmodule //alt_c3gxb

//////////////////////////////////////////////////////////////////////////
// altufm_parallel parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altufm_parallel
#(	parameter	access_mode = "unused",
	parameter	intended_device_family = "unused",
	parameter	erase_time = 500000000,
	parameter	lpm_file = "UNUSED",
	parameter	osc_frequency = 180000,
	parameter	program_time = 1600000,
	parameter	width_address = 9,
	parameter	width_data = 16,
	parameter	width_ufm_address = 9,
	parameter	lpm_type = "altufm_parallel",
	parameter	lpm_hint = "unused")
(	input	wire	[width_address-1:0]	addr,
	output	wire	data_valid,
	input	wire	[width_data-1:0]	datain,
	output	wire	[width_data-1:0]	dataout,
	output	wire	nbusy,
	input	wire	nerase,
	input	wire	nread,
	input	wire	nwrite,
	output	wire	osc,
	input	wire	oscena)/* synthesis syn_black_box=1 */;

endmodule //altufm_parallel

//////////////////////////////////////////////////////////////////////////
// alttemp_sense parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alttemp_sense
#(	parameter	clk_frequency = "unused",
	parameter	clock_divider_enable = "off",
	parameter	clock_divider_value = 40,
	parameter	intended_device_family = "unused",
	parameter	number_of_samples = 128,
	parameter	poi_cal_temperature = 85,
	parameter	sim_tsdcalo = 0,
	parameter	use_wys = "on",
	parameter	user_offset_enable = "off",
	parameter	lpm_type = "alttemp_sense",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	ce,
	input	wire	clk,
	input	wire	clr,
	input	wire	compouttest,
	input	wire	fdbkctrlfromcore,
	input	wire	[5:0]	offset,
	output	wire	[5:0]	offsetout,
	input	wire	[7:0]	testin,
	output	wire	[7:0]	tsd_avg,
	output	wire	tsd_busy,
	input	wire	tsd_trig,
	output	wire	tsdcaldone,
	output	wire	[7:0]	tsdcalo,
	output	wire	tsdcompout)/* synthesis syn_black_box=1 */;

endmodule //alttemp_sense

//////////////////////////////////////////////////////////////////////////
// altiobuf_bidir parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altiobuf_bidir
#(	parameter	intended_device_family = "unused",
	parameter	enable_bus_hold = "FALSE",
	parameter	number_of_channels = 1,
	parameter	open_drain_output = "FALSE",
	parameter	use_differential_mode = "FALSE",
	parameter	use_dynamic_termination_control = "FALSE",
	parameter	use_in_dynamic_delay_chain = "FALSE",
	parameter	use_out_dynamic_delay_chain1 = "FALSE",
	parameter	use_out_dynamic_delay_chain2 = "FALSE",
	parameter	use_termination_control = "FALSE",
	parameter	width_ptc = 14,
	parameter	width_stc = 14,
	parameter	lpm_type = "altiobuf_bidir",
	parameter	lpm_hint = "unused")
(	input	wire	[number_of_channels-1:0]	datain,
	inout	wire	[number_of_channels-1:0]	dataio,
	inout	wire	[number_of_channels-1:0]	dataio_b,
	output	wire	[number_of_channels-1:0]	dataout,
	input	wire	[number_of_channels-1:0]	dynamicterminationcontrol,
	input	wire	[number_of_channels-1:0]	dynamicterminationcontrol_b,
	input	wire	io_config_clk,
	input	wire	[number_of_channels-1:0]	io_config_clkena,
	input	wire	io_config_datain,
	input	wire	io_config_update,
	input	wire	[number_of_channels-1:0]	oe,
	input	wire	[number_of_channels-1:0]	oe_b,
	input	wire	[width_ptc * number_of_channels-1:0]	parallelterminationcontrol,
	input	wire	[width_ptc * number_of_channels-1:0]	parallelterminationcontrol_b,
	input	wire	[width_stc * number_of_channels-1:0]	seriesterminationcontrol,
	input	wire	[width_stc * number_of_channels-1:0]	seriesterminationcontrol_b)/* synthesis syn_black_box=1 */;

endmodule //altiobuf_bidir

//////////////////////////////////////////////////////////////////////////
// altclkctrl parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altclkctrl
#(	parameter	clock_type = "AUTO",
	parameter	intended_device_family = "unused",
	parameter	ena_register_mode = "falling edge",
	parameter	implement_in_les = "OFF",
	parameter	number_of_clocks = 4,
	parameter	use_glitch_free_switch_over_implementation = "OFF",
	parameter	width_clkselect = 2,
	parameter	lpm_type = "altclkctrl",
	parameter	lpm_hint = "unused")
(	input	wire	[width_clkselect-1:0]	clkselect,
	input	wire	ena,
	input	wire	[number_of_clocks-1:0]	inclk,
	output	wire	outclk)/* synthesis syn_black_box=1 */;

endmodule //altclkctrl

//////////////////////////////////////////////////////////////////////////
// altfp_abs parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_abs
#(	parameter	intended_device_family = "unused",
	parameter	pipeline = 0,
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_abs",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	data,
	output	wire	division_by_zero,
	input	wire	division_by_zero_in,
	output	wire	nan,
	input	wire	nan_in,
	output	wire	overflow,
	input	wire	overflow_in,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	underflow,
	input	wire	underflow_in,
	output	wire	zero,
	input	wire	zero_in)/* synthesis syn_black_box=1 */;

endmodule //altfp_abs

//////////////////////////////////////////////////////////////////////////
// alt_oct_aii parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_oct_aii
#(	parameter	intended_device_family = "unused",
	parameter	divide_intosc_by = 1,
	parameter	left_shift_termination_code = "FALSE",
	parameter	power_down = "TRUE",
	parameter	pulldown_adder = 0,
	parameter	pullup_adder = 0,
	parameter	pullup_control_to_core = "FALSE",
	parameter	runtime_control = "FALSE",
	parameter	shift_vref_rdn = "TRUE",
	parameter	shift_vref_rup = "TRUE",
	parameter	shifted_vref_control = "TRUE",
	parameter	test_mode = "FALSE",
	parameter	lpm_type = "alt_oct_aii",
	parameter	lpm_hint = "unused")
(	output	wire	[0:0]	cal_shift_busy,
	input	wire	[0:0]	calibration_request,
	input	wire	clock,
	output	wire	comparatorprobe,
	input	wire	[0:0]	rdn,
	input	wire	[0:0]	rup,
	input	wire	scanclock,
	input	wire	scanin,
	input	wire	scaninmux,
	output	wire	scanout,
	input	wire	scanshiftmux,
	output	wire	[16-1:0]	termination_control,
	output	wire	terminationcontrolprobe)/* synthesis syn_black_box=1 */;

endmodule //alt_oct_aii

//////////////////////////////////////////////////////////////////////////
// lpm_clshift parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	lpm_clshift
#(	parameter	lpm_pipeline = 0,
	parameter	lpm_shifttype = "LOGICAL",
	parameter	lpm_width = 1,
	parameter	lpm_widthdist = 1,
	parameter	lpm_type = "lpm_clshift",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clken,
	input	wire	clock,
	input	wire	[lpm_width-1:0]	data,
	input	wire	direction,
	input	wire	[lpm_widthdist-1:0]	distance,
	output	wire	overflow,
	output	wire	[lpm_width-1:0]	result,
	output	wire	underflow)/* synthesis syn_black_box=1 */;

endmodule //lpm_clshift

//////////////////////////////////////////////////////////////////////////
// alt_mac_out parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_mac_out
#(	parameter	addnsub0_clear = "NONE",
	parameter	addnsub0_clock = "NONE",
	parameter	addnsub0_pipeline_clear = "NONE",
	parameter	addnsub0_pipeline_clock = "NONE",
	parameter	addnsub1_clear = "NONE",
	parameter	addnsub1_clock = "NONE",
	parameter	addnsub1_pipeline_clear = "NONE",
	parameter	addnsub1_pipeline_clock = "NONE",
	parameter	dataa_forced_to_zero = "NO",
	parameter	dataa_width = 1,
	parameter	datab_width = 1,
	parameter	datac_forced_to_zero = "NO",
	parameter	datac_width = 1,
	parameter	datad_width = 1,
	parameter	first_adder0_clear = "NONE",
	parameter	first_adder0_clock = "NONE",
	parameter	loadable_accum_supported = "NO",
	parameter	mode0_clear = "NONE",
	parameter	mode0_clock = "NONE",
	parameter	mode0_pipeline_clear = "NONE",
	parameter	mode0_pipeline_clock = "NONE",
	parameter	mode1_clear = "NONE",
	parameter	mode1_clock = "NONE",
	parameter	mode1_pipeline_clear = "NONE",
	parameter	mode1_pipeline_clock = "NONE",
	parameter	multabsaturate_clear = "NONE",
	parameter	multabsaturate_clock = "NONE",
	parameter	multabsaturate_pipeline_clear = "NONE",
	parameter	multabsaturate_pipeline_clock = "NONE",
	parameter	multcdsaturate_clear = "NONE",
	parameter	multcdsaturate_clock = "NONE",
	parameter	multcdsaturate_pipeline_clear = "NONE",
	parameter	multcdsaturate_pipeline_clock = "NONE",
	parameter	operation_mode = "unused",
	parameter	output_clear = "NONE",
	parameter	output_clock = "NONE",
	parameter	output_width = 1,
	parameter	round0_clear = "NONE",
	parameter	round0_clock = "NONE",
	parameter	round0_pipeline_clear = "NONE",
	parameter	round0_pipeline_clock = "NONE",
	parameter	round1_clear = "NONE",
	parameter	round1_clock = "NONE",
	parameter	round1_pipeline_clear = "NONE",
	parameter	round1_pipeline_clock = "NONE",
	parameter	saturate_clear = "NONE",
	parameter	saturate_clock = "NONE",
	parameter	saturate_pipeline_clear = "NONE",
	parameter	saturate_pipeline_clock = "NONE",
	parameter	signa_clear = "NONE",
	parameter	signa_clock = "NONE",
	parameter	signa_pipeline_clear = "NONE",
	parameter	signa_pipeline_clock = "NONE",
	parameter	signb_clear = "NONE",
	parameter	signb_clock = "NONE",
	parameter	signb_pipeline_clear = "NONE",
	parameter	signb_pipeline_clock = "NONE",
	parameter	using_loadable_accum = "NO",
	parameter	using_mult_saturation = "NO",
	parameter	using_rounding = "NO",
	parameter	using_saturation = "NO",
	parameter	zeroacc_clear = "NONE",
	parameter	zeroacc_clock = "NONE",
	parameter	zeroacc_pipeline_clear = "NONE",
	parameter	zeroacc_pipeline_clock = "NONE",
	parameter	lpm_type = "alt_mac_out",
	parameter	lpm_hint = "unused")
(	output	wire	accoverflow,
	input	wire	[3:0]	aclr,
	input	wire	addnsub0,
	input	wire	addnsub1,
	input	wire	[3:0]	clk,
	input	wire	[dataa_width-1:0]	dataa,
	input	wire	[datab_width-1:0]	datab,
	input	wire	[datac_width-1:0]	datac,
	input	wire	[datad_width-1:0]	datad,
	output	wire	[output_width-1:0]	dataout,
	input	wire	[3:0]	ena,
	input	wire	mode0,
	input	wire	mode1,
	input	wire	multabsaturate,
	input	wire	multcdsaturate,
	input	wire	round0,
	input	wire	round1,
	input	wire	saturate,
	input	wire	saturate1,
	input	wire	signa,
	input	wire	signb,
	input	wire	zeroacc,
	input	wire	zeroacc1)/* synthesis syn_black_box=1 */;

endmodule //alt_mac_out

//////////////////////////////////////////////////////////////////////////
// altdqs parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altdqs
#(	parameter	delay_buffer_mode = "low",
	parameter	delay_chain_mode = "static",
	parameter	intended_device_family = "unused",
	parameter	dll_delay_chain_length = 12,
	parameter	dll_delayctrl_mode = "normal",
	parameter	dll_jitter_reduction = "true",
	parameter	dll_offsetctrl_mode = "none",
	parameter	dll_phase_shift = "unused",
	parameter	dll_static_offset = "0",
	parameter	dll_use_reset = "false",
	parameter	dll_use_upndnin = "false",
	parameter	dll_use_upndninclkena = "false",
	parameter	dqs_ctrl_latches_enable = "true",
	parameter	dqs_delay_chain_length = 3,
	parameter	dqs_delay_chain_setting = "0",
	parameter	dqs_delay_requirement = "unused",
	parameter	dqs_edge_detect_enable = "false",
	parameter	dqs_oe_async_reset = "none",
	parameter	dqs_oe_power_up = "low",
	parameter	dqs_oe_register_mode = "register",
	parameter	dqs_oe_sync_reset = "none",
	parameter	dqs_open_drain_output = "false",
	parameter	dqs_output_async_reset = "none",
	parameter	dqs_output_power_up = "low",
	parameter	dqs_output_sync_reset = "none",
	parameter	dqs_use_dedicated_delayctrlin = "true",
	parameter	dqsn_mode = "none",
	parameter	extend_oe_disable = "true",
	parameter	gated_dqs = "false",
	parameter	has_dqs_delay_requirement = "true",
	parameter	input_frequency = "unused",
	parameter	invert_output = "false",
	parameter	number_of_dqs = 1,
	parameter	number_of_dqs_controls = 1,
	parameter	sim_invalid_lock = 100000,
	parameter	sim_valid_lock = 1,
	parameter	tie_off_dqs_oe_clock_enable = "false",
	parameter	tie_off_dqs_output_clock_enable = "false",
	parameter	lpm_type = "altdqs",
	parameter	lpm_hint = "unused")
(	input	wire	dll_addnsub,
	output	wire	[5:0]	dll_delayctrlout,
	input	wire	[5:0]	dll_offset,
	input	wire	dll_reset,
	input	wire	dll_upndnin,
	input	wire	dll_upndninclkena,
	output	wire	dll_upndnout,
	output	wire	[number_of_dqs-1:0]	dqddioinclk,
	output	wire	[number_of_dqs-1:0]	dqinclk,
	input	wire	[number_of_dqs_controls-1:0]	dqs_areset,
	input	wire	[number_of_dqs-1:0]	dqs_datain_h,
	input	wire	[number_of_dqs-1:0]	dqs_datain_l,
	input	wire	[5:0]	dqs_delayctrlin,
	inout	wire	[number_of_dqs-1:0]	dqs_padio,
	input	wire	[number_of_dqs_controls-1:0]	dqs_sreset,
	inout	wire	[number_of_dqs-1:0]	dqsn_padio,
	output	wire	[number_of_dqs-1:0]	dqsundelayedout,
	input	wire	[number_of_dqs-1:0]	enable_dqs,
	input	wire	inclk,
	input	wire	[number_of_dqs_controls-1:0]	oe,
	input	wire	[number_of_dqs_controls-1:0]	outclk,
	input	wire	[number_of_dqs_controls-1:0]	outclkena)/* synthesis syn_black_box=1 */;

endmodule //altdqs

//////////////////////////////////////////////////////////////////////////
// alt_c3gxb_reconfig parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_c3gxb_reconfig
#(	parameter	base_port_width = 1,
	parameter	channel_address_width = 1,
	parameter	data_latency = 0,
	parameter	intended_device_family = "unused",
	parameter	enable_buf_cal = "FALSE",
	parameter	enable_buf_cal_func_sim = "FALSE",
	parameter	enable_chl_addr_for_analog_ctrl = "FALSE",
	parameter	enable_full_write = "FALSE",
	parameter	enable_illegal_mode_check = "FALSE",
	parameter	enable_rx_equalization = "TRUE",
	parameter	enable_rx_tx_duplex_sel = "FALSE",
	parameter	enable_self_recovery = "FALSE",
	parameter	mif_address_width = 5,
	parameter	number_of_channels = 1,
	parameter	number_of_reconfig_ports = 1,
	parameter	read_base_port_width = 1,
	parameter	reconfig_fromgxb_width = 5,
	parameter	reconfig_mode_sel_width = 3,
	parameter	reconfig_togxb_width = 4,
	parameter	rx_eqdcgain_port_width = 2,
	parameter	tx_preemp_port_width = 4,
	parameter	lpm_type = "alt_c3gxb_reconfig",
	parameter	lpm_hint = "unused")
(	output	wire	busy,
	output	wire	channel_reconfig_done,
	output	wire	data_valid,
	output	wire	error,
	input	wire	[3-1:0]	gxb_address,
	input	wire	[channel_address_width-1:0]	logical_channel_address,
	input	wire	offset_cancellation_reset,
	input	wire	read,
	input	wire	[mif_address_width-1:0]	reconfig_address,
	output	wire	reconfig_address_en,
	output	wire	[mif_address_width-1:0]	reconfig_address_out,
	input	wire	reconfig_clk,
	input	wire	[16-1:0]	reconfig_data,
	input	wire	[16-1:0]	reconfig_data_mask,
	output	wire	[16-1:0]	reconfig_data_out,
	input	wire	[reconfig_fromgxb_width-1:0]	reconfig_fromgxb,
	input	wire	[reconfig_mode_sel_width-1:0]	reconfig_mode_sel,
	input	wire	reconfig_reset,
	output	wire	[reconfig_togxb_width-1:0]	reconfig_togxb,
	input	wire	reset_reconfig_address,
	input	wire	[base_port_width*4-1:0]	rx_eqctrl,
	output	wire	[read_base_port_width*4-1:0]	rx_eqctrl_out,
	input	wire	[base_port_width*rx_eqdcgain_port_width-1:0]	rx_eqdcgain,
	output	wire	[read_base_port_width*rx_eqdcgain_port_width-1:0]	rx_eqdcgain_out,
	input	wire	[2-1:0]	rx_tx_duplex_sel,
	input	wire	[base_port_width*tx_preemp_port_width-1:0]	tx_preemp,
	output	wire	[read_base_port_width*tx_preemp_port_width-1:0]	tx_preemp_out,
	input	wire	[base_port_width*3-1:0]	tx_vodctrl,
	output	wire	[read_base_port_width*3-1:0]	tx_vodctrl_out,
	input	wire	write_all)/* synthesis syn_black_box=1 */;

endmodule //alt_c3gxb_reconfig

//////////////////////////////////////////////////////////////////////////
// alt_cal parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	alt_cal
#(	parameter	cal_bbpd_first = "FALSE",
	parameter	channel_address_width = 1,
	parameter	error_signals = "FALSE",
	parameter	number_of_channels = 1,
	parameter	sim_model_mode = "FALSE",
	parameter	watch_length = 100,
	parameter	lpm_type = "alt_cal")
(	output	wire	busy,
	output	wire	[number_of_channels-1:0]	cal_error,
	input	wire	clock,
	output	wire	[15:0]	dprio_addr,
	input	wire	dprio_busy,
	input	wire	[15:0]	dprio_datain,
	output	wire	[15:0]	dprio_dataout,
	output	wire	dprio_rden,
	output	wire	dprio_wren,
	output	wire	[8:0]	quad_addr,
	input	wire	[11:0]	remap_addr,
	input	wire	reset,
	output	wire	retain_addr,
	input	wire	start,
	input	wire	[number_of_channels*4-1:0]	testbuses,
	input	wire	transceiver_init)/* synthesis syn_black_box=1 */;

endmodule //alt_cal

//////////////////////////////////////////////////////////////////////////
// altdq_dqs parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altdq_dqs
#(	parameter	add_mem_fitter_group_assignments = "TRUE",
	parameter	delay_buffer_mode = "LOW",
	parameter	delay_dqs_enable_by_half_cycle = "FALSE",
	parameter	intended_device_family = "unused",
	parameter	dm_loc = "NONE",
	parameter	dq_half_rate_use_dataoutbypass = "FALSE",
	parameter	dq_input_reg_async_mode = "NONE",
	parameter	dq_input_reg_clk_source = "DQS_BUS",
	parameter	dq_input_reg_mode = "NONE",
	parameter	dq_input_reg_power_up = "LOW",
	parameter	dq_input_reg_sync_mode = "NONE",
	parameter	dq_input_reg_use_clkn = "FALSE",
	parameter	dq_ipa_add_input_cycle_delay = "FALSE",
	parameter	dq_ipa_add_phase_transfer_reg = "FALSE",
	parameter	dq_ipa_bypass_output_register = "FALSE",
	parameter	dq_ipa_invert_phase = "FALSE",
	parameter	dq_ipa_phase_setting = 0,
	parameter	dq_oe_reg_async_mode = "NONE",
	parameter	dq_oe_reg_mode = "NONE",
	parameter	dq_oe_reg_power_up = "LOW",
	parameter	dq_oe_reg_sync_mode = "NONE",
	parameter	dq_output_reg_async_mode = "NONE",
	parameter	dq_output_reg_mode = "NONE",
	parameter	dq_output_reg_power_up = "LOW",
	parameter	dq_output_reg_sync_mode = "NONE",
	parameter	dq_resync_reg_mode = "NONE",
	parameter	dqs_ctrl_latches_enable = "FALSE",
	parameter	dqs_delay_chain_delayctrlin_source = "CORE",
	parameter	dqs_delay_chain_phase_setting = 0,
	parameter	dqs_dqsn_mode = "NONE",
	parameter	dqs_enable_ctrl_add_phase_transfer_reg = "FALSE",
	parameter	dqs_enable_ctrl_invert_phase = "FALSE",
	parameter	dqs_enable_ctrl_phase_setting = 0,
	parameter	dqs_input_frequency = "UNUSED",
	parameter	dqs_oe_reg_async_mode = "NONE",
	parameter	dqs_oe_reg_mode = "NONE",
	parameter	dqs_oe_reg_power_up = "LOW",
	parameter	dqs_oe_reg_sync_mode = "NONE",
	parameter	dqs_offsetctrl_enable = "FALSE",
	parameter	dqs_output_reg_async_mode = "NONE",
	parameter	dqs_output_reg_mode = "NONE",
	parameter	dqs_output_reg_power_up = "LOW",
	parameter	dqs_output_reg_sync_mode = "NONE",
	parameter	dqs_phase_shift = 0,
	parameter	io_clock_divider_clk_source = "CORE",
	parameter	io_clock_divider_invert_phase = "FALSE",
	parameter	io_clock_divider_phase_setting = 0,
	parameter	level_dqs_enable = "FALSE",
	parameter	number_of_bidir_dq = 0,
	parameter	number_of_clk_divider = 0,
	parameter	number_of_dk = 0,
	parameter	number_of_dqs = 1,
	parameter	number_of_input_dq = 0,
	parameter	number_of_output_dq = 0,
	parameter	oct_reg_mode = "NONE",
	parameter	qvld_loc = "NONE",
	parameter	rldramii_mode = "NONE",
	parameter	use_dm = "FALSE",
	parameter	use_dq_input_delay_chain = "FALSE",
	parameter	use_dq_ipa = "FALSE",
	parameter	use_dq_ipa_phasectrlin = "TRUE",
	parameter	use_dq_oe_delay_chain1 = "FALSE",
	parameter	use_dq_oe_delay_chain2 = "FALSE",
	parameter	use_dq_oe_path = "FALSE",
	parameter	use_dq_output_delay_chain1 = "FALSE",
	parameter	use_dq_output_delay_chain2 = "FALSE",
	parameter	use_dqs = "FALSE",
	parameter	use_dqs_delay_chain = "FALSE",
	parameter	use_dqs_delay_chain_phasectrlin = "FALSE",
	parameter	use_dqs_enable = "FALSE",
	parameter	use_dqs_enable_ctrl = "FALSE",
	parameter	use_dqs_enable_ctrl_phasectrlin = "TRUE",
	parameter	use_dqs_input_delay_chain = "FALSE",
	parameter	use_dqs_input_path = "FALSE",
	parameter	use_dqs_oe_delay_chain1 = "FALSE",
	parameter	use_dqs_oe_delay_chain2 = "FALSE",
	parameter	use_dqs_oe_path = "FALSE",
	parameter	use_dqs_output_delay_chain1 = "FALSE",
	parameter	use_dqs_output_delay_chain2 = "FALSE",
	parameter	use_dqs_output_path = "FALSE",
	parameter	use_dqsbusout_delay_chain = "FALSE",
	parameter	use_dqsenable_delay_chain = "FALSE",
	parameter	use_dynamic_oct = "FALSE",
	parameter	use_half_rate = "FALSE",
	parameter	use_half_rate_on_input = "FALSE",
	parameter	use_half_rate_on_output = "FALSE",
	parameter	use_io_clock_divider_masterin = "FALSE",
	parameter	use_io_clock_divider_phasectrlin = "FALSE",
	parameter	use_io_clock_divider_slaveout = "FALSE",
	parameter	use_oct_delay_chain1 = "FALSE",
	parameter	use_oct_delay_chain2 = "FALSE",
	parameter	use_qvld = "FALSE",
	parameter	lpm_type = "altdq_dqs",
	parameter	lpm_hint = "unused")
(	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_areset,
	output	wire	[number_of_bidir_dq * 4-1:0]	bidir_dq_hr_input_data_out,
	input	wire	[number_of_bidir_dq * 2-1:0]	bidir_dq_hr_oe_in,
	input	wire	[number_of_bidir_dq * 4-1:0]	bidir_dq_hr_output_data_in,
	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_input_data_in,
	output	wire	[number_of_bidir_dq-1:0]	bidir_dq_input_data_out,
	output	wire	[number_of_bidir_dq-1:0]	bidir_dq_input_data_out_high,
	output	wire	[number_of_bidir_dq-1:0]	bidir_dq_input_data_out_low,
	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_io_config_ena,
	output	wire	[number_of_bidir_dq-1:0]	bidir_dq_oct_out,
	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_oe_in,
	output	wire	[number_of_bidir_dq-1:0]	bidir_dq_oe_out,
	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_output_data_in,
	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_output_data_in_high,
	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_output_data_in_low,
	output	wire	[number_of_bidir_dq-1:0]	bidir_dq_output_data_out,
	input	wire	[number_of_bidir_dq-1:0]	bidir_dq_sreset,
	input	wire	config_clk,
	input	wire	config_datain,
	input	wire	config_update,
	input	wire	[5:0]	core_delayctrlin,
	input	wire	[number_of_dk-1:0]	dk_areset,
	input	wire	[number_of_dk * 2-1:0]	dk_hr_oe_in,
	input	wire	[number_of_dk * 4-1:0]	dk_hr_output_data_in,
	input	wire	[number_of_dk-1:0]	dk_io_config_ena,
	input	wire	[number_of_dk-1:0]	dk_oe_in,
	output	wire	[number_of_dk-1:0]	dk_oe_out,
	input	wire	[number_of_dk-1:0]	dk_output_data_in,
	input	wire	[number_of_dk-1:0]	dk_output_data_in_high,
	input	wire	[number_of_dk-1:0]	dk_output_data_in_low,
	output	wire	[number_of_dk-1:0]	dk_output_data_out,
	input	wire	[number_of_dk-1:0]	dk_sreset,
	input	wire	[number_of_dk-1:0]	dkn_areset,
	input	wire	[number_of_dk * 2-1:0]	dkn_hr_oe_in,
	input	wire	[number_of_dk * 4-1:0]	dkn_hr_output_data_in,
	input	wire	[number_of_dk-1:0]	dkn_io_config_ena,
	input	wire	[number_of_dk-1:0]	dkn_oe_in,
	output	wire	[number_of_dk-1:0]	dkn_oe_out,
	input	wire	[number_of_dk-1:0]	dkn_output_data_in,
	input	wire	[number_of_dk-1:0]	dkn_output_data_in_high,
	input	wire	[number_of_dk-1:0]	dkn_output_data_in_low,
	output	wire	[number_of_dk-1:0]	dkn_output_data_out,
	input	wire	[number_of_dk-1:0]	dkn_sreset,
	input	wire	[5:0]	dll_delayctrlin,
	input	wire	dm_areset,
	input	wire	[1:0]	dm_hr_oe_in,
	input	wire	[3:0]	dm_hr_output_data_in,
	input	wire	dm_io_config_ena,
	input	wire	dm_oe_in,
	output	wire	dm_oe_out,
	input	wire	dm_output_data_in,
	input	wire	dm_output_data_in_high,
	input	wire	dm_output_data_in_low,
	output	wire	dm_output_data_out,
	input	wire	dm_sreset,
	input	wire	dq_hr_output_reg_clk,
	input	wire	dq_input_reg_clk,
	input	wire	dq_input_reg_clkena,
	input	wire	dq_ipa_clk,
	input	wire	dq_output_reg_clk,
	input	wire	dq_output_reg_clkena,
	input	wire	dq_resync_reg_clk,
	input	wire	[number_of_dqs-1:0]	dqs_areset,
	output	wire	[number_of_dqs-1:0]	dqs_bus_out,
	input	wire	dqs_config_ena,
	input	wire	dqs_enable_ctrl_clk,
	input	wire	dqs_enable_ctrl_hr_datainhi,
	input	wire	dqs_enable_ctrl_hr_datainlo,
	input	wire	dqs_enable_ctrl_in,
	input	wire	dqs_enable_in,
	input	wire	[number_of_dqs * 2-1:0]	dqs_hr_oe_in,
	input	wire	[number_of_dqs * 4-1:0]	dqs_hr_output_data_in,
	input	wire	dqs_hr_output_reg_clk,
	input	wire	[number_of_dqs-1:0]	dqs_input_data_in,
	output	wire	[number_of_dqs-1:0]	dqs_input_data_out,
	input	wire	[number_of_dqs-1:0]	dqs_io_config_ena,
	output	wire	dqs_oct_out,
	input	wire	[number_of_dqs-1:0]	dqs_oe_in,
	output	wire	[number_of_dqs-1:0]	dqs_oe_out,
	input	wire	[number_of_dqs-1:0]	dqs_output_data_in,
	input	wire	[number_of_dqs-1:0]	dqs_output_data_in_high,
	input	wire	[number_of_dqs-1:0]	dqs_output_data_in_low,
	output	wire	[number_of_dqs-1:0]	dqs_output_data_out,
	input	wire	dqs_output_reg_clk,
	input	wire	dqs_output_reg_clkena,
	input	wire	[number_of_dqs-1:0]	dqs_sreset,
	input	wire	[number_of_dqs-1:0]	dqsn_areset,
	output	wire	[number_of_dqs-1:0]	dqsn_bus_out,
	input	wire	[number_of_dqs * 2-1:0]	dqsn_hr_oe_in,
	input	wire	[number_of_dqs * 4-1:0]	dqsn_hr_output_data_in,
	input	wire	[number_of_dqs-1:0]	dqsn_input_data_in,
	output	wire	[number_of_dqs-1:0]	dqsn_input_data_out,
	input	wire	[number_of_dqs-1:0]	dqsn_io_config_ena,
	output	wire	dqsn_oct_out,
	input	wire	[number_of_dqs-1:0]	dqsn_oe_in,
	output	wire	[number_of_dqs-1:0]	dqsn_oe_out,
	input	wire	[number_of_dqs-1:0]	dqsn_output_data_in,
	input	wire	[number_of_dqs-1:0]	dqsn_output_data_in_high,
	input	wire	[number_of_dqs-1:0]	dqsn_output_data_in_low,
	output	wire	[number_of_dqs-1:0]	dqsn_output_data_out,
	input	wire	[number_of_dqs-1:0]	dqsn_sreset,
	input	wire	dqsupdateen,
	input	wire	[1:0]	hr_oct_in,
	input	wire	hr_oct_reg_clk,
	input	wire	[number_of_input_dq-1:0]	input_dq_areset,
	output	wire	[number_of_input_dq * 4-1:0]	input_dq_hr_input_data_out,
	input	wire	[number_of_input_dq-1:0]	input_dq_input_data_in,
	output	wire	[number_of_input_dq-1:0]	input_dq_input_data_out,
	output	wire	[number_of_input_dq-1:0]	input_dq_input_data_out_high,
	output	wire	[number_of_input_dq-1:0]	input_dq_input_data_out_low,
	input	wire	[number_of_input_dq-1:0]	input_dq_io_config_ena,
	output	wire	[number_of_input_dq-1:0]	input_dq_oct_out,
	input	wire	[number_of_input_dq-1:0]	input_dq_sreset,
	input	wire	io_clock_divider_clk,
	output	wire	[number_of_clk_divider-1:0]	io_clock_divider_clkout,
	input	wire	io_clock_divider_masterin,
	output	wire	io_clock_divider_slaveout,
	input	wire	oct_in,
	input	wire	oct_reg_clk,
	input	wire	[5:0]	offsetctrlin,
	input	wire	[number_of_output_dq-1:0]	output_dq_areset,
	input	wire	[number_of_output_dq * 2-1:0]	output_dq_hr_oe_in,
	input	wire	[number_of_output_dq * 4-1:0]	output_dq_hr_output_data_in,
	input	wire	[number_of_output_dq-1:0]	output_dq_io_config_ena,
	input	wire	[number_of_output_dq-1:0]	output_dq_oe_in,
	output	wire	[number_of_output_dq-1:0]	output_dq_oe_out,
	input	wire	[number_of_output_dq-1:0]	output_dq_output_data_in,
	input	wire	[number_of_output_dq-1:0]	output_dq_output_data_in_high,
	input	wire	[number_of_output_dq-1:0]	output_dq_output_data_in_low,
	output	wire	[number_of_output_dq-1:0]	output_dq_output_data_out,
	input	wire	[number_of_output_dq-1:0]	output_dq_sreset,
	input	wire	qvld_areset,
	output	wire	[3:0]	qvld_hr_input_data_out,
	input	wire	qvld_input_data_in,
	output	wire	qvld_input_data_out,
	output	wire	qvld_input_data_out_high,
	output	wire	qvld_input_data_out_low,
	input	wire	qvld_io_config_ena,
	output	wire	qvld_oct_out,
	input	wire	qvld_sreset)/* synthesis syn_black_box=1 */;

endmodule //altdq_dqs

//////////////////////////////////////////////////////////////////////////
// altfp_sqrt parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_sqrt
#(	parameter	intended_device_family = "unused",
	parameter	exception_handling = "YES",
	parameter	pipeline = 28,
	parameter	rounding = "TO_NEAREST",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_sqrt",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	data,
	output	wire	nan,
	output	wire	overflow,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_sqrt

//////////////////////////////////////////////////////////////////////////
// altsqrt parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altsqrt
#(	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altsqrt",
	parameter	pipeline = 0,
	parameter	q_port_width = 1,
	parameter	r_port_width = 1,
	parameter	width = 1)
(	input	wire	aclr,
	input	wire	clk,
	input	wire	ena,
	output	wire	[q_port_width-1:0]	q,
	input	wire	[width-1:0]	radical,
	output	wire	[r_port_width-1:0]	remainder) /* synthesis syn_black_box=1 */;
endmodule // altsqrt

//////////////////////////////////////////////////////////////////////////
// altsource_probe parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altsource_probe
#(	parameter	enable_metastability = "NO",
	parameter	instance_id = "UNUSED",
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altsource_probe",
	parameter	probe_width = 1,
	parameter	sld_auto_instance_index = "YES",
	parameter	sld_instance_index = 0,
	parameter	sld_ir_width = 4,
	parameter	sld_node_info = 4746752,
	parameter	source_initial_value = "0",
	parameter	source_width = 1)
(	input	wire	clrn,
	input	wire	ena,
	input	wire	[sld_ir_width-1:0]	ir_in,
	output	wire	[sld_ir_width-1:0]	ir_out,
	input	wire	jtag_state_cdr,
	input	wire	jtag_state_cir,
	input	wire	jtag_state_e1dr,
	input	wire	jtag_state_sdr,
	input	wire	jtag_state_tlr,
	input	wire	jtag_state_udr,
	input	wire	jtag_state_uir,
	input	wire	[probe_width-1:0]	probe,
	input	wire	raw_tck,
	output	wire	[source_width-1:0]	source,
	input	wire	source_clk,
	input	wire	source_ena,
	input	wire	tdi,
	output	wire	tdo,
	input	wire	usr1) /* synthesis syn_black_box=1 */;
endmodule // altsource_probe

//////////////////////////////////////////////////////////////////////////
// altddio_in parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altddio_in
#(	parameter	intended_device_family = "unused",
	parameter	implement_input_in_lcell = "ON",
	parameter	invert_input_clocks = "OFF",
	parameter	power_up_high = "OFF",
	parameter	width = 1,
	parameter	lpm_type = "altddio_in",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	aset,
	input	wire	[width-1:0]	datain,
	output	wire	[width-1:0]	dataout_h,
	output	wire	[width-1:0]	dataout_l,
	input	wire	inclock,
	input	wire	inclocken,
	input	wire	sclr,
	input	wire	sset)/* synthesis syn_black_box=1 */;

endmodule //altddio_in

//////////////////////////////////////////////////////////////////////////
// altclklock parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altclklock
#(	parameter	clock0_boost = 1,
	parameter	clock0_divide = 1,
	parameter	clock0_settings = "UNUSED",
	parameter	clock0_time_delay = 0,
	parameter	clock1_boost = 1,
	parameter	clock1_divide = 1,
	parameter	clock1_settings = "UNUSED",
	parameter	clock1_time_delay = 0,
	parameter	clock2_boost = 1,
	parameter	clock2_divide = 1,
	parameter	clock2_settings = "UNUSED",
	parameter	clock2_time_delay = 0,
	parameter	clock_ext_boost = 1,
	parameter	clock_ext_divide = 1,
	parameter	clock_ext_settings = "UNUSED",
	parameter	clock_ext_time_delay = 0,
	parameter	inclock_period = 10000,
	parameter	inclock_settings = "UNUSED",
	parameter	intended_device_family = "UNUSED",
	parameter	invalid_lock_cycles = 5,
	parameter	invalid_lock_multiplier = 5,
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altclklock",
	parameter	operation_mode = "UNUSED",
	parameter	outclock_phase_shift = 0,
	parameter	valid_lock_cycles = 5,
	parameter	valid_lock_multiplier = 5)
(	output	wire	clock0,
	output	wire	clock1,
	output	wire	clock2,
	output	wire	clock_ext,
	input	wire	fbin,
	input	wire	inclock,
	input	wire	inclocken,
	output	wire	locked) /* synthesis syn_black_box=1 */;
endmodule // altclklock

//////////////////////////////////////////////////////////////////////////
// altlvds_rx parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altlvds_rx
#(	parameter	buffer_implementation = "RAM",
	parameter	cds_mode = "UNUSED",
	parameter	common_rx_tx_pll = "ON",
	parameter	data_align_rollover = 4,
	parameter	data_rate = "UNUSED",
	parameter	deserialization_factor = 4,
	parameter	intended_device_family = "unused",
	parameter	dpa_initial_phase_value = 0,
	parameter	dpll_lock_count = 0,
	parameter	dpll_lock_window = 0,
	parameter	enable_dpa_align_to_rising_edge_only = "OFF",
	parameter	enable_dpa_calibration = "ON",
	parameter	enable_dpa_fifo = "OFF",
	parameter	enable_dpa_initial_phase_selection = "OFF",
	parameter	enable_dpa_mode = "OFF",
	parameter	enable_dpa_pll_calibration = "OFF",
	parameter	enable_soft_cdr_mode = "OFF",
	parameter	implement_in_les = "OFF",
	parameter	inclock_boost = 0,
	parameter	inclock_data_alignment = "EDGE_ALIGNED",
	parameter	inclock_period = 0,
	parameter	inclock_phase_shift = 0,
	parameter	input_data_rate = 0,
	parameter	lose_lock_on_one_change = "OFF",
	parameter	number_of_channels = 1,
	parameter	outclock_resource = "AUTO",
	parameter	pll_operation_mode = "NORMAL",
	parameter	pll_self_reset_on_loss_lock = "OFF",
	parameter	port_rx_channel_data_align = "PORT_CONNECTIVITY",
	parameter	port_rx_data_align = "PORT_CONNECTIVITY",
	parameter	refclk_frequency = "UNUSED",
	parameter	registered_data_align_input = "ON",
	parameter	registered_output = "ON",
	parameter	reset_fifo_at_first_lock = "ON",
	parameter	rx_align_data_reg = "RISING_EDGE",
	parameter	sim_dpa_is_negative_ppm_drift = "OFF",
	parameter	sim_dpa_net_ppm_variation = 0,
	parameter	sim_dpa_output_clock_phase_shift = 0,
	parameter	use_coreclock_input = "OFF",
	parameter	use_dpll_rawperror = "OFF",
	parameter	use_external_pll = "OFF",
	parameter	use_no_phase_shift = "ON",
	parameter	x_on_bitslip = "ON",
	parameter	lpm_type = "altlvds_rx",
	parameter	lpm_hint = "unused")
(	output	wire	dpa_pll_cal_busy,
	input	wire	dpa_pll_recal,
	input	wire	pll_areset,
	output	wire	[3:0]	pll_phasecounterselect,
	input	wire	pll_phasedone,
	output	wire	pll_phasestep,
	output	wire	pll_phaseupdown,
	output	wire	pll_scanclk,
	output	wire	[number_of_channels-1:0]	rx_cda_max,
	input	wire	[number_of_channels-1:0]	rx_cda_reset,
	input	wire	[number_of_channels-1:0]	rx_channel_data_align,
	input	wire	[number_of_channels-1:0]	rx_coreclk,
	input	wire	rx_data_align,
	input	wire	rx_data_align_reset,
	input	wire	rx_data_reset,
	input	wire	rx_deskew,
	output	wire	[number_of_channels-1:0]	rx_divfwdclk,
	input	wire	[number_of_channels-1:0]	rx_dpa_lock_reset,
	output	wire	[number_of_channels-1:0]	rx_dpa_locked,
	input	wire	[number_of_channels-1:0]	rx_dpll_enable,
	input	wire	[number_of_channels-1:0]	rx_dpll_hold,
	input	wire	[number_of_channels-1:0]	rx_dpll_reset,
	input	wire	rx_enable,
	input	wire	[number_of_channels-1:0]	rx_fifo_reset,
	input	wire	[number_of_channels-1:0]	rx_in,
	input	wire	rx_inclock,
	output	wire	rx_locked,
	output	wire	[deserialization_factor*number_of_channels-1:0]	rx_out,
	output	wire	rx_outclock,
	input	wire	rx_pll_enable,
	input	wire	rx_readclock,
	input	wire	[number_of_channels-1:0]	rx_reset,
	input	wire	rx_syncclock)/* synthesis syn_black_box=1 */;

endmodule //altlvds_rx

//////////////////////////////////////////////////////////////////////////
// altfp_mult parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altfp_mult
#(	parameter	dedicated_multiplier_circuitry = "YES",
	parameter	denormal_support = "YES",
	parameter	intended_device_family = "unused",
	parameter	exception_handling = "NO",
	parameter	pipeline = 5,
	parameter	reduced_functionality = "NO",
	parameter	rounding = "TO_NEAREST",
	parameter	width_exp = 8,
	parameter	width_man = 23,
	parameter	lpm_type = "altfp_mult",
	parameter	lpm_hint = "unused")
(	input	wire	aclr,
	input	wire	clk_en,
	input	wire	clock,
	input	wire	[width_exp+width_man+1-1:0]	dataa,
	input	wire	[width_exp+width_man+1-1:0]	datab,
	output	wire	denormal,
	output	wire	indefinite,
	output	wire	nan,
	output	wire	overflow,
	output	wire	[width_exp+width_man+1-1:0]	result,
	output	wire	underflow,
	output	wire	zero)/* synthesis syn_black_box=1 */;

endmodule //altfp_mult

//////////////////////////////////////////////////////////////////////////
// altsyncram parameterized megafunction component declaration
// Generated with 'clearbox' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module	altsyncram
#(	parameter	address_aclr_a = "UNUSED",
	parameter	address_aclr_b = "NONE",
	parameter	address_reg_b = "CLOCK1",
	parameter	byte_size = 8,
	parameter	byteena_aclr_a = "UNUSED",
	parameter	byteena_aclr_b = "NONE",
	parameter	byteena_reg_b = "CLOCK1",
	parameter	clock_enable_core_a = "USE_INPUT_CLKEN",
	parameter	clock_enable_core_b = "USE_INPUT_CLKEN",
	parameter	clock_enable_input_a = "NORMAL",
	parameter	clock_enable_input_b = "NORMAL",
	parameter	clock_enable_output_a = "NORMAL",
	parameter	clock_enable_output_b = "NORMAL",
	parameter	intended_device_family = "unused",
	parameter	ecc_pipeline_stage_enabled = "FALSE",
	parameter	enable_ecc = "FALSE",
	parameter	implement_in_les = "OFF",
	parameter	indata_aclr_a = "UNUSED",
	parameter	indata_aclr_b = "NONE",
	parameter	indata_reg_b = "CLOCK1",
	parameter	init_file = "UNUSED",
	parameter	init_file_layout = "PORT_A",
	parameter	maximum_depth = 0,
	parameter	numwords_a = 0,
	parameter	numwords_b = 0,
	parameter	operation_mode = "BIDIR_DUAL_PORT",
	parameter	outdata_aclr_a = "NONE",
	parameter	outdata_aclr_b = "NONE",
	parameter	outdata_reg_a = "UNREGISTERED",
	parameter	outdata_reg_b = "UNREGISTERED",
	parameter	power_up_uninitialized = "FALSE",
	parameter	ram_block_type = "AUTO",
	parameter	rdcontrol_aclr_b = "NONE",
	parameter	rdcontrol_reg_b = "CLOCK1",
	parameter	read_during_write_mode_mixed_ports = "DONT_CARE",
	parameter	read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ",
	parameter	read_during_write_mode_port_b = "NEW_DATA_NO_NBE_READ",
	parameter	stratixiv_m144k_allow_dual_clocks = "ON",
	parameter	width_a = 1,
	parameter	width_b = 1,
	parameter	width_byteena_a = 1,
	parameter	width_byteena_b = 1,
	parameter	width_eccstatus = 3,
	parameter	widthad_a = 1,
	parameter	widthad_b = 1,
	parameter	wrcontrol_aclr_a = "UNUSED",
	parameter	wrcontrol_aclr_b = "NONE",
	parameter	wrcontrol_wraddress_reg_b = "CLOCK1",
	parameter	lpm_type = "altsyncram",
	parameter	lpm_hint = "unused")
(	input	wire	aclr0,
	input	wire	aclr1,
	input	wire	[widthad_a-1:0]	address_a,
	input	wire	[widthad_b-1:0]	address_b,
	input	wire	addressstall_a,
	input	wire	addressstall_b,
	input	wire	[width_byteena_a-1:0]	byteena_a,
	input	wire	[width_byteena_b-1:0]	byteena_b,
	input	wire	clock0,
	input	wire	clock1,
	input	wire	clocken0,
	input	wire	clocken1,
	input	wire	clocken2,
	input	wire	clocken3,
	input	wire	[width_a-1:0]	data_a,
	input	wire	[width_b-1:0]	data_b,
	output	wire	[width_eccstatus-1:0]	eccstatus,
	output	wire	[width_a-1:0]	q_a,
	output	wire	[width_b-1:0]	q_b,
	input	wire	rden_a,
	input	wire	rden_b,
	input	wire	wren_a,
	input	wire	wren_b)/* synthesis syn_black_box=1 */;

endmodule //altsyncram

//////////////////////////////////////////////////////////////////////////
// altparallel_flash_loader parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altparallel_flash_loader
#(	parameter	addr_width = 20,
	parameter	auto_restart = "OFF",
	parameter	burst_mode = 0,
	parameter	burst_mode_intel = 0,
	parameter	burst_mode_numonyx = 0,
	parameter	burst_mode_spansion = 0,
	parameter	clk_divisor = 1,
	parameter	conf_data_width = 1,
	parameter	conf_wait_timer_width = 14,
	parameter	dclk_divisor = 1,
	parameter	decompressor_mode = "NONE",
	parameter	disable_crc_checkbox = 0,
	parameter	enhanced_flash_programming = 0,
	parameter	extra_addr_byte = 0,
	parameter	features_cfg = 1,
	parameter	features_pgm = 1,
	parameter	fifo_size = 16,
	parameter	flash_data_width = 16,
	parameter	flash_ecc_checkbox = 0,
	parameter	flash_nreset_checkbox = 0,
	parameter	flash_nreset_counter = 1,
	parameter	flash_type = "CFI_FLASH",
	parameter	lpm_hint = "UNUSED",
	parameter	lpm_type = "altparallel_flash_loader",
	parameter	n_flash = 1,
	parameter	nand_size = 67108864,
	parameter	normal_mode = 1,
	parameter	nrb_addr = 65667072,
	parameter	option_bits_start_address = 0,
	parameter	page_clk_divisor = 1,
	parameter	page_mode = 0,
	parameter	pfl_rsu_watchdog_enabled = 0,
	parameter	qflash_mfc = "ALTERA",
	parameter	rsu_watchdog_counter = 100000000,
	parameter	safe_mode_halt = 0,
	parameter	safe_mode_retry = 1,
	parameter	safe_mode_revert = 0,
	parameter	safe_mode_revert_addr = 0,
	parameter	tristate_checkbox = 0)
(	output	wire	[addr_width-1:0]	flash_addr,
	output	wire	flash_ale,
	output	wire	flash_cle,
	output	wire	flash_clk,
	inout	wire	[flash_data_width-1:0]	flash_data,
	inout	wire	[7:0]	flash_io,
	inout	wire	[n_flash-1:0]	flash_io0,
	inout	wire	[n_flash-1:0]	flash_io1,
	inout	wire	[n_flash-1:0]	flash_io2,
	inout	wire	[n_flash-1:0]	flash_io3,
	output	wire	flash_nadv,
	output	wire	[n_flash-1:0]	flash_nce,
	output	wire	[n_flash-1:0]	flash_ncs,
	output	wire	flash_noe,
	output	wire	flash_nreset,
	output	wire	flash_nwe,
	input	wire	flash_rdy,
	output	wire	[n_flash-1:0]	flash_sck,
	input	wire	fpga_conf_done,
	output	wire	[conf_data_width-1:0]	fpga_data,
	output	wire	fpga_dclk,
	output	wire	fpga_nconfig,
	input	wire	fpga_nstatus,
	input	wire	[2:0]	fpga_pgm,
	input	wire	pfl_clk,
	input	wire	pfl_flash_access_granted,
	output	wire	pfl_flash_access_request,
	input	wire	pfl_nreconfigure,
	input	wire	pfl_nreset,
	input	wire	pfl_reset_watchdog,
	output	wire	pfl_watchdog_error) /* synthesis syn_black_box=1 */;
endmodule // altparallel_flash_loader

module	altbarrel_shift	(
	aclr,
	clk_en,
	clock,
	data,
	direction,
	distance,
	overflow,
	result,
	underflow) /* synthesis syn_black_box */;

	parameter	intended_device_family = "unused";
	parameter	pipeline = 0;
	parameter	shiftdir = "LEFT";
	parameter	shifttype = "LOGICAL";
	parameter	width = 1;
	parameter	widthdist = 1;
	parameter	lpm_type = "altbarrel_shift";
	parameter	lpm_hint = "unused";

	input	aclr;
	input	clk_en;
	input	clock;
	input	[width-1:0]	data;
	input	direction;
	input	[widthdist-1:0]	distance;
	output	overflow;
	output	[width-1:0]	result;
	output	underflow;

endmodule //altbarrel_shift

module alt_bidir_diff (oe, bidirin, io, iobar);
    input oe;
    inout bidirin;
    inout io;
    inout iobar;
        
    parameter io_standard = "NONE";
    parameter current_strength = "NONE";
    parameter current_strength_new = "NONE";
    parameter slew_rate = -1;
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter input_termination = "NONE"; 
    parameter output_termination = "NONE"; 
    parameter lpm_type = "alt_bidir_diff";

endmodule

//////////////////////////////////////////////////////////////////////////
// altcam parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altcam(
	inaclr,
	inclock,
	inclocken,
	maddress,
	mbits,
	mcount,
	mfound,
	mnext,
	mstart,
	outaclr,
	outclock,
	outclocken,
	pattern,
	rdbusy,
	wraddress,
	wrbusy,
	wrdelete,
	wren,
	wrx,
	wrxused) /* synthesis syn_black_box=1 */;

	parameter	intended_device_family = "unused";
	parameter	lpm_file = "UNUSED";
	parameter	lpm_filex = "UNUSED";
	parameter	lpm_hint = "UNUSED";
	parameter	lpm_type = "altcam";
	parameter	match_mode = "MULTIPLE";
	parameter	numwords = 0;
	parameter	output_aclr = "ON";
	parameter	output_reg = "UNREGISTERED";
	parameter	pattern_aclr = "ON";
	parameter	pattern_reg = "INCLOCK";
	parameter	register_odd_match = "OFF";
	parameter	use_eab = "ON";
	parameter	use_wysiwyg = "ON";
	parameter	width = 1;
	parameter	widthad = 1;
	parameter	wraddress_aclr = "ON";
	parameter	wrcontrol_aclr = "ON";
	parameter	wrx_aclr = "ON";
	parameter	wrx_reg = "INCLOCK";


	input	inaclr;
	input	inclock;
	input	inclocken;
	output	[widthad-1:0]	maddress;
	output	[numwords-1:0]	mbits;
	output	[widthad-1:0]	mcount;
	output	mfound;
	input	mnext;
	input	mstart;
	input	outaclr;
	input	outclock;
	input	outclocken;
	input	[width-1:0]	pattern;
	output	rdbusy;
	input	[widthad-1:0]	wraddress;
	output	wrbusy;
	input	wrdelete;
	input	wren;
	input	[width-1:0]	wrx;
	input	wrxused;

endmodule // altcam

//////////////////////////////////////////////////////////////////////////
// altcdr_rx parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altcdr_rx(
	rx_aclr,
	rx_coreclock,
	rx_empty,
	rx_fifo_rden,
	rx_full,
	rx_in,
	rx_inclock,
	rx_locklost,
	rx_out,
	rx_outclock,
	rx_pll_aclr,
	rx_pll_locked,
	rx_rec_clk,
	rx_rlv) /* synthesis syn_black_box=1 */;

	parameter	bypass_fifo = "OFF";
	parameter	deserialization_factor = 1;
	parameter	inclock_boost = 0;
	parameter	inclock_period = 1;
	parameter	intended_device_family = "MERCURY";
	parameter	lpm_hint = "UNUSED";
	parameter	lpm_type = "altcdr_rx";
	parameter	number_of_channels = 1;
	parameter	run_length = 62;


	input	rx_aclr;
	input	rx_coreclock;
	output	[number_of_channels-1:0]	rx_empty;
	input	[number_of_channels-1:0]	rx_fifo_rden;
	output	[number_of_channels-1:0]	rx_full;
	input	[number_of_channels-1:0]	rx_in;
	input	rx_inclock;
	output	[number_of_channels-1:0]	rx_locklost;
	output	[deserialization_factor*number_of_channels-1:0]	rx_out;
	output	rx_outclock;
	input	rx_pll_aclr;
	output	rx_pll_locked;
	output	[number_of_channels-1:0]	rx_rec_clk;
	output	[number_of_channels-1:0]	rx_rlv;

endmodule // altcdr_rx

//////////////////////////////////////////////////////////////////////////
// altcdr_tx parameterized megafunction component declaration
// Generated with 'mega_defn_creator' loader - do not edit
//////////////////////////////////////////////////////////////////////////
module altcdr_tx(
	tx_aclr,
	tx_coreclock,
	tx_empty,
	tx_fifo_wren,
	tx_full,
	tx_in,
	tx_inclock,
	tx_out,
	tx_outclock,
	tx_pll_aclr,
	tx_pll_locked) /* synthesis syn_black_box=1 */;

	parameter	bypass_fifo = "OFF";
	parameter	deserialization_factor = 1;
	parameter	inclock_boost = 0;
	parameter	inclock_period = 1;
	parameter	intended_device_family = "MERCURY";
	parameter	lpm_hint = "UNUSED";
	parameter	lpm_type = "altcdr_tx";
	parameter	number_of_channels = 1;


	input	tx_aclr;
	input	tx_coreclock;
	output	[number_of_channels-1:0]	tx_empty;
	input	[number_of_channels-1:0]	tx_fifo_wren;
	output	[number_of_channels-1:0]	tx_full;
	input	[deserialization_factor*number_of_channels-1:0]	tx_in;
	input	tx_inclock;
	output	[number_of_channels-1:0]	tx_out;
	output	tx_outclock;
	input	tx_pll_aclr;
	output	tx_pll_locked;

endmodule // altcdr_tx

module  alt_exc_dpram (
        portaclk,
        portaena,
        portawe,
        portaaddr,
        portadatain,
        portadataout,
        portbclk,
        portbena,
        portbwe,
        portbaddr,
        portbdatain,
        portbdataout
        ) /* synthesis syn_black_box */ ;

        // default parameters
        parameter   width          = 32;
        parameter   addrwidth      = 14;
        parameter   depth          = 16384;
        parameter   ramblock       = 65535;
        parameter   operation_mode = "SINGLE_PORT";
        parameter   output_mode    = "REG";
        parameter   lpm_file       = "NONE";
        parameter   lpm_type       = "alt_exc_dpram";
   
        input  portaclk;
        input  portaena;
        input  portawe;
        input  [addrwidth-1:0] portaaddr;
        input  [width-1:0]     portadatain;
        output [width-1:0]     portadataout;
        input  portbclk;
        input  portbena;
        input  portbwe;
        input  [addrwidth-1:0] portbaddr;
        input  [width-1:0]     portbdatain;
        output [width-1:0]     portbdataout;

endmodule // alt_exc_dpram

module alt_exc_upcore (
        npor, clk_ref, nreset,
        intpld, intnmi, intuart, inttimer0, inttimer1, intcommtx, intcommrx, intproctimer, intprocbridge, perreset,
        debugrq, debugext0, debugext1, debugiebrkpt, debugdewpt, debugextin, debugack, debugrng0, debugrng1, debugextout,
        slavehclk, slavehwrite, slavehreadyi, slavehselreg, slavehsel, slavehmastlock, slavehaddr,
        slavehwdata, slavehtrans, slavehsize, slavehburst, slavehreadyo, slavebuserrint, slavehrdata, slavehresp,
        masterhclk, masterhrdata, masterhresp, masterhwrite, masterhlock, masterhbusreq, masterhaddr,
        masterhwdata, masterhtrans, masterhsize, masterhready, masterhburst, masterhgrant,
        lockreqdp0, lockreqdp1, lockgrantdp0, lockgrantdp1,
        ebiack, ebiwen, ebioen, ebiclk, ebibe, ebicsn, ebiaddr, ebidq,
        uarttxd, uartrtsn, uartdtrn, uartctsn, uartdsrn, uartrxd, uartdcdn, uartrin, 
        sdramclk, sdramclkn, sdramclke, sdramwen, sdramcasn, sdramrasn, sdramdqm,            
        sdramaddr, sdramcsn, sdramdq, sdramdqs, 
        intextpin, traceclk, tracesync, tracepipestat, tracepkt, 
        gpi, gpo
        ) /* synthesis syn_black_box */ ;

        parameter    processor = "ARM";
        parameter    source    = "";
        parameter    sdram_width    = 32;
        parameter    sdramdqm_width = 4;
        parameter    gpio_width     = 4;
        parameter    lpm_type = "alt_exc_upcore";

        input   npor, clk_ref;
        inout   nreset;

        input   [5:0] intpld;
        input   intnmi;
        output  intuart, inttimer0, inttimer1, intcommtx, intcommrx;
        output  intproctimer, intprocbridge;
        output  perreset;

        input   debugrq, debugext0, debugext1, debugiebrkpt, debugdewpt;
        input   [3:0] debugextin;
        output  debugack, debugrng0, debugrng1;
        output  [3:0] debugextout;

        input   slavehclk, slavehwrite, slavehreadyi, slavehselreg, slavehsel;
        input   slavehmastlock;
        input   [31:0] slavehaddr, slavehwdata;
        input   [1:0] slavehtrans, slavehsize;
        input   [2:0] slavehburst;
        output  slavehreadyo, slavebuserrint;
        output  [31:0] slavehrdata;
        output  [1:0] slavehresp;

        input   masterhclk;
        input   [31:0] masterhrdata;
        input   [1:0] masterhresp;
        output  masterhwrite, masterhlock,  masterhbusreq;
        output  [31:0] masterhaddr, masterhwdata;
        output  [1:0] masterhtrans, masterhsize;
        input   masterhready;
        output  [2:0] masterhburst;
        input   masterhgrant;

        input   lockreqdp0, lockreqdp1; 
        output  lockgrantdp0, lockgrantdp1;

        input   ebiack;
        output  ebiwen, ebioen, ebiclk;
        output  [1:0] ebibe;
        output  [3:0] ebicsn;
        output  [24:0] ebiaddr;
        inout   [15:0] ebidq;

        output  uarttxd, uartrtsn, uartdtrn;
        input   uartctsn, uartdsrn, uartrxd; 
        inout   uartdcdn, uartrin;

        output  sdramclk, sdramclkn, sdramclke;
        output  sdramwen, sdramcasn, sdramrasn;
        output  [sdramdqm_width-1:0] sdramdqm;     
        output  [14:0] sdramaddr;
        output  [1:0] sdramcsn;
        inout   [sdram_width-1:0] sdramdq;
        inout   [sdramdqm_width-1:0] sdramdqs;                 

        input   intextpin;
        output  traceclk, tracesync;
        output  [2:0] tracepipestat;
        output  [15:0] tracepkt;

        input   [gpio_width-1:0] gpi;
        output  [gpio_width-1:0] gpo;

endmodule    // alt_exc_upcore

module alt_inbuf (i, o);
    input i;
    output o;
    
    parameter io_standard = "NONE";
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter lpm_type = "alt_inbuf";
    
endmodule

module alt_inbuf_diff (i, ibar, o);
    input i;
    input ibar;
    output o;
        
    parameter io_standard = "NONE";
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter lpm_type = "alt_inbuf_diff";

endmodule

module alt_iobuf (i, oe, io, o);
    input i;
    input oe;
    inout io;
    output o;
    reg    o;

    parameter io_standard = "NONE";
    parameter current_strength = "NONE";
    parameter current_strength_new = "NONE";
    parameter slew_rate = -1;
    parameter slow_slew_rate = "NONE";
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter input_termination = "NONE"; 
    parameter output_termination = "NONE";     
    parameter lpm_type = "alt_iobuf";
    
endmodule

module alt_iobuf_diff (i, oe, io, iobar, o);
    input i;
    input oe;
    inout io;
    inout iobar;
    output o;
        
    parameter io_standard = "NONE";
    parameter current_strength = "NONE";
    parameter current_strength_new = "NONE";
    parameter slew_rate = -1;
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter input_termination = "NONE"; 
    parameter output_termination = "NONE"; 
    parameter lpm_type = "alt_iobuf_diff";

endmodule

module alt_outbuf (i, o);
    input i;
    output o;

    parameter io_standard = "NONE";
    parameter current_strength = "NONE";
    parameter current_strength_new = "NONE";
    parameter slew_rate = -1;
    parameter slow_slew_rate = "NONE";
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter lpm_type = "alt_outbuf";
    
endmodule

module alt_outbuf_diff (i, o, obar);
    input i;
    output o;
    output obar;
        
    parameter io_standard = "NONE";
    parameter current_strength = "NONE";
    parameter current_strength_new = "NONE";
    parameter slew_rate = -1;
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter lpm_type = "alt_outbuf_diff";

endmodule

module alt_outbuf_tri (i, oe, o);
    input i;
    input oe;
    output o;

    parameter io_standard = "NONE";
    parameter current_strength = "NONE";
    parameter current_strength_new = "NONE";
    parameter slew_rate = -1;
    parameter slow_slew_rate = "NONE";
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter lpm_type = "alt_outbuf_tri";
    
endmodule




module alt_outbuf_tri_diff (i, oe, o, obar);
    input i;
    input oe;
    output o;
    output obar;
        
    parameter io_standard = "NONE";
    parameter current_strength = "NONE";
    parameter current_strength_new = "NONE";
    parameter slew_rate = -1;
    parameter location = "NONE";
    parameter enable_bus_hold = "NONE";
    parameter weak_pull_up_resistor = "NONE"; 
    parameter termination = "NONE"; 
    parameter lpm_type = "alt_outbuf_tri_diff";
    
endmodule

module	altpriority_encoder	(
	aclr,
	clk_en,
	clock,
	data,
	q,
	zero) /* synthesis syn_black_box */;

	parameter	lsb_priority = "NO";
	parameter	pipeline = 0;
	parameter	width = 1;
	parameter	widthad = 1;
	parameter	lpm_type = "altpriority_encoder";
	parameter	lpm_hint = "unused";

	input	aclr;
	input	clk_en;
	input	clock;
	input	[width-1:0]	data;
	output	[widthad-1:0]	q;
	output	zero;

endmodule //altpriority_encoder

module	alt_zaccum	(
	aclr,
	add_sub,
	cin,
	clken,
	clock,
	cout,
	data,
	load_data,
	overflow,
	result,
	round,
	saturate,
	saturate_overflow,
	sign_data,
	zero_accum) /* synthesis syn_black_box */;

	parameter	intended_device_family = "unused";
	parameter	extra_latency = 0;
	parameter	lpm_representation = "UNSIGNED";
	parameter	round_fraction_width = 15;
	parameter	rounding = "NO";
	parameter	saturation = "NO";
	parameter	saturation_fraction_width = 31;
	parameter	width_fraction = 15;
	parameter	width_in = 1;
	parameter	width_out = 1;
	parameter	lpm_type = "alt_zaccum";
	parameter	lpm_hint = "unused";

	input	aclr;
	input	add_sub;
	input	cin;
	input	clken;
	input	clock;
	output	cout;
	input	[width_in-1:0]	data;
	input	[width_out-1:0]	load_data;
	output	overflow;
	output	[width_out-1:0]	result;
	input	round;
	input	saturate;
	output	saturate_overflow;
	input	sign_data;
	input	zero_accum;

endmodule //alt_zaccum

`end_keywords

//  End: Add extra cells from old altera_mf.v
