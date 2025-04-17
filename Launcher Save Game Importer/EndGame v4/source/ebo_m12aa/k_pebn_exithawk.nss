// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	int nGlobal = GetGlobalNumber("K_CURRENT_PLANET");
	sub1(("On Planet " + IntToString(nGlobal)), 10, 10, 4.0);
	if ((nGlobal == 5)) {
		StartNewModule("", "k_end_ebon_hawk_transition", "", "", "", "", "", "");
	}
	else {
		if ((nGlobal == 10)) {
			StartNewModule("tar_m02aa", "k_tar_ebon_hawk_transition", "", "", "", "", "", "");
		}
		else {
			if ((nGlobal == 15)) {
				StartNewModule("danm13", "k_dan_ebon_hawk_transition", "", "", "", "", "", "");
			}
			else {
				if ((nGlobal == 20)) {
					StartNewModule("kas_m22aa", "k_kas_ebon_hawk_transition", "", "", "", "", "", "");
				}
				else {
					if ((nGlobal == 25)) {
						StartNewModule("manm26ad", "k_man_ebon_hawk_transition", "", "", "", "", "", "");
					}
					else {
						if ((nGlobal == 30)) {
							StartNewModule("korr_m33aa", "k_kor_ebon_hawk_transition", "", "", "", "", "", "");
						}
						else {
							if ((nGlobal == 35)) {
								StartNewModule("tat_m17ab", "k_tat_ebon_hawk_transition", "", "", "", "", "", "");
							}
							else {
								if ((nGlobal == 40)) {
									StartNewModule("lev_40ac", "k_lev_ebon_hawk_transition", "", "", "", "", "", "");
								}
								else {
									if ((nGlobal == 45)) {
//check if the player has finished the game.
if(GetGlobalNumber("K_KOTOR_MASTER")<=59)
{//
										StartNewModule("unk_m41aa", "k_unk_ebon_hawk_transition", "", "", "", "", "", "");
}
else{
StartNewModule("unk_m41aa", "", "", "", "", "", "", "");
}
									}
									else {
										if ((nGlobal == 50)) {
											StartNewModule("sta_m45aa", "k_sta_ebon_hawk_transition", "", "", "", "", "", "");
										}
										else {
											if ((nGlobal == 55)) {
												StartNewModule("liv_m99aa", "k_live1_ebon_hawk_transition", "", "", "", "", "", "");
											}
											else {
												if ((nGlobal == 60)) {
													StartNewModule("liv_m99ab", "k_live2_ebon_hawk_transition", "", "", "", "", "", "");
												}
												else {
													if ((nGlobal == 65)) {
														StartNewModule("liv_m99ac", "k_live3_ebon_hawk_transition", "", "", "", "", "", "");
													}
													else {
														if ((nGlobal == 70)) {
															StartNewModule("liv_m99ad", "k_live4_ebon_hawk_transition", "", "", "", "", "", "");
														}
														else {
															if ((nGlobal == 75)) {
																StartNewModule("liv_m99ae", "k_live5_ebon_hawk_transition", "", "", "", "", "", "");
															}
															else {
																if ((nGlobal == 80)) {
																	StartNewModule("liv_m99af", "k_live6_ebon_hawk_transition", "", "", "", "", "", "");
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

