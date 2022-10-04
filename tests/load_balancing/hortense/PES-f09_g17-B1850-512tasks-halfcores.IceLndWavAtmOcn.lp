\* Minimize_ACME_time_cost *\
Minimize
OBJ: TotalTime
Subject To
NatmEqual8NBatm: 8 NBatm - Natm = 0
NatmPlusNocnLessthanMaxTasks: Natm + Nocn = 512
NiceEqual8NBice: 8 NBice - Nice = 0
NicePlusNlndPlusNwavEqualNatm: - Natm + Nice + Nlnd + Nwav = 0
NlndEqual8NBlnd: 8 NBlnd - Nlnd = 0
NocnEqual8NBocn: 8 NBocn - Nocn = 0
NwavEqual8NBwav: 8 NBwav - Nwav = 0
T1PlusTatmEqualTotalTime: T1 + Tatm - TotalTime <= 0
TatmMinus_1043TimesNatmGreater268062: 1043.045 Natm + Tatm >= 268062.565
TatmMinus_1TimesNatmGreater1217: 1.35221031843 Natm + Tatm >= 1217.61776228
TatmMinus_2TimesNatmGreater1732: 2.69278125 Natm + Tatm >= 1732.397
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater30: 0.0286710193525 Nice + Tice >= 30.1056714314
TiceMinus0TimesNiceGreater38: 0.0513984375 Nice + Tice >= 38.833
TiceMinus0TimesNiceGreater47: 0.08628125 Nice + Tice >= 47.763
TiceMinus0TimesNiceGreater71: 0.2100625 Nice + Tice >= 71.529
TiceMinus_44TimesNiceGreater5758: 44.641 Nice + Tice >= 5758.689
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus0TimesNlndGreater112: 0.105273778764 Nlnd + Tlnd >= 112.145131045
TlndMinus0TimesNlndGreater143: 0.18728125 Nlnd + Tlnd >= 143.636
TlndMinus0TimesNlndGreater218: 0.48109375 Nlnd + Tlnd >= 218.852
TlndMinus0TimesNlndGreater289: 0.847015625 Nlnd + Tlnd >= 289.109
TlndMinus_180TimesNlndGreater23309: 180.691 Nlnd + Tlnd >= 23309.139
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus0TimesNocnGreater442: 0.563426074973 Nocn + Tocn >= 442.674075193
TocnMinus_2TimesNocnGreater856: 2.1808984375 Nocn + Tocn >= 856.747
TocnMinus_577TimesNocnGreater74509: 577.592 Nocn + Tocn >= 74509.368
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater38: 0.0223074952496 Nwav + Twav >= 38.3090781758
TwavMinus0TimesNwavGreater42: 0.034109375 Nwav + Twav >= 42.841
TwavMinus_34TimesNwavGreater8766: 34.109 Nwav + Twav >= 8766.013
Bounds
 1 <= NBatm
 1 <= NBice
 1 <= NBlnd
 1 <= NBocn
 1 <= NBwav
 1 <= Natm
 1 <= Nice
 1 <= Nlnd
 1 <= Nocn
 1 <= Nwav
Generals
NBatm
NBice
NBlnd
NBocn
NBwav
Natm
Nice
Nlnd
Nocn
Nwav
End
