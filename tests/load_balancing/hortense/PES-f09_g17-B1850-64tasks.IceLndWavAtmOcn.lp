\* Minimize_ACME_time_cost *\
Minimize
OBJ: TotalTime
Subject To
NatmEqual8NBatm: 8 NBatm - Natm = 0
NatmPlusNocnLessthanMaxTasks: Natm + Nocn = 64
NiceEqual8NBice: 8 NBice - Nice = 0
NicePlusNlndPlusNwavEqualNatm: - Natm + Nice + Nlnd + Nwav = 0
NlndEqual8NBlnd: 8 NBlnd - Nlnd = 0
NocnEqual8NBocn: 8 NBocn - Nocn = 0
NwavEqual8NBwav: 8 NBwav - Nwav = 0
T1PlusTatmEqualTotalTime: T1 + Tatm - TotalTime <= 0
TatmMinus_132TimesNatmGreater12635: 132.9789375 Natm + Tatm >= 12635.149
TatmMinus_7719TimesNatmGreater254758: 7719.968 Natm + Tatm >= 254758.944
TatmMinus_91TimesNatmGreater10655: 91.738 Natm + Tatm >= 10655.584
TiceEqualT1: - T1 + Tice <= 0
TiceMinus5TimesNiceGreater_10: - 5.303625 Nice + Tice >= -10.705
TiceMinus_18TimesNiceGreater739: 18.151625 Nice + Tice >= 739.863
TiceMinus_357TimesNiceGreater6071: 357.147 Nice + Tice >= 6071.499
TiceMinus_6TimesNiceGreater462: 6.615375 Nice + Tice >= 462.993
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus_1630TimesNlndGreater27726: 1630.969 Nlnd + Tlnd >= 27726.473
TlndMinus_16TimesNlndGreater1459: 16.298625 Nlnd + Tlnd >= 1459.308
TlndMinus_42TimesNlndGreater2314: 42.716875 Nlnd + Tlnd >= 2314.439
TlndMinus_5TimesNlndGreater919: 5.0571875 Nlnd + Tlnd >= 919.719
TlndMinus_66TimesNlndGreater2883: 66.418125 Nlnd + Tlnd >= 2883.269
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_174TimesNocnGreater8115: 174.7813125 Nocn + Tocn >= 8115.987
TocnMinus_45TimesNocnGreater3983: 45.65296875 Nocn + Tocn >= 3983.88
TocnMinus_5319TimesNocnGreater90431: 5319.486 Nocn + Tocn >= 90431.262
TwavEqualT1: - T1 + Twav <= 0
TwavMinus8TimesNwavGreater_140: - 8.7604375 Nwav + Twav >= -140.593
TwavMinus_139TimesNwavGreater4611: 139.741 Nwav + Twav >= 4611.453
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
