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
TatmMinus_1061TimesNatmGreater272928: 1061.978 Natm + Tatm >= 272928.346
TatmMinus_1TimesNatmGreater1245: 1.31035634834 Natm + Tatm >= 1245.00883776
TatmMinus_2TimesNatmGreater1702: 2.501140625 Natm + Tatm >= 1702.27
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater33: 0.0342659836329 Nice + Tice >= 33.628137715
TiceMinus0TimesNiceGreater44: 0.061796875 Nice + Tice >= 44.477
TiceMinus0TimesNiceGreater45: 0.0639609375 Nice + Tice >= 45.031
TiceMinus0TimesNiceGreater72: 0.208203125 Nice + Tice >= 72.587
TiceMinus_45TimesNiceGreater5925: 45.937 Nice + Tice >= 5925.873
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus0TimesNlndGreater114: 0.118614055683 Nlnd + Tlnd >= 114.405797382
TlndMinus0TimesNlndGreater154: 0.2240078125 Nlnd + Tlnd >= 154.877
TlndMinus0TimesNlndGreater216: 0.465296875 Nlnd + Tlnd >= 216.647
TlndMinus0TimesNlndGreater292: 0.860234375 Nlnd + Tlnd >= 292.475
TlndMinus_182TimesNlndGreater23525: 182.365 Nlnd + Tlnd >= 23525.085
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus0TimesNocnGreater454: 0.575560605766 Nocn + Tocn >= 454.203515076
TocnMinus_2TimesNocnGreater873: 2.2143984375 Nocn + Tocn >= 873.746
TocnMinus_590TimesNocnGreater76149: 590.303 Nocn + Tocn >= 76149.087
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater41: 0.0272438007924 Nwav + Twav >= 41.9206195043
TwavMinus0TimesNwavGreater47: 0.042625 Nwav + Twav >= 47.827
TwavMinus_36TimesNwavGreater9487: 36.915 Nwav + Twav >= 9487.155
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
