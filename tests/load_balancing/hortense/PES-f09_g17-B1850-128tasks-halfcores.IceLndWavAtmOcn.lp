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
TatmMinus_20TimesNatmGreater4630: 20.7674375 Natm + Tatm >= 4630.584
TatmMinus_36TimesNatmGreater6117: 36.26021875 Natm + Tatm >= 6117.891
TatmMinus_3797TimesNatmGreater246820: 3797.237 Natm + Tatm >= 246820.405
TiceEqualT1: - T1 + Tice <= 0
TiceMinus0TimesNiceGreater102: 0.44 Nice + Tice >= 102.264
TiceMinus0TimesNiceGreater129: 0.71965625 Nice + Tice >= 129.111
TiceMinus_154TimesNiceGreater5090: 154.27 Nice + Tice >= 5090.91
TiceMinus_1TimesNiceGreater177: 1.4826875 Nice + Tice >= 177.945
TiceMinus_2TimesNiceGreater249: 2.968375 Nice + Tice >= 249.258
TlndEqualT1: - T1 + Tlnd <= 0
TlndMinus_16TimesNlndGreater1271: 16.521375 Nlnd + Tlnd >= 1271.164
TlndMinus_1TimesNlndGreater411: 1.77628125 Nlnd + Tlnd >= 411.54
TlndMinus_3TimesNlndGreater573: 3.463125 Nlnd + Tlnd >= 573.477
TlndMinus_742TimesNlndGreater24501: 742.48 Nlnd + Tlnd >= 24501.84
TlndMinus_7TimesNlndGreater857: 7.8938125 Nlnd + Tlnd >= 857.041
TocnEqualTotalTime: Tocn - TotalTime <= 0
TocnMinus_2503TimesNocnGreater82614: 2503.456 Nocn + Tocn >= 82614.048
TocnMinus_41TimesNocnGreater3841: 41.80375 Nocn + Tocn >= 3841.176
TocnMinus_9TimesNocnGreater1755: 9.21440625 Nocn + Tocn >= 1755.458
TwavEqualT1: - T1 + Twav <= 0
TwavMinus0TimesNwavGreater101: 0.34003125 Nwav + Twav >= 101.621
TwavMinus0TimesNwavGreater114: 0.47328125 Nwav + Twav >= 114.413
TwavMinus_84TimesNwavGreater5467: 84.123 Nwav + Twav >= 5467.995
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
