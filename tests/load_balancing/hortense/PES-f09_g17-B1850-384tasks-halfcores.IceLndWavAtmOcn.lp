\* Minimize_ACME_time_cost *\
Minimize
OBJ: TotalTime
Subject To
NatmEqual8NBatm: 8 NBatm - Natm = 0
NatmPlusNocnLessthanMaxTasks: Natm + Nocn = 384
NiceEqual8NBice: 8 NBice - Nice = 0
NicePlusNlndPlusNwavEqualNatm: - Natm + Nice + Nlnd + Nwav = 0
NlndEqual8NBlnd: 8 NBlnd - Nlnd = 0
NocnEqual8NBocn: 8 NBocn - Nocn = 0
NwavEqual8NBwav: 8 NBwav - Nwav = 0
T1PlusTatmEqualTotalTime: T1 + Tatm - TotalTime <= 0
TatmMinus_1327TimesNatmGreater256150: 1327.203 Natm + Tatm >= 256150.179
TatmMinus_2TimesNatmGreater1562: 2.24238541667 Natm + Tatm >= 1562.651
TatmMinus_4TimesNatmGreater2147: 4.27457291667 Natm + Tatm >= 2147.921
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater36: 0.0453125 Nice + Tice >= 36.421
TiceMinus0TimesNiceGreater49: 0.0905520833333 Nice + Tice >= 49.45
TiceMinus0TimesNiceGreater78: 0.244166666667 Nice + Tice >= 78.944
TiceMinus0TimesNiceGreater90: 0.324270833333 Nice + Tice >= 90.479
TiceMinus_59TimesNiceGreater5756: 59.349 Nice + Tice >= 5756.853
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus0TimesNlndGreater139: 0.189489583333 Nlnd + Tlnd >= 139.678
TlndMinus0TimesNlndGreater206: 0.4206875 Nlnd + Tlnd >= 206.263
TlndMinus0TimesNlndGreater266: 0.732291666667 Nlnd + Tlnd >= 266.091
TlndMinus_1TimesNlndGreater396: 1.63945833333 Nlnd + Tlnd >= 396.723
TlndMinus_239TimesNlndGreater23215: 239.335 Nlnd + Tlnd >= 23215.495
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_1TimesNocnGreater621: 1.10959375 Nocn + Tocn >= 621.472
TocnMinus_3TimesNocnGreater1083: 3.51465625 Nocn + Tocn >= 1083.244
TocnMinus_745TimesNocnGreater72346: 745.837 Nocn + Tocn >= 72346.189
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater36: 0.01940625 Nwav + Twav >= 36.827
TwavMinus0TimesNwavGreater54: 0.0801458333333 Nwav + Twav >= 54.32
TwavMinus_38TimesNwavGreater7513: 38.932 Nwav + Twav >= 7513.876
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
