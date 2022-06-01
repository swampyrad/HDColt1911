// ------------------------------------------------------------
// Colt 1911 Ammo (Just the magazines)
// -- ----------------------------------------------------------

const enc_1911MAG=ENC_45ACP*8;
const enc_1911MAG_EMPTY=enc_1911MAG*0.3;

const enc_1911MAG_LOADED=enc_1911MAG_EMPTY*0.1;


class HDColtMag7:HDMagAmmo{
	default{
		//$Category "Ammo/Hideous Destructor/"
		//$Title "Colt 1911 Magazine"
		//$Sprite "CMG7A0"
		hdmagammo.maxperunit 7;
		hdmagammo.roundtype "HD45ACPAmmo";
		hdmagammo.roundbulk enc_45ACP_LOADED;
		hdmagammo.magbulk enc_1911MAG_EMPTY;
		tag "Colt 1911 magazine";
		inventory.pickupmessage "Picked up a Colt 1911 magazine.";
		hdpickup.refid "CM7";
   scale 0.45;
	}
	override string,string,name,double getmagsprite(int thismagamt){
		string magsprite=(thismagamt>0)?"CMG7NORM":"CMG7MPTY";
		return magsprite,"45RNA0","HD45ACPAmmo",0.6;
	}
	override void GetItemsThatUseThis(){
		itemsthatusethis.push("HDColt1911");
	}
	states{
	spawn:
	CMG7	 A -1;
		stop;
	spawnempty:
		CMG7 B -1{
			brollsprite=true;brollcenter=true;
			roll=randompick(0,0,0,0,2,2,2,2,1,3)*90;
		}stop;
	}
}


class HDColt1911EmptyMag:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"HDColtMag7",0);
		destroy();
	}
}
