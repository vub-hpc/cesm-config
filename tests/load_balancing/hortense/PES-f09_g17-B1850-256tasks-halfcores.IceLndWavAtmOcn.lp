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
TatmMinus_1963TimesNatmGreater253243: 1963.131 Natm + Tatm >= 253243.899
TatmMinus_4TimesNatmGreater2149: 4.28771875 Natm + Tatm >= 2149.222
TatmMinus_9TimesNatmGreater3237: 9.955484375 Natm + Tatm >= 3237.433
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater128: 0.71959375 Nice + Tice >= 128.191
TiceMinus0TimesNiceGreater43: 0.05753125 Nice + Tice >= 43.183
TiceMinus0TimesNiceGreater72: 0.20984375 Nice + Tice >= 72.427
TiceMinus0TimesNiceGreater99: 0.42321875 Nice + Tice >= 99.739
TiceMinus_82TimesNiceGreater5338: 82.137 Nice + Tice >= 5338.905
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus0TimesNlndGreater193: 0.35471875 Nlnd + Tlnd >= 193.622
TlndMinus0TimesNlndGreater293: 0.87296875 Nlnd + Tlnd >= 293.126
TlndMinus_1TimesNlndGreater411: 1.79659375 Nlnd + Tlnd >= 411.35
TlndMinus_348TimesNlndGreater22628: 348.129 Nlnd + Tlnd >= 22628.385
TlndMinus_3TimesNlndGreater566: 3.414125 Nlnd + Tlnd >= 566.633
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_1171TimesNocnGreater76155: 1171.626 Nocn + Tocn >= 76155.69
TocnMinus_2TimesNocnGreater861: 2.186328125 Nocn + Tocn >= 861.223
TocnMinus_9TimesNocnGreater1761: 9.222703125 Nocn + Tocn >= 1761.879
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater12: - 0.13603125 Nwav + Twav >= 12.37
TwavMinus0TimesNwavGreater73: 0.18359375 Nwav + Twav >= 73.738
TwavMinus_50TimesNwavGreater6480: 50.238 Nwav + Twav >= 6480.702
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
