//Per_miner_var
//
//by: VarsityPuppet
//
//This script will give a random appearance to the dead miners you find on Peragus. I think it adds a nice touch.
//This will not work for all miners. Some, like the Security Officer, Coorta and his thugs, the medical officer, etc... they'll look the same every time.

void ChangeAppearance(object Changee);

void main(){
ChangeAppearance(OBJECT_SELF);

}

void ChangeAppearance(object Changee){

int Appr;
int Gender;
//string sTag = GetTag(OBJECT_SELF);

//SetIsDestroyable(FALSE, FALSE, FALSE);
//DelayCommand(0.3,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(1,1,1), OBJECT_SELF));

Gender = Random(4);

//For random numbers 0-16, a specific value is assigned to
//int Appr. The values are appearance rows.
if(Gender <= 2){
switch (Random(16))
{
case 0:
Appr = 136;
break;
case 1:
Appr = 139;
break;
case 2:
Appr = 142;
break;
case 3:
Appr = 145;
break;
case 4:
Appr = 148;
break;
case 5:
Appr = 151;
break;
case 6:
Appr = 154;
break;
case 7:
Appr = 157;
break;
case 8:
Appr = 160;
break;
case 9:
Appr = 163;
break;
case 10:
Appr = 166;
break;
case 11:
Appr = 169;
break;
case 12:
Appr = 172;
break;
case 13:
Appr = 175;
break;
case 14:
Appr = 178;
break;
case 15:
Appr = 543; 
break;
case 16:
Appr = 578; 
break;
default:
Appr = 136;
break;
}
}

/*else */if (Gender >= 3){

//Same as above, but for females.
switch (Random(17))
{

case 0:
Appr = 91;
break;
case 1:
Appr = 94;
break;
case 2:
Appr = 97;
break;
case 3:
Appr = 100;
break;
case 4:
Appr = 103;
break;
case 5:
Appr = 106;
break;
case 6:
Appr = 109;
break;
case 7:
Appr = 112;
break;
case 8:
Appr = 115;
break;
case 9:
Appr = 118;
break;
case 10:
Appr = 121;
break;
case 11:
Appr = 124;
break;
case 12:
Appr = 127;
break;
case 13:
Appr = 130;
break;
case 14:
Appr = 133;
break;
case 15:
Appr = 663; 
break;
case 16:
Appr = 666; 
break;
case 17:
Appr = 546; 
break;
default:
Appr = 91;
break;
}
}
//else if (Gender == 0){
//  ChangeAppearance(OBJECT_SELF);
//}
ChangeObjectAppearance(Changee, Appr);

	int PCAppr = GetAppearanceType(GetFirstPC());


	if( Appr == PCAppr || Appr+1 == PCAppr || Appr+2 == PCAppr ){

		ChangeAppearance(OBJECT_SELF);

	}


SetIsDestroyable(FALSE, FALSE, FALSE);
DelayCommand(0.3,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(1,1,1), OBJECT_SELF));
SendMessageToPC(GetFirstPC(),"Appearance : "+IntToString(Appr));

}





