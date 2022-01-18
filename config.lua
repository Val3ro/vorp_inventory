Config = {
    defaultlang = "es_lang",
    OpenKey = 0xC1989F95,
    DropOnRespawn = {
        Money = false,
        Weapons = false,
        Items = false
    },
    MaxItemsInInventory = {
        Weapons = 900,
        Items = 132
    },
    startItems = {
        {
            consumable_coffee = 5,
            bread = 5,
            gold = 1
        }
    },
    Weapons = {
        {
            Name = "Lasso",
            HashName = "WEAPON_LASSO",
            WeaponModel = "w_melee_lasso01",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Canne à pêche",
            HashName = "WEAPON_FISHINGROD",
            WeaponModel = "w_melee_fishingpole02",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Couteau de chasse",
            HashName = "WEAPON_MELEE_KNIFE",
            WeaponModel = "w_melee_knife02",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {
                {
                    w_melee_knife02_grip1 = 0
                }
            }
        },
        {
            Name = "Couteau de guerre civile",
            HashName = "WEAPON_MELEE_KNIFE_CIVIL_WAR",
            WeaponModel = "w_melee_knife16",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Couteau en os de mâchoire",
            HashName = "WEAPON_MELEE_KNIFE_JAWBONE",
            WeaponModel = "w_melee_knife03",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Couteau de mineur",
            HashName = "WEAPON_MELEE_KNIFE_MINER",
            WeaponModel = "w_melee_knife14",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Couteau de vampire",
            HashName = "WEAPON_MELEE_KNIFE_VAMPIRE",
            WeaponModel = "w_melee_knife18",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Couteau de boucher",
            HashName = "WEAPON_MELEE_CLEAVER",
            WeaponModel = "w_melee_hatchet02",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Hache",
            HashName = "WEAPON_MELEE_HATCHET",
            WeaponModel = "w_melee_hatchet01",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Jumelles",
            HashName = "WEAPON_KIT_BINOCULARS",
            WeaponModel = "w_binoculars01x",
            Price = 250.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Lanterne Electrique",
            HashName = "WEAPON_MELEE_LANTERN_ELECTRIC",
            WeaponModel = "w_throw_lantern01",
            Price = 25.0,
            AmmoHash = {},
            CompsHash = {
                {
                    p_lantern04x = 0
                }
            }
        },
        {
            Name = "Hache à double pointe",
            HashName = "WEAPON_MELEE_HATCHET_DOUBLE_BIT",
            WeaponModel = "w_melee_hatchet06",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Hache de coupe",
            HashName = "WEAPON_MELEE_HATCHET_HEWING",
            WeaponModel = "w_melee_hatchet05",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Hache de chasseur",
            HashName = "WEAPON_MELEE_HATCHET_HUNTER",
            WeaponModel = "w_melee_hatchet07",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Hache de viking",
            HashName = "WEAPON_MELEE_HATCHET_VIKING",
            WeaponModel = "w_melee_hatchet04",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Tomahawk",
            HashName = "WEAPON_THROWN_TOMAHAWK",
            WeaponModel = "w_melee_tomahawk01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_TOMAHAWK = 2,
                    AMMO_TOMAHAWK_IMPROVED = 2,
                    AMMO_TOMAHAWK_HOMING = 2
                }
            },
            CompsHash = {}
        },
        {
            Name = "Couteaux à lancer",
            HashName = "WEAPON_THROWN_THROWING_KNIVES",
            WeaponModel = "w_melee_knife05",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_THROWING_KNIVES = 2,
                    AMMO_THROWING_KNIVES_IMPROVED = 2,
                    AMMO_THROWING_KNIVES_POISON = 2
                }
            },
            CompsHash = {}
        },
        {
            Name = "Machette",
            HashName = "WEAPON_MELEE_MACHETE",
            WeaponModel = "w_melee_machete01",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {}
        },
        {
            Name = "Arc",
            HashName = "WEAPON_BOW",
            WeaponModel = "w_sp_bowarrow",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_ARROW = 0.25,
                    AMMO_ARROW_DYNAMITE = 0.25,
                    AMMO_ARROW_FIRE = 0.25,
                    AMMO_ARROW_IMPROVED = 0.25,
                    AMMO_ARROW_POISON = 0.25,
                    AMMO_ARROW_SMALL_GAME = 0.25
                }
            },
            CompsHash = {}
        },
        {
            Name = "Pistolet semi-automatique",
            HashName = "WEAPON_PISTOL_SEMIAUTO",
            WeaponModel = "w_pistol_semiauto01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_PISTOL = 0.25,
                    AMMO_PISTOL_EXPRESS = 0.25,
                    AMMO_PISTOL_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_PISTOL_HIGH_VELOCITY = 0.25,
                    AMMO_PISTOL_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_pistol_semiauto01_sight1 = 0,
                    w_pistol_semiauto01_sight2 = 10,
                    w_pistol_semiauto01_grip1 = 0,
                    w_pistol_semiauto01_grip2 = 10,
                    w_pistol_semiauto01_grip3 = 10,
                    w_pistol_semiauto01_grip4 = 10,
                    w_pistol_semiauto01_clip = 0,
                    w_pistol_semiauto01_barrel1 = 0,
                    w_pistol_semiauto01_barrel2 = 10
                }
            }
        },
        {
            Name = "Pistolet Mauser",
            HashName = "WEAPON_PISTOL_MAUSER",
            WeaponModel = "w_pistol_mauser01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_PISTOL = 0.25,
                    AMMO_PISTOL_EXPRESS = 0.25,
                    AMMO_PISTOL_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_PISTOL_HIGH_VELOCITY = 0.25,
                    AMMO_PISTOL_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_pistol_mauser01_sight1 = 0,
                    w_pistol_mauser01_sight2 = 10,
                    w_pistol_mauser01_grip1 = 0,
                    w_pistol_mauser01_grip2 = 10,
                    w_pistol_mauser01_grip3 = 10,
                    w_pistol_mauser01_grip4 = 10,
                    w_pistol_mauser01_clip = 0,
                    w_pistol_mauser01_barrel1 = 0,
                    w_pistol_mauser01_barrel2 = 10
                }
            }
        },
        {
            Name = "Pistolet volcanique",
            HashName = "WEAPON_PISTOL_VOLCANIC",
            WeaponModel = "w_pistol_volcanic01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_PISTOL = 0.25,
                    AMMO_PISTOL_EXPRESS = 0.25,
                    AMMO_PISTOL_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_PISTOL_HIGH_VELOCITY = 0.25,
                    AMMO_PISTOL_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_pistol_volcanic01_sight1 = 0,
                    w_pistol_volcanic01_sight2 = 10,
                    w_pistol_volcanic01_grip1 = 0,
                    w_pistol_volcanic01_grip2 = 10,
                    w_pistol_volcanic01_grip3 = 10,
                    w_pistol_volcanic01_grip4 = 10,
                    w_pistol_volcanic01_barrel01 = 0,
                    w_pistol_volcanic01_barrel02 = 10
                }
            }
        },
        {
            Name = "Pistolet M1899",
            HashName = "WEAPON_PISTOL_M1899",
            WeaponModel = "w_pistol_m189902",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_PISTOL = 0.25,
                    AMMO_PISTOL_EXPRESS = 0.25,
                    AMMO_PISTOL_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_PISTOL_HIGH_VELOCITY = 0.25,
                    AMMO_PISTOL_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_pistol_m189902_sight1 = 0,
                    w_pistol_m189902_sight2 = 10,
                    w_pistol_m189902_grip1 = 0,
                    w_pistol_m189902_grip2 = 10,
                    w_pistol_m189902_grip3 = 10,
                    w_pistol_m189902_grip4 = 10,
                    w_pistol_m189902_clip1 = 0,
                    w_pistol_m189902_barrel01 = 0,
                    w_pistol_m189902_barrel02 = 10
                }
            }
        },
        {
            Name = "Revolver Schofield",
            HashName = "WEAPON_REVOLVER_SCHOFIELD",
            WeaponModel = "w_revolver_schofield01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REVOLVER = 0.25,
                    AMMO_REVOLVER_EXPRESS = 0.25,
                    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REVOLVER_HIGH_VELOCITY = 0.25,
                    AMMO_REVOLVER_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_revolver_schofield01_sight1 = 0,
                    w_revolver_schofield01_sight2 = 10,
                    w_revolver_schofield01_grip1 = 0,
                    w_revolver_schofield01_grip2 = 10,
                    w_revolver_schofield01_grip3 = 10,
                    w_revolver_schofield01_grip4 = 10,
                    w_revolver_schofield01_barrel01 = 0,
                    w_revolver_schofield01_barrel02 = 10
                }
            }
        },
        {
            Name = "Revolver LeMat",
            HashName = "WEAPON_REVOLVER_LEMAT",
            WeaponModel = "w_revolver_lemat01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REVOLVER = 0.25,
                    AMMO_REVOLVER_EXPRESS = 0.25,
                    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REVOLVER_HIGH_VELOCITY = 0.25,
                    AMMO_REVOLVER_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_revolver_lemat01_sight1 = 0,
                    w_revolver_lemat01_sight2 = 10,
                    w_revolver_lemat01_grip1 = 0,
                    w_revolver_lemat01_grip2 = 10,
                    w_revolver_lemat01_grip3 = 10,
                    w_revolver_lemat01_grip4 = 10,
                    w_revolver_lemat01_barrel01 = 0,
                    w_revolver_lemat01_barrel02 = 10
                }
            }
        },
        {
            Name = "Revolver double action",
            HashName = "WEAPON_REVOLVER_DOUBLEACTION",
            WeaponModel = "w_revolver_doubleaction01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REVOLVER = 0.25,
                    AMMO_REVOLVER_EXPRESS = 0.25,
                    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REVOLVER_HIGH_VELOCITY = 0.25,
                    AMMO_REVOLVER_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_revolver_doubleaction01_sight1 = 0,
                    w_revolver_doubleaction01_sight2 = 10,
                    w_revolver_doubleaction01_grip1 = 0,
                    w_revolver_doubleaction01_grip2 = 10,
                    w_revolver_doubleaction01_grip3 = 10,
                    w_revolver_doubleaction01_grip4 = 10,
                    w_revolver_doubleaction01_grip5 = 10,
                    w_revolver_doubleaction01_barrel01 = 0,
                    w_revolver_doubleaction01_barrel02 = 10
                }
            }
        },
        {
            Name = "Revolver Cattleman",
            HashName = "WEAPON_REVOLVER_CATTLEMAN",
            WeaponModel = "w_revolver_cattleman01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REVOLVER = 0.25,
                    AMMO_REVOLVER_EXPRESS = 0.25,
                    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REVOLVER_HIGH_VELOCITY = 0.25,
                    AMMO_REVOLVER_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_revolver_cattleman01_sight1 = 0,
                    w_revolver_cattleman01_sight2 = 10,
                    w_revolver_cattleman01_grip1 = 0,
                    w_revolver_cattleman01_grip2 = 10,
                    w_revolver_cattleman01_grip3 = 10,
                    w_revolver_cattleman01_grip4 = 10,
                    w_revolver_cattleman01_grip5 = 10,
                    w_revolver_cattleman01_barrel01 = 0,
                    w_revolver_cattleman01_barrel02 = 10
                }
            }
        },
        {
            Name = "Fusil Varmint",
            HashName = "WEAPON_RIFLE_VARMINT",
            WeaponModel = "w_repeater_pumpaction01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_RIFLE_VARMINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_repeater_pumpaction01_wrap1 = 0,
                    w_repeater_pumpaction01_sight1 = 0,
                    w_repeater_pumpaction01_sight2 = 10,
                    w_repeater_pumpaction01_grip1 = 0,
                    w_repeater_pumpaction01_grip2 = 10,
                    w_repeater_pumpaction01_grip3 = 10,
                    w_repeater_pumpaction01_clip1 = 0,
                    w_repeater_pumpaction01_clip2 = 10,
                    w_repeater_pumpaction01_clip3 = 10
                }
            }
        },
        {
            Name = "Fusil Winchester",
            HashName = "WEAPON_REPEATER_WINCHESTER",
            WeaponModel = "w_repeater_winchester01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REPEATER = 0.25,
                    AMMO_REPEATER_EXPRESS = 0.25,
                    AMMO_REPEATER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REPEATER_HIGH_VELOCITY = 0.25
                }
            },
            CompsHash = {
                {
                    w_repeater_winchester01_wrap1 = 0,
                    w_repeater_winchester01_sight1 = 0,
                    w_repeater_winchester01_sight2 = 10,
                    w_repeater_winchester01_grip1 = 0,
                    w_repeater_winchester01_grip2 = 10,
                    w_repeater_winchester01_grip3 = 10
                }
            }
        },
        {
            Name = "Fusil Henry",
            HashName = "WEAPON_REPEATER_HENRY",
            WeaponModel = "w_repeater_henry01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REPEATER = 0.25,
                    AMMO_REPEATER_EXPRESS = 0.25,
                    AMMO_REPEATER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REPEATER_HIGH_VELOCITY = 0.25
                }
            },
            CompsHash = {
                {
                    w_repeater_henry01_wrap1 = 0,
                    w_repeater_henry01_sight1 = 0,
                    w_repeater_henry01_sight2 = 10,
                    w_repeater_henry01_grip1 = 0,
                    w_repeater_henry01_grip2 = 10,
                    w_repeater_henry01_grip3 = 10
                }
            }
        },
        {
            Name = "Fusil Evans",
            HashName = "WEAPON_REPEATER_EVANS",
            WeaponModel = "w_repeater_evans01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REPEATER = 0.25,
                    AMMO_REPEATER_EXPRESS = 0.25,
                    AMMO_REPEATER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REPEATER_HIGH_VELOCITY = 0.25
                }
            },
            CompsHash = {
                {
                    w_repeater_evans01_wrap1 = 0,
                    w_repeater_evans01_sight1 = 0,
                    w_repeater_evans01_sight2 = 10,
                    w_repeater_evans01_grip1 = 0,
                    w_repeater_evans01_grip2 = 10,
                    w_repeater_evans01_grip3 = 10
                }
            }
        },
        {
            Name = "Carabine à répétition",
            HashName = "WEAPON_REPEATER_CARBINE",
            WeaponModel = "w_repeater_carbine01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_REPEATER = 0.25,
                    AMMO_REPEATER_EXPRESS = 0.25,
                    AMMO_REPEATER_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_REPEATER_HIGH_VELOCITY = 0.25
                }
            },
            CompsHash = {
                {
                    w_repeater_carbine01_wrap1 = 0,
                    w_repeater_carbine01_sight1 = 0,
                    w_repeater_carbine01_sight2 = 10,
                    w_repeater_carbine01_grip1 = 0,
                    w_repeater_carbine01_grip2 = 10,
                    w_repeater_carbine01_grip3 = 10,
                    w_repeater_carbine01_clip1 = 0
                }
            }
        },
        {
            Name = "Fusil Rolling Block",
            HashName = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
            WeaponModel = "w_rifle_rollingblock01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_RIFLE = 0.25,
                    AMMO_RIFLE_EXPRESS = 0.25,
                    AMMO_RIFLE_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_RIFLE_HIGH_VELOCITY = 0.25,
                    AMMO_RIFLE_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_rifle_rollingblock01_wrap1 = 0,
                    w_rifle_rollingblock01_sight2 = 10,
                    w_rifle_rollingblock01_sight1 = 0,
                    w_rifle_rollingblock01_grip1 = 0,
                    w_rifle_rollingblock01_grip2 = 10,
                    w_rifle_rollingblock01_grip3 = 10,
                    w_rifle_scopeinner01 = 0,
                    w_rifle_scope04 = 10,
                    w_rifle_scope03 = 10,
                    w_rifle_scope02 = 10,
                    w_rifle_cs_strap01 = 0
                }
            }
        },
        {
            Name = "Fusil Carcano",
            HashName = "WEAPON_SNIPERRIFLE_CARCANO",
            WeaponModel = "w_rifle_carcano01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_RIFLE = 0.25,
                    AMMO_RIFLE_EXPRESS = 0.25,
                    AMMO_RIFLE_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_RIFLE_HIGH_VELOCITY = 0.25,
                    AMMO_RIFLE_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_rifle_carcano01_wrap1 = 0,
                    w_rifle_carcano01_sight2 = 10,
                    w_rifle_carcano01_sight1 = 0,
                    w_rifle_carcano01_grip1 = 0,
                    w_rifle_carcano01_grip2 = 10,
                    w_rifle_carcano01_grip3 = 10,
                    w_rifle_carcano01_clip = 0,
                    w_rifle_carcano01_clip2 = 10,
                    w_rifle_scopeinner01 = 0,
                    w_rifle_scope04 = 10,
                    w_rifle_scope03 = 10,
                    w_rifle_scope02 = 10,
                    w_rifle_cs_strap01 = 0
                }
            }
        },
        {
            Name = "Fusil Springfield",
            HashName = "WEAPON_RIFLE_SPRINGFIELD",
            WeaponModel = "w_rifle_springfield01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_RIFLE = 0.25,
                    AMMO_RIFLE_EXPRESS = 0.25,
                    AMMO_RIFLE_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_RIFLE_HIGH_VELOCITY = 0.25,
                    AMMO_RIFLE_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_rifle_springfield01_wrap1 = 0,
                    w_rifle_springfield01_sight2 = 10,
                    w_rifle_springfield01_sight1 = 0,
                    w_rifle_springfield01_grip1 = 0,
                    w_rifle_springfield01_grip2 = 10,
                    w_rifle_springfield01_grip3 = 10,
                    w_rifle_scopeinner01 = 0,
                    w_rifle_scope04 = 10,
                    w_rifle_scope03 = 10,
                    w_rifle_scope02 = 10,
                    w_rifle_cs_strap01 = 0
                }
            }
        },
        {
            Name = "Fusil à verrou",
            HashName = "WEAPON_RIFLE_BOLTACTION",
            WeaponModel = "w_rifle_boltaction01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_RIFLE = 0.25,
                    AMMO_RIFLE_EXPRESS = 0.25,
                    AMMO_RIFLE_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_RIFLE_HIGH_VELOCITY = 0.25,
                    AMMO_RIFLE_SPLIT_POINT = 0.25
                }
            },
            CompsHash = {
                {
                    w_rifle_boltaction01_wrap1 = 0,
                    w_rifle_boltaction01_sight1 = 0,
                    w_rifle_boltaction01_sight2 = 10,
                    w_rifle_boltaction01_grip1 = 0,
                    w_rifle_boltaction01_grip2 = 10,
                    w_rifle_boltaction01_grip3 = 10
                }
            }
        },
        {
            Name = "Fusil de chasse semi-automatique",
            HashName = "WEAPON_SHOTGUN_SEMIAUTO",
            WeaponModel = "w_shotgun_semiauto01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_SHOTGUN = 0.25,
                    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 0.25,
                    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_SHOTGUN_SLUG = 0.25
                }
            },
            CompsHash = {
                {
                    w_shotgun_semiauto01_wrap1 = 0,
                    w_shotgun_semiauto01_sight1 = 0,
                    w_shotgun_semiauto01_sight2 = 10,
                    w_shotgun_semiauto01_grip1 = 0,
                    w_shotgun_semiauto01_grip2 = 10,
                    w_shotgun_semiauto01_grip3 = 10,
                    w_shotgun_semiauto01_barrel1 = 0,
                    w_shotgun_semiauto01_barrel2 = 10
                }
            }
        },
        {
            Name = "Fusil à canon scié",
            HashName = "WEAPON_SHOTGUN_SAWEDOFF",
            WeaponModel = "w_shotgun_sawed01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_SHOTGUN = 0.25,
                    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 0.25,
                    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_SHOTGUN_SLUG = 0.25
                }
            },
            CompsHash = {
                {
                    w_shotgun_sawed01_wrap1 = 0,
                    w_shotgun_sawed01_sight1 = 0,
                    w_shotgun_sawed01_sight2 = 10,
                    w_shotgun_sawed01_grip1 = 0,
                    w_shotgun_sawed01_grip2 = 10,
                    w_shotgun_sawed01_grip3 = 10,
                    w_shotgun_sawed01_stock1 = 0,
                    w_shotgun_sawed01_stock2 = 10,
                    w_shotgun_sawed01_stock3 = 10
                }
            }
        },
        {
            Name = "Fusil à répétition",
            HashName = "WEAPON_SHOTGUN_REPEATING",
            WeaponModel = "w_shotgun_repeating01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_SHOTGUN = 0.25,
                    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 0.25,
                    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_SHOTGUN_SLUG = 0.25
                }
            },
            CompsHash = {
                {
                    w_shotgun_repeating01_wrap1 = 0,
                    w_shotgun_repeating01_sight1 = 0,
                    w_shotgun_repeating01_sight2 = 10,
                    w_shotgun_repeating01_grip1 = 0,
                    w_shotgun_repeating01_grip2 = 10,
                    w_shotgun_repeating01_grip3 = 10,
                    w_shotgun_repeating01_barrel1 = 0,
                    w_shotgun_repeating01_barrel2 = 10
                }
            }
        },
        {
            Name = "Fusil à glissière",
            HashName = "WEAPON_SHOTGUN_PUMP",
            WeaponModel = "w_shotgun_pumpaction01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_SHOTGUN = 0.25,
                    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 0.25,
                    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_SHOTGUN_SLUG = 0.25
                }
            },
            CompsHash = {
                {
                    w_shotgun_pumpaction01_wrap1 = 0,
                    w_shotgun_pumpaction01_sight1 = 0,
                    w_shotgun_pumpaction01_sight2 = 10,
                    w_shotgun_pumpaction01_grip1 = 0,
                    w_shotgun_pumpaction01_grip2 = 10,
                    w_shotgun_pumpaction01_grip3 = 10,
                    w_shotgun_pumpaction01_barrel1 = 0,
                    w_shotgun_pumpaction01_barrel2 = 10,
                    w_shotgun_pumpaction01_clip1 = 0,
                    w_shotgun_pumpaction01_clip2 = 10,
                    w_shotgun_pumpaction01_clip3 = 10
                }
            }
        },
        {
            Name = "Fusil de chasse à double canon",
            HashName = "WEAPON_SHOTGUN_DOUBLEBARREL",
            WeaponModel = "w_shotgun_doublebarrel01",
            Price = 100.0,
            AmmoHash = {
                {
                    AMMO_SHOTGUN = 0.25,
                    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 0.25,
                    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = 0.25,
                    AMMO_SHOTGUN_SLUG = 0.25
                }
            },
            CompsHash = {
                {
                    w_shotgun_doublebarrel01_wrap1 = 0,
                    w_shotgun_doublebarrel01_sight1 = 0,
                    w_shotgun_doublebarrel01_sight2 = 10,
                    w_shotgun_doublebarrel01_grip1 = 0,
                    w_shotgun_doublebarrel01_grip2 = 10,
                    w_shotgun_doublebarrel01_grip3 = 10,
                    w_shotgun_doublebarrel01_barrel1 = 0,
                    w_shotgun_doublebarrel01_barrel2 = 10,
                    w_shotgun_doublebarrel01_mag1 = 0,
                    w_shotgun_doublebarrel01_mag2 = 10,
                    w_shotgun_doublebarrel01_mag3 = 10
                }
            }
        },
        {
            Name = "Caméra",
            HashName = "WEAPON_KIT_CAMERA",
            WeaponModel = "p_camerabox01x",
            Price = 100.0,
            AmmoHash = {},
            CompsHash = {
                {
                    w_camera_inner01 = 0
                }
            }
        }
    }
}
