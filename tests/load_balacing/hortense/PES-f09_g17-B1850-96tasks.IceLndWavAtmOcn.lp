\* Minimize_ACME_time_cost *\
Minimize
OBJ: TotalTime
Subject To
NatmEqual12NBatm: 12 NBatm - Natm = 0
NatmPlusNocnLessthanMaxTasks: Natm + Nocn = 96
NiceEqual12NBice: 12 NBice - Nice = 0
NicePlusNlndPlusNwavEqualNatm: - Natm + Nice + Nlnd + Nwav = 0
NlndEqual12NBlnd: 12 NBlnd - Nlnd = 0
NocnEqual12NBocn: 12 NBocn - Nocn = 0
NwavEqual12NBwav: 12 NBwav - Nwav = 0
T1PlusTatmEqualTotalTime: T1 + Tatm - TotalTime <= 0
TatmMinus_38TimesNatmGreater6328: 38.6968333333 Natm + Tatm >= 6328.487
TatmMinus_5206TimesNatmGreater255125: 5206.64 Natm + Tatm >= 255125.36
TatmMinus_69TimesNatmGreater8535: 69.346875 Natm + Tatm >= 8535.29
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater129: 0.6865 Nice + Tice >= 129.859
TiceMinus_1TimesNiceGreater163: 1.14904166667 Nice + Tice >= 163.162
TiceMinus_222TimesNiceGreater5566: 222.648 Nice + Tice >= 5566.2
TiceMinus_3TimesNiceGreater287: 3.74925 Nice + Tice >= 287.972
TiceMinus_5TimesNiceGreater361: 5.80408333333 Nice + Tice >= 361.946
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus_1015TimesNlndGreater25391: 1015.643 Nlnd + Tlnd >= 25391.075
TlndMinus_14TimesNlndGreater1195: 14.9228333333 Nlnd + Tlnd >= 1195.545
TlndMinus_29TimesNlndGreater1730: 29.7766666667 Nlnd + Tlnd >= 1730.283
TlndMinus_3TimesNlndGreater560: 3.21275 Nlnd + Tlnd >= 560.226
TlndMinus_6TimesNlndGreater779: 6.26420833333 Nlnd + Tlnd >= 779.931
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_17TimesNocnGreater2446: 17.6404166667 Nocn + Tocn >= 2446.206
TocnMinus_2967TimesNocnGreater74199: 2967.984 Nocn + Tocn >= 74199.6
TocnMinus_57TimesNocnGreater4336: 57.0215833333 Nocn + Tocn >= 4336.502
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater84: 0.211291666667 Nwav + Twav >= 84.82
TwavMinus_1TimesNwavGreater153: 1.16829166667 Nwav + Twav >= 153.724
TwavMinus_97TimesNwavGreater4784: 97.646 Nwav + Twav >= 4784.654
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
