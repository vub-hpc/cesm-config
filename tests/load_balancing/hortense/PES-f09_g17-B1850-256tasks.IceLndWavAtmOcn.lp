\* Minimize_ACME_time_cost *\
Minimize
OBJ: TotalTime
Subject To
NatmEqual8NBatm: 8 NBatm - Natm = 0
NatmPlusNocnLessthanMaxTasks: Natm + Nocn = 256
NiceEqual8NBice: 8 NBice - Nice = 0
NicePlusNlndPlusNwavEqualNatm: - Natm + Nice + Nlnd + Nwav = 0
NlndEqual8NBlnd: 8 NBlnd - Nlnd = 0
NocnEqual8NBocn: 8 NBocn - Nocn = 0
NwavEqual8NBwav: 8 NBwav - Nwav = 0
T1PlusTatmEqualTotalTime: T1 + Tatm - TotalTime <= 0
TatmMinus_10TimesNatmGreater3286: 10.140875 Natm + Tatm >= 3286.416
TatmMinus_1988TimesNatmGreater256501: 1988.384 Natm + Tatm >= 256501.536
TatmMinus_4TimesNatmGreater2171: 4.33478125 Natm + Tatm >= 2171.646
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater108: 0.4700625 Nice + Tice >= 108.026
TiceMinus0TimesNiceGreater124: 0.6396875 Nice + Tice >= 124.31
TiceMinus0TimesNiceGreater56: 0.10090625 Nice + Tice >= 56.343
TiceMinus0TimesNiceGreater69: 0.170140625 Nice + Tice >= 69.636
TiceMinus_83TimesNiceGreater5419: 83.37 Nice + Tice >= 5419.05
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus0TimesNlndGreater213: 0.45565625 Nlnd + Tlnd >= 213.829
TlndMinus0TimesNlndGreater294: 0.873484375 Nlnd + Tlnd >= 294.052
TlndMinus_1TimesNlndGreater424: 1.8889375 Nlnd + Tlnd >= 424.03
TlndMinus_351TimesNlndGreater22842: 351.419 Nlnd + Tlnd >= 22842.235
TlndMinus_3TimesNlndGreater568: 3.39771875 Nlnd + Tlnd >= 568.873
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_1175TimesNocnGreater76380: 1175.09 Nocn + Tocn >= 76380.85
TocnMinus_2TimesNocnGreater892: 2.3170234375 Nocn + Tocn >= 892.23
TocnMinus_9TimesNocnGreater1754: 9.053734375 Nocn + Tocn >= 1754.529
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater47: 0.030234375 Nwav + Twav >= 47.168
TwavMinus0TimesNwavGreater75: 0.17959375 Nwav + Twav >= 75.845
TwavMinus_52TimesNwavGreater6818: 52.857 Nwav + Twav >= 6818.553
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
