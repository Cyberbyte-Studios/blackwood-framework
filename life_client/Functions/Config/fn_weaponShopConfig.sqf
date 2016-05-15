CB_weapons = {
  _return = [

    ["CONF", "arifle_MX_Black_F", [], 5000],
    ["CONF", "hgun_Rook40_F", [], 1000],
    ["CONF", "hgun_ACPC2_F", [], 1000],
    ["CONF", "hgun_Pistol_heavy_01_F", [], 3000],
    ["CONF", "hgun_Pistol_heavy_02_F", [], 3000]
  ];

  _return;
};

CB_weaponItems = {
  private ["_itemClass", "_result"];
  _itemClass = param[0];
  switch (_itemClass) do {
    case "16Rnd_9x21_Mag": { _result = 250; };
		case "30Rnd_9x21_Mag": { _result = 500; };
		case "11Rnd_45ACP_Mag": { _result = 900; };
		case "9Rnd_45ACP_Mag": { _result = 700; };
		case "6Rnd_45ACP_Cylinder": { _result = 500; };
		case "30Rnd_45ACP_Mag_SMG_01": { _result = 1000; };
		case "30Rnd_45ACP_Mag_SMG_01_tracer_green": { _result = 1500; };
		case "30Rnd_556x45_Stanag": { _result = 1000; };
		case "30Rnd_556x45_Stanag_Tracer_Red": { _result = 1500; };
		case "30Rnd_556x45_Stanag_Tracer_Green": { _result = 1500; };
		case "30Rnd_556x45_Stanag_Tracer_Yellow": { _result = 1500; };
		case "20Rnd_556x45_UW_mag": { _result = 500; };
		case "30Rnd_65x39_caseless_mag": { _result = 1000; };
		case "30Rnd_65x39_caseless_green": { _result = 1500; };
		case "30Rnd_65x39_caseless_mag_Tracer": { _result = 1500; };
		case "30Rnd_65x39_caseless_green_mag_Tracer": { _result = 1500; };
		case "100Rnd_65x39_caseless_mag": { _result = 2800; };
		case "100Rnd_65x39_caseless_mag_Tracer": { _result = 2800; };
		case "200Rnd_65x39_cased_Box": { _result = 2500; };
		case "200Rnd_65x39_cased_Box_Tracer": { _result = 3500; };
		case "10Rnd_762x51_Mag": { _result = 2000; };
		case "20Rnd_762x51_Mag": { _result = 4000; };
		case "150Rnd_762x51_Box": { _result = 2500; };
		case "150Rnd_762x51_Box_Tracer": { _result = 3000; };
		case "5Rnd_127x108_Mag": { _result = 1500; };
		case "5Rnd_127x108_APDS_Mag": { _result = 2000; };
		case "3Rnd_Smoke_Grenade_Shell": { _result = 3000; };
		case "7Rnd_408_Mag": { _result = 1250; };
		case "UGL_FlareWhite_F": { _result = 5000; };
		case "1Rnd_Smoke_Grenade_shell": { _result = 1000; };
		case "DDOPP_1Rnd_X26": { _result = 0; };

		case "optic_Aco": { _result = 5000; };
		case "optic_ACO_grn": { _result = 5000; };
		case "optic_Aco_smg": { _result = 5000; };
		case "optic_ACO_grn_smg": { _result = 5000; };
		case "optic_Holosight": { _result = 5000; };
		case "optic_Holosight_smg": { _result = 5000; };
		case "optic_Hamr": { _result = 7000; };
		case "optic_Arco": { _result = 7000; };
		case "optic_MRD": { _result = 5000; };
		case "optic_SOS": { _result = 5000; };
		case "optic_MRCO": { _result = 10000; };
		case "optic_DMS": { _result = 40000; };
		case "optic_LRPS": { _result = 62000; };
		case "optic_NVS": { _result = 100000; };

		case "acc_flashlight": { _result = 2000; };
		case "acc_pointer_IR": { _result = 5000; };

		case "muzzle_snds_acp": { _result = 50000; };
		case "muzzle_snds_B": { _result = 160000; };
		case "muzzle_snds_H": { _result = 150000; };
		case "muzzle_snds_H_MG": { _result = 160000; };
		case "muzzle_snds_L": { _result = 155000; };
		case "muzzle_snds_M": { _result = 100000; };

    case default {
        _result = 50;
    };
  };

  _result;
};
