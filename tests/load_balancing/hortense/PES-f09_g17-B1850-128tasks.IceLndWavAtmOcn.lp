\* Minimize_ACME_time_cost *\
Minimize
OBJ: TotalTime
Subject To
NatmEqual8NBatm: 8 NBatm - Natm = 0
NatmPlusNocnLessthanMaxTasks: Natm + Nocn = 128
NiceEqual8NBice: 8 NBice - Nice = 0
NicePlusNlndPlusNwavEqualNatm: - Natm + Nice + Nlnd + Nwav = 0
NlndEqual8NBlnd: 8 NBlnd - Nlnd = 0
NocnEqual8NBocn: 8 NBocn - Nocn = 0
NwavEqual8NBwav: 8 NBwav - Nwav = 0
T1PlusTatmEqualTotalTime: T1 + Tatm - TotalTime <= 0
TatmMinus_20TimesNatmGreater4643: 20.89071875 Natm + Tatm >= 4643.866
TatmMinus_37TimesNatmGreater6199: 37.09709375 Natm + Tatm >= 6199.678
TatmMinus_3825TimesNatmGreater248655: 3825.464 Natm + Tatm >= 248655.16
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater100: 0.4068125 Nice + Tice >= 100.739
TiceMinus0TimesNiceGreater136: 0.7751875 Nice + Tice >= 136.103
TiceMinus_154TimesNiceGreater5092: 154.332 Nice + Tice >= 5092.956
TiceMinus_1TimesNiceGreater164: 1.213625 Nice + Tice >= 164.163
TiceMinus_3TimesNiceGreater251: 3.0264375 Nice + Tice >= 251.178
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus_16TimesNlndGreater1288: 16.984625 Nlnd + Tlnd >= 1288.134
TlndMinus_2TimesNlndGreater461: 2.16675 Nlnd + Tlnd >= 461.689
TlndMinus_2TimesNlndGreater541: 2.999125 Nlnd + Tlnd >= 541.597
TlndMinus_744TimesNlndGreater24572: 744.626 Nlnd + Tlnd >= 24572.658
TlndMinus_7TimesNlndGreater842: 7.7011875 Nlnd + Tlnd >= 842.529
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_13TimesNocnGreater2036: 13.38103125 Nocn + Tocn >= 2036.794
TocnMinus_2500TimesNocnGreater82500: 2500.002 Nocn + Tocn >= 82500.066
TocnMinus_41TimesNocnGreater3819: 41.2373125 Nocn + Tocn >= 3819.596
TocnMinus_4TimesNocnGreater1226: 4.937875 Nocn + Tocn >= 1226.251
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater82: - 0.0061875 Nwav + Twav >= 82.191
TwavMinus_82TimesNwavGreater5368: 82.587 Nwav + Twav >= 5368.155
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
