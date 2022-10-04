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
TatmMinus_1337TimesNatmGreater258058: 1337.09 Natm + Tatm >= 258058.37
TatmMinus_2TimesNatmGreater1585: 2.21129166667 Natm + Tatm >= 1585.48
TatmMinus_4TimesNatmGreater2114: 4.04647916667 Natm + Tatm >= 2114.014
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater37: 0.0432395833333 Nice + Tice >= 37.911
TiceMinus0TimesNiceGreater50: 0.0872916666667 Nice + Tice >= 50.598
TiceMinus0TimesNiceGreater76: 0.221416666667 Nice + Tice >= 76.35
TiceMinus0TimesNiceGreater89: 0.311270833333 Nice + Tice >= 89.289
TiceMinus_59TimesNiceGreater5762: 59.407 Nice + Tice >= 5762.479
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus0TimesNlndGreater145: 0.20096875 Nlnd + Tlnd >= 145.003
TlndMinus0TimesNlndGreater209: 0.424614583333 Nlnd + Tlnd >= 209.413
TlndMinus0TimesNlndGreater275: 0.769166666667 Nlnd + Tlnd >= 275.567
TlndMinus_1TimesNlndGreater391: 1.57652083333 Nlnd + Tlnd >= 391.826
TlndMinus_240TimesNlndGreater23326: 240.48 Nlnd + Tlnd >= 23326.56
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_1TimesNocnGreater632: 1.10739583333 Nocn + Tocn >= 632.102
TocnMinus_3TimesNocnGreater1110: 3.59742708333 Nocn + Tocn >= 1110.188
TocnMinus_764TimesNocnGreater74188: 764.835 Nocn + Tocn >= 74188.995
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater1: - 0.112645833333 Nwav + Twav >= 1.358
TwavMinus0TimesNwavGreater70: 0.1269375 Nwav + Twav >= 70.358
TwavMinus_45TimesNwavGreater8875: 45.986 Nwav + Twav >= 8875.298
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
