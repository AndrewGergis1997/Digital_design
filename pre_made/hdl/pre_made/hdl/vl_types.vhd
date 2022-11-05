--
--  Copyright Model Technology, a  Mentor Graphics
--  Corporation company 2003, - All rights reserved.
-- 
package vl_types is
	type vl_value is (v0, v1, vZ, vX);

	type vl_strength is (vHi, vSm, vMe, vWe, vLa, vPu, vSt, vSu);

	type vl_ulogic is (
		Hi0,	Hi1,	HiZ,	HiX,
		v010,	v011,	v01Z,	SmH,
		v020,	v021,	v02Z,	MeH,
		v030,	v031,	v03Z,	WeH,
		v040,	v041,	v04Z,	LaH,
		v050,	v051,	v05Z,	PuH,
		v060,	v061,	v06Z,	StH,
		v070,	v071,	v07Z,	SuH,
		v100,	v101,	v10Z,	SmL,
		Sm0,	Sm1,	SmZ,	SmX,
		v120,	v121,	v12Z,	v12X,
		v130,	v131,	v13Z,	v13X,
		v140,	v141,	v14Z,	v14X,
		v150,	v151,	v15Z,	v15X,
		v160,	v161,	v16Z,	v16X,
		v170,	v171,	v17Z,	v17X,
		v200,	v201,	v20Z,	MeL,
		v210,	v211,	v21Z,	v21X,
		Me0,	Me1,	MeZ,	MeX,
		v230,	v231,	v23Z,	v23X,
		v240,	v241,	v24Z,	v24X,
		v250,	v251,	v25Z,	v25X,
		v260,	v261,	v26Z,	v26X,
		v270,	v271,	v27Z,	v27X,
		v300,	v301,	v30Z,	WeL,
		v310,	v311,	v31Z,	v31X,
		v320,	v321,	v32Z,	v32X,
		We0,	We1,	WeZ,	WeX,
		v340,	v341,	v34Z,	v34X,
		v350,	v351,	v35Z,	v35X,
		v360,	v361,	v36Z,	v36X,
		v370,	v371,	v37Z,	v37X,
		v400,	v401,	v40Z,	LaL,
		v410,	v411,	v41Z,	v41X,
		v420,	v421,	v42Z,	v42X,
		v430,	v431,	v43Z,	v43X,
		La0,	La1,	LaZ,	LaX,
		v450,	v451,	v45Z,	v45X,
		v460,	v461,	v46Z,	v46X,
		v470,	v471,	v47Z,	v47X,
		v500,	v501,	v50Z,	PuL,
		v510,	v511,	v51Z,	v51X,
		v520,	v521,	v52Z,	v52X,
		v530,	v531,	v53Z,	v53X,
		v540,	v541,	v54Z,	v54X,
		Pu0,	Pu1,	PuZ,	PuX,
		v560,	v561,	v56Z,	v56X,
		v570,	v571,	v57Z,	v57X,
		v600,	v601,	v60Z,	StL,
		v610,	v611,	v61Z,	v61X,
		v620,	v621,	v62Z,	v62X,
		v630,	v631,	v63Z,	v63X,
		v640,	v641,	v64Z,	v64X,
		v650,	v651,	v65Z,	v65X,
		St0,	St1,	StZ,	StX,
		v670,	v671,	v67Z,	v67X,
		v700,	v701,	v70Z,	SuL,
		v710,	v711,	v71Z,	v71X,
		v720,	v721,	v72Z,	v72X,
		v730,	v731,	v73Z,	v73X,
		v740,	v741,	v74Z,	v74X,
		v750,	v751,	v75Z,	v75X,
		v760,	v761,	v76Z,	v76X,
		Su0,	Su1,	SuZ,	SuX );

	type vl_ulogic_vector is array (natural range <>) of vl_ulogic;

	function resolved (s : vl_ulogic_vector) return vl_ulogic;

	subtype vl_logic is resolved vl_ulogic;

	type vl_logic_vector is array (natural range <>) of vl_logic;

	function to_bit (s : vl_ulogic) return bit;
	function to_bitvector (s : vl_ulogic_vector) return bit_vector;
	function to_bitvector (s : vl_logic_vector) return bit_vector;

	function to_vlULogic (s : bit) return vl_ulogic;
	function to_vlULogicVector (s : bit_vector) return vl_ulogic_vector;
	function to_vlLogicVector (s : bit_vector) return vl_logic_vector;
end vl_types;
